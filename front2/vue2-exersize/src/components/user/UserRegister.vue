<template>
	<div class="col-md-12">
		<div class="card card-container">
			<h1>Sign Up</h1>
			<form name="form" @submit.prevent="handleRegister">
				<div v-if="!successful">
					<div class="form-group">
						<label for="userId">ID</label>
						<input
							type="text"
							class="form-control"
							name="userId"
							v-model="userId"
							v-validate="'required|min:3|max:20'"
						/>
						<div
							class="alert-danger"
							v-if="submitted && errors.has('userId')"
							>{{ errors.first('userId') }}</div
						>
					</div>
					<div class="form-group">
						<label for="pw">Password</label>
						<input
							type="password"
							class="form-control"
							name="pw"
							v-model="pw"
							v-validate="'required|min:6|max:20'"
						/>
						<div class="alert-danger" v-if="submitted && errors.has('pw')">{{
							errors.first('pw')
						}}</div>
					</div>
					<div class="form-group">
						<label for="nickname">Nickname</label>
						<input
							type="text"
							class="form-control"
							name="nickname"
							v-model="nickname"
							v-validate="'required'"
						/>
						<div
							class="alert-danger"
							v-if="submitted && errors.has('nickname')"
							>{{ errors.first('nickname') }}</div
						>
					</div>
					<div class="form-group">
						<button class="btn btn-primary btn-block">Sign Up</button>
					</div>
				</div>
			</form>

			<div
				class="alert"
				:class="successful ? 'alert-success' : 'alert-danger'"
				v-if="message"
				>{{ message }}</div
			>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			userId: '',
			pw: '',
			nickname: '',
			submitted: false,
			successful: false,
			message: '',
		};
	},
	computed: {
		loggedIn() {
			return this.$store.state.auth.status.loggedIn;
		},
	},
	mounted() {
		if (this.loggedIn) {
			this.$router.push('/');
		}
	},
	methods: {
		handleRegister() {
			let user = {
				userId: this.userId,
				pw: this.pw,
				nickname: this.nickname,
			};
			this.message = '';
			this.submitted = true;
			this.$validator.validate().then((valid) => {
				if (valid) {
					this.$store.dispatch('auth/register', user).then(
						(data) => {
							this.message = data.message;
							this.successful = true;
						},
						(error) => {
							this.message = error.message;
							this.successful = false;
						}
					);
				}
			});
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
	max-width: 400px !important;
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
