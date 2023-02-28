<template>
	<!-- <div class="container"> -->
	<div class="col-md-12">
		<div class="card card-container">
			<h1>Login</h1>
			<form name="form" @submit.prevent="handleLogin">
				<div class="form-group">
					<label for="username">ID</label>
					<input
						type="text"
						class="form-control"
						name="userId"
						v-model="userId"
						v-validate="'required'"
					/>
					<div
						class="alert alert-danger"
						role="alert"
						v-if="errors.has('userId')"
						>ID가 필요합니다!</div
					>
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input
						type="password"
						class="form-control"
						name="password"
						v-model="pw"
						v-validate="'required'"
					/>
					<div class="alert alert-danger" role="alert" v-if="errors.has('pw')"
						>비밀번호가 필요합니다!</div
					>
				</div>
				<div class="form-group">
					<button class="btn btn-primary btn-block" :disabled="loading">
						<span
							class="spinner-border spinner-border-sm"
							v-show="loading"
						></span>
						<span>Login</span>
					</button>
				</div>
				<div class="form-group">
					<div class="alert alert-danger" role="alert" v-if="message">{{
						message
					}}</div>
				</div>
			</form>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			userId: '',
			pw: '',
			loading: false,
			message: '',
		};
	},
	mounted() {
		if (this.loggedIn) {
			this.$router.push('/');
		}
	},
	computed: {
		loggedIn() {
			return this.$store.state.auth.status.loggedIn;
		},
	},
	methods: {
		handleLogin() {
			let user = {
				userId: this.userId,
				pw: this.pw,
			};
			this.loading = true;
			this.$validator.validateAll();

			if (this.errors.any()) {
				this.loading = false;
				return;
			}
			if (user.userId && user.pw) {
				this.$store.dispatch('auth/login', user).then((error) => {
					this.loading = false;
					console.log(error);
					this.message = error.message;
				});
			}
		},
	},
};
</script>

<style lang="scss" scoped>
h1 {
	text-align: center;
	line-height: 1;
	font-family: 'Oswald', sans-serif;
	font-size: 50px;
	margin-bottom: 30px;
}

.btn {
	font-weight: 700;
	margin: 40px auto auto;
	display: block;
}
label {
	display: block;
	margin-top: 10px;
	font-weight: 700;
}
.card-container.card {
	max-width: 400px;
	padding: 50px 50px;
}

.card {
	background-color: #f7f7f7;
	padding: 20px 25px 30px;
	margin: 0 auto 25px;
	margin-top: 50px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
</style>
