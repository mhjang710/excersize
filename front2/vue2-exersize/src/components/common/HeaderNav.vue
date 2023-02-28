<template>
	<header>
		<Logo />
		<div class="nav nav-pills">
			<div v-for="nav in navigations" :key="nav.name" class="nav-item">
				<router-link :to="nav.href" active-class="active" class="nav-link">
					{{ nav.name }}
				</router-link>
			</div>
		</div>
		<div class="login-box">
			<div class="navbar-nav icon-box" v-if="!currentUser">
				<li class="nav-item">
					<router-link to="/register" class="nav-link signup">
						<font-awesome-icon icon="user-plus" /> Sign Up
					</router-link>
				</li>
				<li class="nav-item">
					<router-link to="/login" class="login">
						<font-awesome-icon icon="sign-in-alt" /> Login
					</router-link>
				</li>
			</div>

			<div class="navbar-nav icon-box" v-if="currentUser">
				<li class="nav-item user-info">
					<!-- <font-awesome-icon icon="user" /> -->
					환영합니다,
					<span class="userName">{{ currentUser.config.params.userId }}</span
					>님!
				</li>
				<li class="nav-item">
					<a href class="nav-link" @click="logOut">
						<font-awesome-icon icon="sign-out-alt" /> LogOut
					</a>
				</li>
			</div>
		</div>
	</header>
</template>

<script>
import Logo from '@/components/common/LogoComponent.vue';

export default {
	name: 'HeaderView',
	components: {
		Logo,
	},
	data() {
		return {
			navigations: [
				// {
				// 	name: 'Detail',
				// 	href: '/detail/nnEo8-6jqpw',
				// },
				{
					name: 'Favorite',
					href: '/explore',
				},
				{
					name: 'Playground',
					href: '/board',
				},
				{
					name: 'About',
					href: '/about',
				},
			],
		};
	},
	computed: {
		currentUser() {
			let user = this.$store.state.auth.user;
			console.log(user);
			return this.$store.state.auth.user;
		},
	},
	methods: {
		logOut() {
			this.$store.dispatch('auth/logout');
			this.$router.push('/');
		},
	},
};
</script>

<style lang="scss" scoped>
a {
	text-decoration: none;
}
header {
	height: 70px;
	padding: 0 40px;
	display: flex;
	align-items: center;
	position: relative;
	.logo {
		margin-right: 40px;
	}

	.icon-box {
		position: absolute;
		cursor: pointer;
		top: 0;
		bottom: 0;
		right: 150px;
		margin: auto;
		flex-direction: row;
		align-items: center;

		:last-child {
			margin-left: 10px;
		}
	}
}
.user-info {
	font-family: 'Noto Sans Kr', sans-serif;
	color: $primary;
	.userName {
		font-family: 'Oswald', sans-serif;
		font-weight: 700;
		font-size: 17px;
	}
}
@include media-breakpoint-down(lg) {
	.nav {
		display: none;
	}
}
</style>
