<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.daoimpl.BookDaoImpl,com.bean.Book,java.util.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>View Books</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
		List<Book> list = (List<Book>)request.getAttribute("list");
	%>
	<body>
		<h1 style="text-align:center;">View Books</h1>
		<hr>
		<div style="width: 100%; text-align:center;">
			<form name="searchForm" action="AdminViewBookServlet" method="get" target="frame" class="searchForm" style="width: 100%;">
				<input type="search" name="searchParams" placeholder="Search by Book Collection" value="<%=request.getParameter("searchParams") != null ? request.getParameter("searchParams") : ""%>">
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
		<form name="filterForm" action="AdminViewBookServlet" method="get" class="filterSortingForm">
			<%if(request.getParameter("searchParams") != null) {%>
				<input type="hidden" name="searchParams" value="<%=request.getParameter("searchParams")%>">
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
					<option value="id" selected>ID</option>
					<option value="name">Book Name: A - Z</option>
					<option value="name desc">Book Name: Z - A</option>
					<option value="author">Book Author: A - Z</option>
					<option value="author desc">Book Author: Z - A</option>
					<option value="price">Price: Low - High</option>
					<option value="price desc">Price: High - Low</option>
					<option value="stock">Stock: Low - High</option>
					<option value="stock desc">Stock: High - Low</option>
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
		<%if (list == null || list.isEmpty()){ %>
			<div style="text-align: center;">Sorry, No book found...</div>
		<%} else { %>
		<table class="list">
			<tr>
				<th>ID</th>
				<th>Book Cover</th>
				<th>Book Name</th>
				<th>Author Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Stock</th>
			</tr>
			<% for(Book book : list) { %>
				<tr>
					<td><%=book.getId()%></td>
					<td><img src="data:image/png;base64,<%=book.getEncodedImage()%>" width="80px" height="110px"></td>
					<td style="max-width: 100px;"><%=book.getName()%></td>
					<td><%=book.getAuthor()%></td>
					<td><%=book.getCategory() %></td>
					<td>$ <%=book.getPrice()%></td>
					<td><%=book.getStock()%></td>
				</tr>
			<%}%>
		</table>
		<%}%>
	</body>
</html>