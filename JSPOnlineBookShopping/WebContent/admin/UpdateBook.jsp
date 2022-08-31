<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.daoimpl.BookDaoImpl,com.bean.Book,java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Update Book</title>
		<style>
		<%@include file="../styles.css"%>
		td {
		padding: 5px 15px;
		}
		.updateButton {
			background-color: #44c767;
			border-radius: 10px;
			border: 1px solid #18ab29;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 10px;
			cursor: pointer;
		}
		.updateButton:hover {
			background-color: #41a33e;
		}
		.updateButton:active {
			position: relative;
			top: 1px;
		}
		.updateForm {
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
		
		function triggerUploadImage() {
			let newImage = document.getElementById("newImage");
			let uploadImageRow = document.getElementById("uploadImage");
			let table = document.getElementById("updateBookTable");
			if (!newImage.checked) {
				table.deleteRow(uploadImage.rowIndex);
			} else {
				var row = table.insertRow(table.rows.length - 1);
				row.id = "uploadImage";
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				cell1.innerHTML = "<label for='image'>Upload Book Cover:</label>";
				cell2.innerHTML = "<input type='file' name='image' accept='image/*'>";
			}
		}
		
		function validateUpdateBook() {
			let form = document.forms['updateBook'];
			if (form['name'].value == '') {
				alert('Please Enter Book Name..');
			} else if (form['author'].value  == '') {
				alert('Please Enter Book Author..');
			} else if (form['category'].value  == '') {
				alert('Please Select Book Category..');
			} else if (form['stock'].value  == '') {
				alert('Please Select Book Stock..');
			} else if (form['price'].value  == '') {
				alert('Please Enter Book Price..');
			} else if (document.getElementById("newImage").checked && form['image'].value  == '') {
				alert('Please Upload Book Cover..');
			} else if (!form['image'].value.match(/.(jpg|jpeg|png)$/i)) {
				alert("Please Upload Image File for Book Cover.\n The system only accepts jpg, jpeg, png extensions...");
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
		<h1 style="text-align:center;">Update Book</h1>
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
				<form name="selectID" action="AdminUpdateBookServlet" method="get" style="margin-bottom:10px;">
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
				<form name="updateBook" onsubmit="return validateUpdateBook()" action="AdminUpdateBookServlet" method="post" class="updateForm" enctype="multipart/form-data">
					<input type="hidden" name="id" value="<%=selected_book.getId()%>">
					<table id="updateBookTable" style="border:none;">
						<tr>
							<td>
								<label for="name">Enter Book Name:</label>
							</td>
							<td>
								<input type ="text" name="name" value="<%=selected_book.getName()%>">
							</td>
						</tr>
						<tr>
							<td>
								<label for="author">Enter Author:</label>
							</td>
							<td>
								<input type ="text" name="author" value="<%=selected_book.getAuthor()%>">
							</td>
						</tr>
						<tr>
							<td>
								<label for="category">Select Category:</label>
							</td>
							<td>
								<select name="category">
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
							</td>
						</tr>
						<tr>
							<td>
								<label for="stock">Select Stock:</label>
							</td>
							<td class="rangeGrid">
								<input type="range" name="stock" min="0" max="10" value="<%=selected_book.getStock()%>">
								<label id="stock" for="stock"></label>
								<script>
								var output = document.getElementById("stock");
								var slider = document.forms['updateBook']['stock'];
								output.innerHTML = slider.value;
								slider.oninput = function() {
									  output.innerHTML = this.value;
								};
								</script>
							</td>
						</tr>
						<tr>
							<td>
								<label for="price">Enter Price:</label>
							</td>
							<td>
								<input type="number" name="price" min="0.00" step='0.01' value="<%=selected_book.getPrice()%>">
							</td>
						</tr>
						<tr>
							<td>
								<label for="newImage">Upload New Book Cover?</label>
							</td>
							<td>
								<input type="checkbox" id="newImage" onchange="triggerUploadImage()"><label for="newImage">Yes</label>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="updateButton" type="submit" value="Update">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<%}%>
	</body>
</html>