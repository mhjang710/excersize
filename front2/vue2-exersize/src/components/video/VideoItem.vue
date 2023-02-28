<template>
	<router-link
		:to="`/detail/${video.id.videoId}`"
		:style="{ backgroundImage: `url(${video.snippet.thumbnails.medium.url})` }"
		class="video"
	>
		<div class="info">
			<div class="title"> {{ video.snippet.title }}</div>
		</div>
	</router-link>
</template>

<script>
export default {
	props: {
		video: {
			type: Object,
			default: () => ({}),
		},
	},
	mounted() {
		this.init();
	},
};
</script>

<style lang="scss" scoped>
.video {
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
	.info {
		background-color: rgba($black, 0.3);
		width: 100%;
		padding: 14px;
		font-size: 14px;
		text-align: center;
		position: absolute;
		left: 0;
		bottom: 0;
		backdrop-filter: blur(10px);
		.title {
			color: $white;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}
	}
}
</style>
