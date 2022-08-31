<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin Portal</title>
		<link rel="stylesheet" href="../styles.css">
		<script type="text/javascript">
	    if (top.location != self.location) {
	      top.location.href = self.location.href;
	    }
		</script>
		<style>
		.adminPortal {
			background-image: url(./images/AdminBackground.jpg);
			background-size: cover;
		}
		
		.header {
			color: #1c55b0;
			text-decoration: none;
		}

		.header:hover {
			color: #4dafff;
			text-decoration: none;
		}
		</style>
	</head>
	<body class="adminPortal">
		<h1 style="text-align:center;"><a class="header" href="./AdminPortal.jsp" target="_self">Admin Portal</a></h1>
		<div class="grid">
			<div class="nav" style="flex-grow:1; width: 200px;">
				<ul>
					<li>
						<a class="nav-item" href="./AddBook.jsp" target="frame">Add Book</a>
					</li>
					<li>
						<a class="nav-item" href="../AdminUpdateBookServlet" target="frame">Update Book</a>
					</li>
					<li>
						<a class="nav-item" href="../AdminViewBookServlet" target="frame">View Book</a>
					</li>
					<li>
						<a class="nav-item" href="../AdminDeleteBookServlet" target="frame">Delete Book</a>
					</li>
					<li class="dropdown">
						<a class="nav-item" href="../AdminViewTransactionServlet" target="frame">View Transaction History</a>
						<div class="dropdown-content">
							<a class="dropdown-item" href="../AdminViewTransactionServlet?ordering=bo.purchase_date desc" target="frame">Sort By Purchase Date</a>
					 		<a class="dropdown-item" href="../AdminViewTransactionServlet?ordering=bo.price" target="frame">Sort By Price</a>
					    </div>
					</li>
					<li>
						<a class="nav-item" href="../LogoutServlet" target="frame">Logout</a>
					</li>
				</ul>
			</div>
			<script>
			var nav_items = document.getElementsByClassName("nav-item");
			for (var i = 0; i < nav_items.length; i++) {
				nav_items[i].addEventListener("click", function() {
					var active = document.getElementsByClassName("active");
					if (active.length > 0)
						active[0].className = "nav-item";
					this.className += " active";
				});
			}
			</script>
			<div>
				<iframe name="frame" class="frame" src='./AdminHomePage.html' width="80%" height="600px">
				</iframe>
			</div>
		</div>
	</body>
</html>