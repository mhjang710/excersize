<template>
	<router-link to="/" class="logo">Exer<span>SIZE</span></router-link>
</template>

<style lang="scss" scoped>
.logo {
	font-family: 'Oswald', sans-serif;
	font-size: 20px;
	color: #457b9d;
	text-decoration: none;
	&:hover {
		color: $primary;
	}
	span {
		color: $primary;
		font-style: italic;
	}
}
</style>
