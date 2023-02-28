<template>
	<div>
		<video-headline></video-headline>
		<video-search></video-search>
		<video-list></video-list>
	</div>
</template>

<script>
import VideoHeadline from '@/components/video/VideoHeadline';
import VideoSearch from '@/components/video/VideoSearch';
import VideoList from '@/components/video/VideoList';

export default {
	name: 'HomeView',
	components: {
		VideoHeadline,
		VideoSearch,
		VideoList,
	},
	created() {
		this.$store.commit('video/resetVideos');
	},
};
</script>
