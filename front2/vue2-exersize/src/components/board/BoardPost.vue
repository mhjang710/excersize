<template>
	<div class="container">
		<h1><span>Write</span> a Post</h1>
		<div class="row g-2">
			<div class="col-md">
				<div class="form-floating">
					<input
						type="text"
						class="form-control"
						id="floatingTitleGrid"
						placeholder="Title"
						v-model="title"
					/>
					<label for="floatingTitleGrid">제목</label>
				</div>
			</div>
			<div class="col-md">
				<div class="form-floating">
					<input
						type="text"
						class="form-control"
						id="floatingUserIdGrid"
						placeholder="userId"
						v-model="this.userId"
						disabled
					/>
					<label for="floatingUserIdGrid">작성자</label>
				</div>
			</div>
			<div class="col-md">
				<div class="form-floating">
					<input
						type="text"
						class="form-control"
						id="floatingRegDateGrid"
						placeholder="RegDate"
						:value="getDate()"
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
				v-model="content"
			></textarea>
			<label for="floatingTextarea">글작성</label>
		</div>
		<button class="btn btn-primary" @click="createBoard">Post</button>
	</div>
</template>

<script>
export default {
	name: 'BoardCreate',
	data() {
		return {
			title: '',
			userId: this.$store.state.auth.user.config.params.userId,
			content: '',
		};
	},
	methods: {
		createBoard() {
			let newBoard = {
				id: this.userId,
				title: this.title,
				content: this.content,
			};

			this.$store.dispatch('createBoard', newBoard);
		},
		getDate() {
			const dt = new Date();
			let date =
				dt.getFullYear() + '-' + (dt.getMonth() + 1) + '-' + dt.getDate();
			return date;
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
