<template>
	<div class="container">
		<div :class="{ 'no-result': !videos.length }" class="inner">
			<Loader v-if="loading" />
			<div v-if="message" class="message"> {{ message }}</div>
			<div v-else class="videos">
				<VideoItem
					v-for="video in videos"
					:key="video.id.videoId"
					:video="video"
				/>
			</div>
		</div>
	</div>
</template>

<script>
import { mapState } from 'vuex';
import VideoItem from '@/components/video/VideoItem';
import Loader from '@/components/common/LoaderComponent';

export default {
	components: {
		VideoItem,
		Loader,
	},
	computed: {
		...mapState('video', ['videos', 'message', 'loading']),
	},
};
</script>

<style lang="scss" scoped>
.container {
	margin-top: 30px;
	.inner {
		background-color: $gray-200;
		padding: 10px 0;
		border-radius: 4px;
		text-align: center;
		&.no-result {
			padding: 70px 0;
		}
	}
	.message {
		color: $gray-400;
		font-size: 20px;
	}
	.videos {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}
}
</style>
