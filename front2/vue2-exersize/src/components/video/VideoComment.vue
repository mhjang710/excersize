<template>
	<div>
		<video-loader v-if="videoLoading" :size="1.5" absolute />
		<div class="comments">
			{{ comments }}
		</div>
	</div>
</template>

<script>
import VideoLoader from '@/components/common/LoaderComponent';

export default {
	components: {
		VideoLoader,
	},
	props: {
		comment: {
			type: Object,
			default: () => ({}),
		},
	},
	data() {
		return {
			videoLoading: true,
		};
	},
	mounted() {
		this.init();
	},
	methods: {
		async init() {
			const comment = this.comments.snippet;
			if (!comment || comment == 'N/A') {
				this.videoLoading = false;
			} else {
				await this.$loadVideo(comment);
				this.videoLoading = false;
			}
		},
	},
	// computed: {
	// 	comments() {
	// 		return this.$store.state.video.comments;
	// 	},
	// },
	created() {
		// console.log(this.$route);
		this.$store.dispatch('video/getComments', this.$route.params.id);
	},
};
</script>

<style></style>
