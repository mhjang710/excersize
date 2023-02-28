<template>
	<div class="about">
		<div class="profile">
			<div class="photo">
				<Loader absolute />
				<img src="@/assets/yein.png" :alt="name[0]" />
			</div>
			<div class="name">
				{{ name[0] }}
			</div>
			<div>{{ email[0] }}</div>
			<div>{{ github[0] }}</div>
		</div>
		<div class="profile mino">
			<div class="photo">
				<Loader absolute />
				<img :src="image[1]" :alt="name[1]" />
			</div>
			<div class="name">
				{{ name[1] }}
			</div>
			<div>{{ email[1] }}</div>
			<div>{{ github[1] }}</div>
		</div>
	</div>
</template>

<script>
import { mapState } from 'vuex';

export default {
	computed: {
		...mapState('about', ['image', 'name', 'email', 'github']),
	},
};
</script>

<style lang="scss" scoped>
.about {
	display: flex;
	justify-content: center;
	.profile {
		text-align: center;
		.photo {
			width: 250px;
			height: 250px;
			margin: 40px auto 20px;
			padding: 30px;
			border: 10px solid $gray-300;
			border-radius: 50%;
			box-sizing: border-box;
			background-color: $gray-200;
			position: relative;
			img {
				width: 100%;
			}
		}
		.name {
			font-size: 40px;
			font-family: 'Oswald', sans-serif;
			margin-bottom: 20px;
		}
	}
	.mino {
		margin-left: 200px;
	}
}
</style>
