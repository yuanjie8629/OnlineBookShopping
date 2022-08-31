<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.daoimpl.BookDaoImpl,com.daoimpl.OrderDaoImpl,com.bean.Book,com.bean.Order,com.bean.User,java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Purchase Book</title>
		<style>
		td {
			padding: 5px 15px;
		}
		.formTable {
			border: none;
		}
		.purchaseButton {
			background-color: #44c767;
			border-radius: 10px;
			border: 1px solid #18ab29;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 10px;
			cursor: pointer;
		}
		.purchaseButton:hover {
			background-color: #41a33e;
		}
		.purchaseButton:active {
			position: relative;
			top: 1px;
		}
		.purchaseForm {
			background-color: rgb(195, 230, 226);
			width: fit-content;
			padding: 20px;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			border-radius: 15px;
		}
		.stockGrid {
			display: grid;
			grid-template-columns: auto auto;
			column-gap: 20px;
		}
		<%@include file="../styles.css"%>
		</style>
		<script>
		window.onload = function() {
			let msg = "<%=request.getAttribute("msg")%>";
			if (msg != "null") {
				alert(msg);
				<% request.removeAttribute("msg");%>
			}
		};
		
		function validatePurchaseBook() {
			let form = document.forms['purchaseBook'];
			if (form['id'].value == '') {
				alert('Please Select the Book ID..');
			} else if (form['quantity'].value  == '') {
				alert('Please Select Book Quantity..');
			} else {
				return true;
			}
			return false;
		}
		
		function onSelectID() {
			document.forms['selectID'].submit();
		}
		
		</script>
	</head>
	<%
	List<Book> list = (List<Book>)request.getAttribute("list");
	int selected_id = (Integer) request.getAttribute("selected_id");
	Book selected_book = (Book) request.getAttribute("selected_book");
	%>
	<body>
		<h1 style="text-align:center;">Purchase Book</h1>
		<hr>
		<%if (list.isEmpty()){ %>
			<div style="text-align: center;">Sorry, No book available...</div>
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
				<form name="selectID" action="CustomerPurchaseBookServlet" method="get">
					<table class="formTable" style="min-width:330px;">
						<tr>
							<td style="width:103.54px; text-align:right;">
								<label for="id">Select Book:</label>
							</td>
							<td style="width:191px; padding: 0;">
								<select name="id" onchange="onSelectID()" style="width:100%;">
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
							</td>
						</tr>
					</table>
				</form>
				<form name="purchaseBook" onsubmit="return validatePurchaseBook()" action="CustomerPurchaseBookServlet" method="post">
					<input type="hidden" name="id" value="<%=selected_book.getId()%>">
					<table class="formTable">
						<tr>
							<td>
								<label for="quantity">Select Quantity:</label>
							</td>
							<td class="stockGrid">
								<input type="range" name="quantity" min="1" max="<%=selected_book.getStock()%>">
								<label id="quantity" for="quantity"></label>
								<script>
								var output = document.getElementById("quantity");
								var slider = document.forms['purchaseBook']['quantity'];
								output.innerHTML = slider.value;
								slider.oninput = function() {
									  output.innerHTML = this.value;
								};
								</script>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="submit" value="Purchase" class="purchaseButton">
							</td>
						</tr>
					</table>
					
				</form>
			</div>
		</div>
		<%}%>
	</body>
</html>