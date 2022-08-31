<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.daoimpl.UserDaoImpl,com.bean.User"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Register as Customer</title>
		<style>	
		td {
			padding: 5px 15px;
		}
		
		.registerButton {
			background-color: #44c767;
			border-radius: 10px;
			border: 1px solid #18ab29;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 10px;
			cursor: pointer;
		}
		
		.registerButton:hover {
			background-color: #41a33e;
		}
		
		.registerButton:active {
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
			padding: 5px 18px;
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
		function validateRegister() {
			let form = document.forms['register'];
			if (form['username'].value == '') {
				alert('Please Enter Username..');
			} else if (form['password'].value  == '') {
				alert('Please Enter Password..');
			} else if (form['name'].value  == '') {
				alert('Please Enter Name..');
			} else if (form['email'].value  == '') {
				alert('Please Enter Email..');
			} else if (form['contact_no'].value  == '') {
				alert('Please Enter Contact Number..');
			} else {
				return true;
			}
			return false;
		}
		</script>
	</head>
	<body style="background-image: url(./images/RegisterBackground.jpg); background-size: cover;">
		<h1 style="text-align:center;">Register as Customer</h1>
		<hr>
		<div align="center">
			<form name="register" action="RegisterServlet" method="post" onsubmit="return validateRegister()">
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
						<td>
							<label for="name">Enter Name:</label>
						</td>
						<td>
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<td>
							<label for="email">Enter Email:</label>
						</td>
						<td>
							<input type ="email" name="email" placeholder="xxxxx@gmail.com">
						</td>
					</tr>
					<tr>
						<td>
							<label for="contact_no">Enter Contact Number:</label>
						</td>
						<td>
							<input type="tel" name="contact_no" placeholder="012-1234567" pattern="[0-9]{3}-[0-9]{7}">
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<input class="registerButton" type="submit" value="Register">
							<input class="clearButton" type="reset" value="Clear">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>