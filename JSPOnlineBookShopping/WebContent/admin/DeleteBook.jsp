<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.daoimpl.BookDaoImpl,com.bean.Book,java.util.*"%>
<!DOCTYPE html>
<html>
	<% 
	List<Book> list = (List<Book>)request.getAttribute("list");
	int selected_id = (Integer) request.getAttribute("selected_id");
	Book selected_book = (Book) request.getAttribute("selected_book");
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Update Book</title>
		<style>
		<%@include file="../styles.css"%>
		td {
			padding: 5px 15px;
		}
		.deleteButton {
			background-color: #de7171;
			border-radius: 10px;
			border: 1px solid #f04a4a;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 10px;
			cursor: pointer;
		}
		.deleteButton:hover {
			background-color: #b5504a;
		}
		.deleteButton:active {
			position: relative;
			top: 1px;
		}
		.deleteButton:disabled {
			background-color: #b0b0b0;
			border: 1px solid #999999;
			cursor: no-drop;
		}
		.deleteForm {
			background-color: rgb(195, 230, 226);
			width: fit-content;
			padding: 20px;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			border-radius: 15px;
		}
		.rangeGrid {
			display: grid;
			grid-template-columns: auto auto;
			column-gap: 20px;
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
		
		function onSelectID() {
			document.forms['selectID'].submit();
		}
		
		function confirmDelete() {
			if (confirm("Are you sure to delete the book <%= selected_book.getName()%> ?"))
				return true;
			else return false;
		}
		</script>
	</head>
	
	<body>
		<h1 style="text-align:center;">Delete Book</h1>
		<hr>
		<%if (list == null || list.isEmpty()){ %>
			<div style="text-align: center;">Sorry, No book found...</div>
		<%} else { %>
		<div>
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
			<tr>
				<td><%=selected_book.getId()%></td>
				<td><img src="data:image/png;base64,<%=selected_book.getEncodedImage()%>" width="80px" height="110px"></td>
				<td style="max-width: 100px;"><%=selected_book.getName()%></td>
				<td><%=selected_book.getAuthor()%></td>
				<td><%=selected_book.getCategory() %></td>
				<td>$ <%=selected_book.getPrice()%></td>
				<td><%=selected_book.getStock()%></td>
			</tr>
		</table>
			<div align="center">
				<form name="selectID" action="AdminDeleteBookServlet" method="get" style="margin-bottom:20px;">
					<label for="id">Select Book:</label>
					<select name="id" onchange="onSelectID()" style="max-width:200px;">
					<%for(Book book: list){%>
						<option value='<%=book.getId()%>'><%=book.getId()%>: <%=book.getName()%></option>
					<%}%>
					</select>
					<script>
					let select = document.forms['selectID']['id'];
					let id = <%=selected_id%>
					for (var i = 0; i < select.length; i++) {
						if (select[i].value == id) {
							select[i].selected = true;
						}
					}
					</script>
				</form>
				<form name="deleteBook" action="AdminDeleteBookServlet" method="post" onsubmit="return confirmDelete()" class="deleteForm">
					<input type="hidden" name="id" value="<%=selected_book.getId()%>">
					<input id="deleteButton" class="deleteButton" type="submit" value="Delete">
				</form>
			</div>
		</div>
		<%}%>
	</body>
</html>