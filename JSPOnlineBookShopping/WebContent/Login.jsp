<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
		<style>
		td {
			padding: 5px 15px;
		}
		
		.loginButton {
			background-color: #44c767;
			border-radius: 10px;
			border: 1px solid #18ab29;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 15px;
			cursor: pointer;
		}
		
		.loginButton:hover {
			background-color: #41a33e;
		}
		
		.loginButton:active {
			position: relative;
			top: 1px;
		}
		
		.clearButton {
			background-color: #de7171;
			border-radius: 10px;
			border: 1px solid #f04a4a;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 12px;
			cursor: pointer;
		}
		
		.clearButton:hover {
			background-color: #b5504a;
		}
		
		.clearButton:active {
			position:relative;
			top: 1px;
		}
		</style>
		<script>
		window.onload = function() {
			let msg = "<%=request.getAttribute("msg")%>";
			if (msg != "null") {
				alert(msg);
				<% request.removeAttribute("msg");%>
			}
		};
		function validateLogin() {
			let form = document.forms['login'];
			if (form['username'].value == '') {
				alert('Please Enter Username..');
			} else if (form['password'].value  == '') {
				alert('Please Enter Password..');
			} else {
				return true;
			}
			return false;
		}
		</script>
	</head>
	<body style="background-image: url(./images/LoginBackground.jpg); background-size: cover;">
			<h1 style="text-align:center;">Login</h1>
			<hr>
			<div align="center">
				<form name="login" action="LoginServlet" method="post" onsubmit="return validateLogin()">
					<table style="border:none;">
						<tr>
							<td>
								<label for="username">Enter Username:</label>
							</td>
							<td>
								<input type ="text" name="username">
							</td>
						</tr>
						<tr>
							<td>
								<label for="password">Enter Password:</label>
							</td>
							<td>
								<input type ="password" name="password">
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="loginButton" type="submit" value="Login">
								<input class="clearButton" type="reset" value="Clear">
							</td>
						</tr>
					</table>
				</form>
			</div>
	</body>
</html>