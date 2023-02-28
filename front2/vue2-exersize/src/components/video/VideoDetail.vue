<template>
	<div class="container">
		<template v-if="loading">
			<div class="skeletons">
				<div class="info">
					<div class="skeleton video"></div>
					<div class="skeleton spec">
						<div class="skeleton title"></div>
					</div>
				</div>
				<div class="skeleton comments"> </div>
			</div>
			<Loader :size="3" :z-index="9" fixed />
		</template>

		<div v-else class="video-details">
			<div class="info">
				<div class="video">
					<iframe
						id="ytplayer"
						type="text/html"
						:src="`https://www.youtube.com/embed/${theVideo.id}`"
						frameborder="0"
						allowfullscreen
					></iframe>
				</div>
				<div class="title-box">
					<div class="title">{{ theVideo.snippet.title }} </div>
					<font-awesome-icon
						v-if="isLike"
						icon="fa-heart-circle-check"
						class="icon like-checked"
						@click="deleteLike"
					/>
					<font-awesome-icon
						v-else
						@click="addLike"
						icon="fa-heart "
						class="icon like-not-checked"
					/>
				</div>
			</div>
			<div class="comments-box">
				<div v-if="comments.length">
					<ul class="list overflow-scroll">
						<li
							v-for="comment in pageCommentList"
							:key="comment.id.videoId"
							class="list-group-item"
						>
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1 comm-title">{{
									comment['snippet']['topLevelComment']['snippet'][
										'authorDisplayName'
									]
								}}</h5>
								<small class="comm-date">{{
									dateFormat(
										comment['snippet']['topLevelComment']['snippet'][
											'publishedAt'
										]
									)
								}}</small>
							</div>
							<p class="mb-1 comm-text">{{
								comment['snippet']['topLevelComment']['snippet']['textDisplay']
							}}</p>
						</li>
					</ul>
					<b-pagination
						v-model="currentPage"
						:total-rows="rows"
						:per-page="perPage"
						aria-controls="my-table"
						align="center"
					></b-pagination>
				</div>
				<div v-else>
					<h4>검색 결과가 없습니다.</h4>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import Loader from '@/components/common/LoaderComponent.vue';
import { mapState } from 'vuex';

export default {
	data() {
		return {
			currentPage: 1,
			perPage: 5,
			id: this.$route.params.id,
			userId: this.$store.state.auth.user.config.params.userId,
			isLike: false,
		};
	},
	components: {
		Loader,
	},
	computed: {
		theVideo() {
			return this.$store.state.video.theVideo;
		},
		loading() {
			return this.$store.state.video.loading;
		},
		videos() {
			return this.$store.state.video.videos;
		},
		comments() {
			return this.$store.state.video.comments;
		},
		...mapState(['getComments']),
		rows() {
			return this.comments.length;
		},
		pageCommentList() {
			return this.comments.slice(
				(this.currentPage - 1) * this.perPage,
				this.currentPage * this.perPage
			);
		},
	},
	created() {
		// console.log(this.$route);
		this.$store.dispatch('video/searchVideoWithId', {
			id: this.$route.params.id,
		});
		this.$store.dispatch('video/getComments', this.$route.params.id);
	},
	methods: {
		dateFormat(value) {
			if (value == '') return '';

			let dateFormat = new Date(value);

			let year = dateFormat.getFullYear();
			let month = dateFormat.getMonth() + 1;
			let day = dateFormat.getDate();

			if (month < 10) {
				month = '0' + month;
			}

			if (day < 10) {
				day = '0' + day;
			}

			return year + '-' + month + '-' + day;
		},
		addLike() {
			let info = {
				id: this.id,
				userId: this.userId,
			};
			// console.log('INFO: ');
			// console.log(info);
			this.$store.dispatch('video/addLikeList', info);
			this.isLike = true;
		},
		deleteLike() {
			let info = {
				id: this.id,
				userId: this.userId,
			};
			this.$store.dispatch('video/deleteLike', info);
			this.isLike = false;
		},
	},
};
</script>

<style lang="scss" scoped>
.container {
	padding-top: 40px;
}
.skeletons {
	display: flex;
	.info {
		flex-shrink: 0;
		margin-right: 70px;
	}
	.skeleton {
		border-radius: 10px;
		background-color: $gray-200;
		&.video {
			width: 600px;
			height: calc(600px * 9 / 16);
		}
		&.spec {
			width: 600px;
			height: 50px;
			margin-top: 20px;
		}
		&.comments {
			flex-grow: 1;
			width: 80%;
			height: calc(600px * 9 / 16 + 70px);
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
		}
	}
}

.video-details {
	display: flex;
	.info {
		flex-shrink: 0;
		width: 600px;
		height: 500px;
		margin-right: 40px;
		iframe {
			width: 600px;
			height: calc(600px * 9 / 16);
			border-radius: 10px;
			background-color: $gray-200;
			border: 2px solid $primary;
		}
		.title-box {
			align-items: center;
			display: flex;
			justify-content: space-around;
			margin-top: 20px;
			border: 2px solid $primary;
			border-radius: 10px;
			padding: 15px;
			.title {
				color: $black;
				font-family: 'Noto Sans KR', sans-serif;
				font-size: 18px;
				line-height: 1;
			}
			.icon {
				font-size: 20px;
				padding-left: 15px;
			}
			.like-not-checked {
				color: $primary;
			}
			.like-checked {
				color: #e63946;
			}
		}
	}

	.comments-box {
		width: 600px;
		height: 500px;
		.list {
			border-radius: 10px;
			background-color: $gray-200;
			padding: 0;
			border: 2px solid $primary;
			.comm-title {
				font-size: 15px;
				font-weight: 700;
				font-style: italic;
			}
			.comm-date {
				color: gray;
				font-size: 10px;
			}
			.comm-text {
				font-size: 14px;
			}
		}
	}

	@include media-breakpoint-down(xl) {
		.poster {
			width: 600px;
			height: calc(600px * 9 / 16);
			margin-right: 40px;
		}
	}
	@include media-breakpoint-down(lg) {
		display: block;
		.info {
			margin-bottom: 0px;
		}
	}
	@include media-breakpoint-down(md) {
		.comments-box {
			magin .comm-title {
				font-size: 12px;
			}
			.comm-date {
				color: gray;
				font-size: 7px;
			}
			.comm-text {
				font-size: 11px;
			}
		}
	}
}
</style>
