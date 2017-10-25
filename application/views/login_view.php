<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/css/login.css">
	<title>Ticket Tracker</title>

	
</head>
<body>

<div id="container">
	<h1>Time Tracker</h1>

	<form action="check" method="post">
		<div id="body">
			<p>Login:
				<input type="text" name="txtLogin">
			</p>

			<p>Senha:
				<input type="password" name="txtSenha">
			</p>

			<p>
				<button>Login</button>
			</p>
		</div>
	</form>
</div>

</body>
</html>