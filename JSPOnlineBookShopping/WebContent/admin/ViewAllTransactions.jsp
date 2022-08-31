<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.daoimpl.OrderDaoImpl,com.bean.Order,com.bean.User,java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>View All Transaction History</title>
		<style>
		<%@include file="../styles.css"%>
		</style>
		<script>
		function submitFilterForm() {
			document.forms['filterForm'].submit();
		}
		</script>
	</head>
	<%
		List<Order> list = (List<Order>)request.getAttribute("list");
	%>
	<body>
		<h1 style="text-align:center;">View Transaction History</h1>
		<hr>
		<form name="filterForm" action="CustomerViewTransactionServlet" method="get" class="filterSortingForm">
			<%if(request.getParameter("searchParams") != null) {%>
				<input type="hidden" name="searchParams" value="<%=request.getParameter("searchParams") %>">
			<%}%>
			<div>
				<label for="category">Filter By Category:</label>
				<select name="categoryFilter" onchange="submitFilterForm()">
					<option value="all" selected>All</option>
					<option value="Fantasy">Fantasy</option>
					<option value="Adventure">Adventure</option>
					<option value="Romance">Romance</option>
					<option value="Mystery">Mystery</option>
					<option value="Horror">Horror</option>
					<option value="Thriller">Thriller</option>
					<option value="Paranormal">Paranormal</option>
					<option value="Historical Fiction">Historical Fiction</option>
					<option value="Science Fiction">Science Fiction</option>
					<option value="Poetry">Poetry</option>
					<option value="Art">Art</option>
					<option value="Biography">Biography</option>
					<option value="Fairy Tale">Fairy Tales</option>
					<option value="Technology">Technology</option>
					<option value="Finance">Finance</option>
				</select>
				<script>
				let select_cat = document.forms['filterForm']['categoryFilter'];
				let cat = "<%=request.getParameter("categoryFilter")%>";
				for (var i = 0; i < select_cat.length; i++) {
					if (select_cat[i].value == cat) {
						select_cat[i].selected = true;
					}
				}
				</script>
			</div>
			<div>
				<label for="ordering">Sort By:</label>
				<select name="ordering" onchange="submitFilterForm()">
					<option value="bo.id" selected>ID</option>
					<option value="b.name">Book Name: A - Z</option>
					<option value="b.name desc">Book Name: Z - A</option>
					<option value="b.author">Book Author: A - Z</option>
					<option value="b.author desc">Book Author: Z - A</option>
					<option value="bo.quantity">Quantity: Low - High</option>
					<option value="bo.quantity desc">Quantity: High - Low</option>
					<option value="bo.price">Total Price: Low - High</option>
					<option value="bo.price desc">Total Price: High - Low</option>
					<option value="bo.purchase_date">Purchase Date: Oldest - Latest</option>
					<option value="bo.purchase_date desc">Purchase Date: Latest - Oldest</option>
				</select>
				<script>
				let select_sort = document.forms['filterForm']['ordering'];
				let sort = "<%=request.getParameter("ordering")%>";
				for (var i = 0; i < select_sort.length; i++) {
					if (select_sort[i].value == sort) {
						select_sort[i].selected = true;
					}
				}
				</script>
			</div>
		</form>
		<%if (list.isEmpty()){ %>
			<div style="text-align: center;">Sorry, No transaction found in your account...</div>
		<%} else { %>
		<table class="list">
			<tr>
				<th>ID</th>
				<th>Book Cover</th>
				<th>Book Name</th>
				<th>Book Author</th>
				<th>Category</th>
				<th>Quantity</th>
				<th>Total Price</th>
				<th>Purchase Date</th>
				<th>Customer Name</th>
			</tr>
			<% for(Order order : list) { %>
				<tr>
					<td><%=order.getId()%></td>
					<td><img src="data:image/png;base64,<%=order.getBook().getEncodedImage()%>" width="80px" height="110px"></td>
					<td style="max-width: 100px;"><%=order.getBook().getName()%></td>
					<td><%=order.getBook().getAuthor()%></td>
					<td><%=order.getBook().getCategory()%></td>
					<td><%=order.getQuantity()%></td>
					<td>$ <%=order.getPrice()%></td>
					<td><%=order.getPurchaseDate()%></td>
					<td><%=order.getCustomer().getName()%></td>
				</tr>
			<%}%>
		</table>
		<%} %>
	</body>
</html>