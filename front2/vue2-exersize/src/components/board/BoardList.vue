<template>
	<div class="container">
		<BoardHeadline />
		<div class="table-box">
			<router-link to="/board/post" class="btn btn-primary">Post</router-link>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="board in pageBoardList" :key="board.id">
						<td>{{ board.num }}</td>
						<td
							><router-link :to="`/board/${board.num}`">{{
								board.title
							}}</router-link></td
						>
						<td>{{ board.id }}</td>
						<td>{{ dateFormat(board.regDate) }}</td>
						<td>{{ board.viewCnt }}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<b-pagination
			v-model="currentPage"
			:total-rows="rows"
			:per-page="perPage"
			aria-controls="my-table"
			align="center"
		></b-pagination>
		<div class="search-box">
			<input
				v-model="keyword"
				class="form-control"
				type="text"
				placeholder="Search posts"
				@keyup.enter="search"
			/>
			<select v-model="mode" class="form-select">
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">제목+내용</option>
			</select>
			<button class="btn btn-primary" @click="search">Search</button>
		</div>
	</div>
</template>

<script>
import { mapState } from 'vuex';
import BoardHeadline from '@/components/board/BoardHeadline';

export default {
	name: 'BoardList',
	components: {
		BoardHeadline,
	},
	data() {
		return {
			keyword: '',
			mode: 1,
			currentPage: 1,
			perPage: 10,
		};
	},
	computed: {
		...mapState(['boards']),
		rows() {
			return this.boards.length;
		},
		pageBoardList() {
			return this.boards.slice(
				(this.currentPage - 1) * this.perPage,
				this.currentPage * this.perPage
			);
		},
	},
	created() {
		this.$store.dispatch('getBoards');
	},
	methods: {
		search() {
			const payload = {
				mode: this.mode,
				keyword: this.keyword,
			};
			this.$store.dispatch('getBoard', payload);
		},
		dateFormat(value) {
			if (value == '') return '';

			let dateFormat = new Date(value);

			let year = dateFormat.getFullYear();
			let month = dateFormat.getMonth() + 1;
			let day = dateFormat.getDate();

			if (month < 10) {
				month = '0' + month;
			}

			if (day < 10) {
				day = '0' + day;
			}

			return year + '-' + month + '-' + day;
		},
	},
};
</script>

<style lang="scss" scoped>
.container {
	font-size: 15px;
}
.table-box {
	.btn {
		width: 75px;
		height: 40px;
		font-weight: 700;
		float: right;
	}
	table {
		font-family: 'Noto Sans KR', sans-serif;
	}
}

nav {
	display: flex;
	justify-content: center;
}

.search-box {
	display: flex;
	.btn {
		width: 120px;
		height: 50px;
		font-weight: 700;
		flex-shrink: 0;
		margin-left: 10px;
	}
	.form-select {
		width: 100px;
		margin-left: 10px;
	}
}
</style>
