<template>
	<div class="container">
		<input
			v-model="title"
			class="form-control"
			type="text"
			placeholder="Search for Your Health!"
			@keyup.enter="search"
		/>
		<div class="selects">
			<select
				v-for="filter in filters"
				v-model="$data[filter.name]"
				:key="filter.name"
				class="form-select"
			>
				<option v-if="filter.name === 'type'" value="">전체</option>
				<option v-for="item in filter.items" :key="item"> {{ item }}</option>
			</select>
		</div>
		<button class="btn btn-primary" @click="search">Search</button>
	</div>
</template>

<script>
export default {
	data() {
		return {
			title: '',
			type: '',
			number: 5,
			filters: [
				{
					name: 'type',
					items: ['상체', '하체', '전신', '복부'],
				},
				{
					name: 'number',
					items: [5, 10, 15, 20],
				},
			],
		};
	},
	methods: {
		async search() {
			this.$store.dispatch('video/searchVideos', {
				title: this.title,
				type: this.type,
				number: this.number,
			});
		},
	},
};
</script>

<style lang="scss" scoped>
.container {
	display: flex;
	> * {
		margin-right: 10px;
		font-size: 15px;
		&:last-child {
			margin-right: 0;
		}
	}
	.selects {
		display: flex;
		select {
			width: 120px;
			margin-right: 10px;
			&:last-child {
				margin-right: 0;
			}
		}
	}
	.btn {
		width: 120px;
		height: 50px;
		font-weight: 700;
		flex-shrink: 0;
	}

	@include media-breakpoint-down(lg) {
		display: block;
		input {
			margin-right: 0;
			margin-bottom: 10px;
		}
		.selects {
			margin-right: 0;
			margin-bottom: 10px;
			select {
				width: 100px;
			}
		}
		.btn {
			width: 100%;
		}
	}
}
</style>
