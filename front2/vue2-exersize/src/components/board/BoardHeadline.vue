<template>
	<div class="container">
		<h1>
			<span class="exer">Exer</span><span class="size">SIZE</span>
			Playground!
		</h1>
		<p>
			It's a great thing to have a friend to share the news of exercise. Why
			don't we have a talk here? I'm sure it will help you make plans to improve
			your health.
		</p>
	</div>
</template>

<style lang="scss" scoped>
.container {
	padding-top: 40px;
}
h1 {
	line-height: 1;
	font-family: 'Oswald', sans-serif;
	font-size: 80px;
	.exer {
		color: #457b9d;
	}
	.size {
		color: $primary;
	}
}
p {
	margin: 30px 0;
	color: $gray-600;
}
</style>
