<md-content ng-controller="LoginController" layout="row" layout-align="center center" flex>
	<md-card flex="45">
		<md-card-title>
			<md-card-title-text layout-align="center center">
				<span class="md-headline">Ticket Control</span>
			</md-card-title-text>
		</md-card-title>
		<md-card-content layout="column" layout-align="center center">
			<form action="check" method="post">
				<div>
					<md-input-container>
						<label>Login</label>
						<input ng-model="user.login">
					</md-input-container>
				</div>
				<div>
				<md-input-container>
					<label>Password</label>
					<input ng-model="user.password" type="password">
				</md-input-container>
				</div>
			</form>	
		</md-card-content>
		<md-card-actions layout="column" layout-align="end end" flex>
			<md-button class="md-raised md-primary" ng-click="getLogin()">Submit</md-button>
		</md-card-actions>
	</md-card>
</md-content>

<!--
<form action='Check' method='POST'>
	<input name='txtLogin' type='text' />
	<input name='txtSenha' type='password' />
	<button type='Submit'>Vai</button>
<form>-->
