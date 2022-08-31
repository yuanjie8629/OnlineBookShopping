<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Portal</title>
		<link rel="stylesheet" href="../styles.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script>
	    if (top.location != self.location) {
	      top.location.href = self.location.href;
	    }
	    
	    function validateSearch() {
	    	let form = document.forms['searchForm'];
    		// Make 'View Books' tab becomes active
    		let active = document.getElementsByClassName("active");
			if (active.length > 0)
				active[0].className = active[0].className.replace(" active", "");
    		let nav = document.getElementsByClassName("nav-item");
    		nav[0].className += " active";
	    }
		</script>
		<style>
		.customerPortal {
			background-image: url(./images/CustomerBackground.jpg);
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
		
		.marquee {
			margin-bottom: 10px;
			padding: 10px;
			font-weight: bold;
			color: red;
		}
		</style>
	</head>

	<body class="customerPortal">
		<h1 style="text-align:center; margin-bottom: 5px;"><a class="header" href="./CustomerPortal.jsp" target="_self">Customer Portal</a></h1>
		<marquee direction="right" bgColor="yellow" scrolldelay="1" scrollamount ="15" onmouseover="this.stop()" onmouseout="this.start()" class="marquee">
		FREE SHIPPING FOR ALL ORDERS!!!
		</marquee>
		<div class="grid">
			<div class="nav" style="flex-grow:1; width: 200px;">
				<ul>
					<li class="dropdown">
						<a class="nav-item" href="../CustomerViewBookServlet" target="frame">View Books</a>
						<div class="dropdown-content">
							<a class="dropdown-item" href="../CustomerViewBookServlet?ordering=name" target="frame">Sort By Book Title</a>
					 		<a class="dropdown-item" href="../CustomerViewBookServlet?ordering=price" target="frame">Sort By Price</a>
					    </div>
					</li>
					<li>
						<a class="nav-item" href="../CustomerPurchaseBookServlet" target="frame">Purchase Book</a>
					</li>
					<li class="dropdown">
						<a class="nav-item" href="../CustomerViewTransactionServlet" target="frame">View Transaction History</a>
						<div class="dropdown-content">
							<a class="dropdown-item" href="../CustomerViewTransactionServlet?ordering=bo.purchase_date desc" target="frame">Sort By Purchase Date</a>
					 		<a class="dropdown-item" href="../CustomerViewTransactionServlet?ordering=bo.price" target="frame">Sort By Price</a>
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
						active[0].className = active[0].className.replace(" active", "");
					this.className += " active";
				});
			}
			
			var dropdown_items = document.getElementsByClassName("dropdown-item");
			for (var i = 0; i < dropdown_items.length; i++) {
				dropdown_items[i].addEventListener("click", function() {
					var active = document.getElementsByClassName("active");
					if (active.length > 0)
						active[0].className = active[0].className.replace(" active", "");
					this.parentElement.previousElementSibling.className += " active";
				});
			}
			</script>
			<div>
				<form name="searchForm" action="../CustomerViewBookServlet" onsubmit="validateSearch()" method="get" target="frame" class="searchForm">
					<input type="search" name="searchParams" placeholder="Search by Book Collection">
					<button type="submit"><i class="fa fa-search"></i></button>
				</form>
				<iframe name="frame" class="frame" src='./CustomerHomePage.html' width="80%">
				</iframe>
			</div>
		</div>
	</body>
</html>