<template>
	<div class="container">
		<Headline />
		<div class="inner">
			<div class="list-box">
				<div
					class="lists"
					v-for="list in likeLists"
					:key="list.id"
					:list="list"
				>
					<router-link
						:to="`/detail/${list.id}`"
						:style="{
							backgroundImage: `url(https://img.youtube.com/vi/${list.id}/mqdefault.jpg)`,
						}"
						class="like-list-video"
						><div class="video-box"></div>
					</router-link>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import { mapState } from 'vuex';
import Headline from '@/components/video/VideoExploreHeadline.vue';

export default {
	components: {
		Headline,
	},
	data() {
		return {
			message: 'No Like Lists',
		};
	},
	computed: {
		...mapState(['likeLists']),
	},
	created() {
		this.$store.dispatch(
			'getLikeLists',
			this.$store.state.auth.user.config.params.userId
		);
	},
};
</script>

<style lang="scss" scoped>
.inner {
	background-color: rgba(#f5cac3, 0.5);
	padding: 10px 0;
	border-radius: 4px;
	text-align: center;
	.message {
		color: $gray-400;
		font-size: 20px;
	}
	.list-box {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}

	.lists {
		display: flex;
	}
}

.like-list-video {
	$width: 400px;
	width: $width;
	height: calc($width * 9 / 16);
	margin: 10px;
	border-radius: 4px;
	background-color: $gray-400;
	background-size: cover;
	overflow: hidden;
	position: relative;
	&:hover::after {
		content: '';
		position: absolute;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		border: 6px solid #457b9d;
	}
}
</style>
