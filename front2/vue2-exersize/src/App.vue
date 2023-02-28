<template>
	<div>
		<header-nav></header-nav>
		<div class="flex">
			<div class="mode-toggle" @click="modeToggle" :class="darkDark">
				<div class="toggle">
					<div id="dark-mode" type="checkbox"></div>
				</div>
			</div>
		</div>
		<router-view></router-view>
		<common-footer></common-footer>
	</div>
</template>

<script>
import HeaderNav from '@/components/common/HeaderNav.vue';
import CommonFooter from '@/components/common/CommonFooter.vue';

export default {
	data() {
		return {
			darkMode: false,
		};
	},
	components: {
		HeaderNav,
		CommonFooter,
	},
	methods: {
		dark() {
			document.querySelector('body').classList.add('dark-mode');
			this.darkMode = true;
			this.$emit('dark');
		},
		light() {
			document.querySelector('body').classList.remove('dark-mode');
			this.darkMode = false;
			this.$emit('light');
		},
		modeToggle() {
			if (
				this.darkMode ||
				document.querySelector('body').classList.contains('dark-mode')
			) {
				this.light();
			} else {
				this.dark();
			}
		},
	},
	computed: {
		darkDark() {
			return this.darkMode && 'darkmode-toggled';
		},
	},
};
</script>

<style lang="scss">
@import '@/scss/main.scss';

$dark: #181a1b;
$dark-primary: #a5c4e1;
$dark-secondary: #6ea0bf;

// _base.scss
body {
	background-color: #fff;
	color: $dark;
	transition: background-color 0.2s ease, color 0.2s ease;
}

// _dark-mode.scss
:root {
	body {
		&.dark-mode {
			background-color: $dark;
			color: #d1cdc7;
			.size {
				color: $dark-primary;
			}
			.nav-link {
				color: $dark-primary;
			}
			.login {
				color: $dark-primary;
			}

			.card {
				background-color: #1d1f20;
			}
			footer {
				a {
					span {
						color: $dark-primary;
					}
				}
				.footer-name {
					color: $dark-primary;
				}
			}
			header {
				a {
					span {
						color: $dark-primary;
					}
				}
			}

			.btn {
				background-color: #1d3557;
				&:hover {
					background-color: #14243b;
				}
			}

			input {
				background-color: #181a1b;
				color: #5b5852;
			}

			select {
				background-color: #181a1b;
				color: #d1cdc7;
			}
			.no-result {
				background-color: #3a3c3c;
				color: #d1cdc7;
			}
			.inner {
				background-color: #3a3c3c;
			}

			.table {
				color: #d1cdc7;
				a {
					color: $dark-secondary;
				}
			}

			.pagination {
				background-color: $dark;
				.page-item {
					disabled {
						background-color: $dark;
					}
				}
			}
		}
	}
}

// _mode-toggle.scss
.mode-toggle {
	position: relative;
	//margin: auto .5rem .5rem auto;
	padding: 0;
	width: 44px;
	height: 24px;
	min-width: 36px;
	min-height: 20px;
	background-color: #fff;
	border: 2px solid $primary;
	border-radius: 24px;
	outline: 0;
	overflow: hidden;
	cursor: pointer;
	z-index: 2;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-touch-callout: none;
	appearance: none;
	transition: background-color 0.5s ease;

	.toggle {
		position: absolute;
		top: 0;
		left: 0;
		bottom: 0;
		margin: auto;
		width: 20px;
		height: 20px;
		border-radius: 50%;
		border: 3px solid transparent;
		box-shadow: inset 0 0 0 2px $primary;
		overflow: hidden;
		transition: transform 0.5s ease;

		#dark-mode {
			position: relative;
			width: 100%;
			height: 100%;
			overflow: hidden;
			border-radius: 50%;

			&:before {
				content: '';
				position: relative;
				width: 100%;
				height: 100%;
				left: 50%;
				float: left;
				background-color: $primary;
				transition: border-radius 0.5s ease, width 0.5s ease, height 0.5s ease,
					left 0.5s ease, transform 0.5s ease;
			}
		}
	}
}

body.dark-mode {
	.mode-toggle {
		background-color: lighten($primary, 5%);
		border: 2px solid #f1faee;

		.toggle {
			transform: translateX(19px);
			// box-shadow: inset 0 0 0 100px #a5abba;
			background-color: #fff;

			#dark-mode {
				&:before {
					border-radius: 50%;
					width: 150%;
					height: 85%;
					left: 40%;
					transform: translate(-10%, -40%), rotate(-35deg);
				}
			}
		}
	}
}

// DEMO STYLES
@import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro');

html {
	font-size: 16px;
}

html,
body,
#app {
	width: 100%;
	height: 100%;
}

body {
	margin: 0;
	font-family: 'Source Sans Pro';
}

h1 {
	font-weight: 400;
	transition: color 0.5s ease;
}

.flex {
	position: fixed;
	top: 25px;
	right: 40px;
	z-index: 1;
}
</style>
