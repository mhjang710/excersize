<template>
	<div class="container">
		<h1><span>Modify</span> the Post</h1>
		<div class="row g-2">
			<div class="col-md">
				<div class="form-floating">
					<input
						type="text"
						class="form-control"
						id="floatingTitleGrid"
						placeholder="Title"
						v-model="board.title"
					/>
					<label for="floatingTitleGrid">제목</label>
				</div>
			</div>
			<div class="col-md">
				<div class="form-floating">
					<input
						type="text"
						class="form-control"
						id="floatingWriterGrid"
						placeholder="ID"
						v-model="board.id"
						disabled
					/>
					<label for="floatingWriterGrid">작성자</label>
				</div>
			</div>
			<div class="col-md">
				<div class="form-floating">
					<input
						type="text"
						class="form-control"
						id="floatingRegDateGrid"
						placeholder="RegDate"
						:value="board.regDate"
						disabled
					/>
					<label for="floatingRegDateGrid">작성일</label>
				</div>
			</div>
		</div>
		<div class="form-floating">
			<textarea
				class="form-control"
				placeholder="Leave a post here"
				id="floatingTextarea"
				v-model="board.content"
			></textarea>
			<label for="floatingTextarea">글작성</label>
		</div>
		<button class="btn btn-primary" @click="updateBoard">Modify</button>
	</div>
</template>

<script>
import { mapState } from 'vuex';
export default {
	name: 'BoardUpdate',
	computed: {
		...mapState(['board']),
	},
	methods: {
		updateBoard() {
			let updateBoard = {
				num: this.board.num,
				id: this.$store.state.auth.user.config.params.userId,
				title: this.board.title,
				content: this.board.content,
				viewCnt: this.board.viewCnt,
				regDate: this.board.regDate,
			};
			console.log(updateBoard);
			this.$store.dispatch('updateBoard', updateBoard);
		},
	},
};
</script>

<style lang="scss" scoped>
h1 {
	line-height: 1;
	font-family: 'Oswald', sans-serif;
	font-size: 50px;
	font-style: italic;
	border-bottom: 3px solid #1d3557;
	padding-bottom: 10px;
	color: #1d3557;
	span {
		font-style: normal;
		color: #457b9d;
	}
}
.container {
	font-size: 15px;
}
#floatingTextarea {
	height: 400px;
	margin: 10px 0;
}
.btn {
	width: 120px;
	height: 50px;
	font-weight: 700;
	flex-shrink: 0;
	margin: auto;
	display: block;
}
</style>
