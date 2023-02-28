<template>
	<div class="container">
		<h1>Post</h1>
		<div class="card">
			<h3 class="card-header"
				>{{ board.title }}<span class="date">{{ board.regDate }}</span
				><span class="viewCnt">조회수: {{ board.viewCnt }}</span>
			</h3>
			<div class="card-body">
				<p class="card-text">{{ board.content }}</p>
			</div>
		</div>
		<div class="btn-box">
			<button type="submit" class="btn btn-primary modify" @click="toUpdate"
				>Modify
			</button>
			<button type="submit" class="btn btn-primary delete" @click="deleteBoard"
				>Delete</button
			>
		</div>
	</div>
</template>

<script>
import { mapState } from 'vuex';

export default {
	name: 'BoardDetail',
	computed: {
		...mapState(['board']),
	},
	created() {
		const pathName = new URL(document.location).pathname.split('/');
		// console.log(pathName);
		const num = pathName[pathName.length - 1];
		// console.log(num);
		this.$store.dispatch('getBoard', num);
	},
	methods: {
		toUpdate() {
			this.$router.push({ name: 'boardUpdate' });
		},
		deleteBoard() {
			this.$store.dispatch('deleteBoard', this.board.num);
		},
	},
};
</script>

<style lang="scss" scoped>
.container {
	font-size: 15px;
}
h1 {
	line-height: 1;
	font-family: 'Oswald', sans-serif;
	font-size: 50px;
	font-style: italic;
	border-bottom: 3px solid #1d3557;
	padding-bottom: 10px;
	color: #1d3557;
}
.btn-box {
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
	.btn {
		width: 90px;
		height: 50px;
		font-weight: 700;
		flex-shrink: 0;
	}
	.modify:hover {
		background-color: #a8dadc;
		border: #a8dadc;
		color: #1d3557;
	}
	.delete {
		background-color: #e63946;
		border: #e63946;
		margin-left: 10px;
		&:hover {
			background-color: #ffc8dd;
			border: #ffc8dd;
			color: #000;
		}
	}
}
.card-header {
	font-weight: 700;
	.date {
		color: #8d99ae;
		font-size: 13px;
		padding: 0 10px;
	}
	.viewCnt {
		font-size: 13px;
		color: #8d99ae;
		padding-left: 10px;
	}
}
</style>
