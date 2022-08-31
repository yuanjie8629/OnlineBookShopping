<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.daoimpl.BookDaoImpl,com.bean.Book"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add Book</title>
		<style>
		td {
			padding: 5px 15px;
		}
		
		.addButton {
			background-color: #44c767;
			border-radius: 10px;
			border: 1px solid #18ab29;
			display: inline-block;
			color: white;
			font-weight: bold;
			padding: 5px 15px;
			cursor: pointer;
		}
		
		.addButton:hover {
			background-color: #41a33e;
		}
		
		.addButton:active {
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
		function validateAddBook() {
			let form = document.forms['addBook'];
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
			} else if (form['image'].value  == '') {
				alert('Please Upload Book Cover..');
			} else if (!form['image'].value.match(/.(jpg|jpeg|png)$/i)) {
				alert("Please Upload Image File for Book Cover.\n The system only accepts jpg, jpeg, png extensions...");
			} else {
				return true;
			}
			return false;
		}
		</script>
	</head>
	<body>
		<h1 style="text-align:center;">Add Book</h1>
		<hr>
		<div align="center">
			<form name="addBook" onsubmit="return validateAddBook()" action="../AdminAddBookServlet" method="post" enctype="multipart/form-data">
				<table style="border:none;">
					<tr>
						<td>
							<label for="name">Enter Book Name:</label>
						</td>
						<td>
							<input type ="text" name="name">
						</td>
					</tr>
					<tr>
						<td>
							<label for="author">Enter Author:</label>
						</td>
						<td>
							<input type ="text" name="author">
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
							<input type="range" name="stock" min="0" max="10">
							<label id="stock" for="stock"></label>
							<script>
							let output_stock = document.getElementById("stock");
							let slider_stock = document.forms['addBook']['stock'];
							output_stock.innerHTML = slider_stock.value;
							slider_stock.oninput = function() {
								output_stock.innerHTML = this.value;
							};
							</script>
						</td>
					</tr>
					<tr>
						<td>
							<label for="price">Enter Price:</label>
						</td>
						<td>
							<input type="number" name="price" min="0.00" step='0.01'>
						</td>
					</tr>
					<tr>
						<td>
							<label for="image">Upload Book Cover:</label>
						</td>
						<td>
							<input type="file" name="image" accept="image/*">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<div>
								<input class="addButton" type="submit" value="Add">
								<input class="clearButton" type="reset" value="Clear">
							</div>
						</td>
					</tr>
				</table>
				
			</form>
		</div>
	</body>
</html>