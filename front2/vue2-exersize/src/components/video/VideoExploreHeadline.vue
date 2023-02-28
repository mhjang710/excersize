<template>
	<div class="container">
		<h1>
			<span class="userId">{{ this.userId }}</span
			><span class="char">'s</span> Favorites!
		</h1>
		<p>
			Search for any videos you're interested in. And if you like the video,
			press the small heart button at the bottom. All the videos you like are
			gathered here waiting for you. If you don't like the video, you can cancel
			it by pressing the small heart button one more time. The canceled video
			disappears from the likes list tab and you can only watch the videos you
			like. Also, click the video to view YouTube comments. These comments will
			greatly help you choose the video. What do you think, isn't our site very
			convenient?
		</p>
	</div>
</template>

<script>
export default {
	data() {
		return {
			userId: this.$store.state.auth.user.config.params.userId,
		};
	},
};
</script>

<style lang="scss" scoped>
.container {
	padding-top: 40px;
}
h1 {
	line-height: 1;
	font-family: 'Oswald', sans-serif;
	font-size: 80px;
	.userId {
		color: #457b9d;
	}
	.char {
		color: $primary;
	}
}
p {
	margin: 30px 0;
	color: $gray-600;
}
</style>
