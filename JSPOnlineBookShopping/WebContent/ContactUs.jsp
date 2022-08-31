<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>About Us</title>
		<style>
		.container {
			background-image: url(./images/ContactUsBackground.jpg);
			background-size: cover;
		}
		
		table.company-info {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
	
		table.company-info td, th {
			border: 1px solid #A0A0A0;
			text-align: left;
			vertical-align: top;
			padding: 5px;
		}
		
		table.feedback {
			border: none;
			width: 100%;
		}
		
		table.feedback td {
			vertical-align: top;
			padding: 5px 5px;
		}
		
		.flex {
			display: flex;
			justify-content: center;
		}
		
		.flex .flex-item {
			margin: 0 15px;
			padding: 10px 20px;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			border-radius: 15px;
		}
		
		.gmap_iframe {
			border: none;
			height: 200px !important;
			padding-top: 8px;
		}
		
		.submitButton {
			background-color: #44c767;
			border-radius: 10px;
			border: 1px solid #18ab29;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 10px;
			cursor: pointer;
		}
		
		.submitButton:hover {
			background-color: #41a33e;
		}
		
		.submitButton:active {
			position: relative;
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
		
		function validateFeedback() {
			  let name = document.forms["feedbackForm"]["name"].value;
			  let email = document.forms["feedbackForm"]["email"].value;
			  let subject = document.forms["feedbackForm"]["subject"].value;
			  let details = document.forms["feedbackForm"]["details"].value;
			  if (name != '' && email != '' && subject != '' && details != '') {
				  return true;
			  }
			  else {
				  alert("Please fill in all the information...");
				  return false;
			  }
		}
		</script>
	</head>
	<body>
		<h1 style="text-align:center;">Contact Us</h1>
		<hr>
		<div class="flex">
			<div class="flex-item">
				<h2 style="text-align:center; margin:10px;">Company Information</h2>
				<table class="company-info">
					<tr>
						<td>Name</td>
						<td>OBS Pte Ltd</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>obs&#64;gmail.com</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>+65 1234 5678</td>
					</tr>
					<tr>
						<td>Fax</td>
						<td>+65 5678 1234</td>
					</tr>
					<tr>
						<td>Website</td>
						<td><a href="index.jsp" target="_self">www.obs.com</a></td>
					</tr>
					<tr>
						<td>Address</td>
						<td>
							<div>
								250 North Bridge Road Raffles City Tower, Singapore 179101
								<iframe class="gmap_iframe" width="100%" src="https://maps.google.com/maps?width=400&amp;height=220&amp;hl=en&amp;q=250 North Bridge Road Raffles City Tower, Singapore 179101&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="flex-item" style="width:50%;">
				<h2 style="text-align:center;  margin:10px;">Feedback</h2>
				<form name="feedbackForm" action="SubmitFeedbackServlet" method="post" onsubmit="return validateFeedback()">
					<table class="feedback">
						<tr>
							<td>
								<label for="name">Name</label>
							</td>
							<td>
							<input type="text" name="name">
							</td>
						</tr>
						<tr>
							<td>
								<label for="email">Email</label>
							</td>
							<td>
								<input type="email" name="email">
							</td>
						</tr>
						<tr>
							<td>
								<label for="subject">Subject</label>
							</td>
							<td>
								<input type="text" name="subject" style="width:100%;">
							</td>
						</tr>
						<tr>
							<td>
								<label for="details">Details</label>
							</td>
							<td>
								<textarea name="details" maxlength="300" rows="10" style="width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="submitButton" type="submit" value="Submit Feedback">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>

