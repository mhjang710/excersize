<template>
	<div class="container">
		<h1>
			<span class="exer">Exer</span><span class="size">SIZE</span><br />
			Best Recommendation for Your Health!
		</h1>
		<p>
			We will find it for you who can't find exercise videos by yourself. Just
			let us know the part you want to do.
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
