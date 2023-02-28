<template>
	<footer>
		<Logo />
		Made by
		<a href="https://github.com/iasfk" class="footer-name" target="_blank"
			>Y.I, Park</a
		>
		&
		<a href="https://github.com/minoarchive" class="footer-name" target="_blank"
			>M.H, Jang</a
		>
	</footer>
</template>

<script>
import Logo from '@/components/common/LogoComponent.vue';

export default {
	components: {
		Logo,
	},
};
</script>

<style lang="scss" scoped>
footer {
	padding: 70px 0;
	text-align: center;
	opacity: 0.3;
	.logo {
		display: block;
		margin-bottom: 4px;
	}
}
</style>
