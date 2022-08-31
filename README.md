# Online Book Shopping - Web Application

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)

<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Overview

This is a web-based online book shopping platform. There are two end users exist in the system: admin and customer. Both admin and customer have their own portals. Admin is only allowed to access admin portal, while customer is only allowed to access customer portal.

## Features

1. Register as Customer<br>
   The user can register as customer to shop the online book platform.

2. Login<br>
   The user who have registered or admin can log in to the system using their username and password.

### Admin Features

1. Add Book<br>
   The admin can add the book by entering the book details such as book title, author, category, stock, price and cover.

2. Update Book<br>
   The admin can update the book by selecting the book and entering the new details of the book.

3. View Book<br>
   The admin can view all the books added to the system. Besides, the admin can also search book by book title or author, filter or sort the book list.

4. Delete Book<br>
   The admin can delete the book by selecting the book and confirm the book deletion.

5. View Transaction History<br>
   The admin can view all the order transactions of the customers. Besides, the admin can filter or sort the transaction list.

### Customer Features

1. View Book<br>
   The customer can view all the available books. Besides, the admin can also search book by book title or author, filter or sort the book list.

2. Purchase Book<br>
   The customer can purchase the book by selecting the book and quantity to purchase. The maximum book quantity to purchase is the stock of the book, the customer cannot select the quantity more than the stock.

3. View Transaction History<br>
   The customer can view the transaction history of their purchases. They can also filter or sort the transactions.

## Tech Stack

- Java 8
- Servlet
- JSP
- HTML
- CSS
- JavaScript
- Oracle DB via JDBC
- Apache Tomcat 9.0

## System Design

The system follows the MVC design pattern.

- JSP, HTML, JavaScript and CSS act as the View.
- Servlet acts as the Controller.
- Data Access Object (DAO) and java bean act as the Model.

## Preview

1. Home Page <br> <img src="previews/HomePage.jpg"><br><br>
2. About Us <br> <img src="previews/AboutUs.jpg"><br><br>
3. Contact Us <br> <img src="previews/ContactUs.jpg"><br><br>
4. Login <br> <img src="previews/Login.jpg"><br><br>
5. Register as Customer<br> <img src="previews/RegisterAsCustomer.jpg"><br><br>

### Admin

1. Home Page <br> <img src="previews/AdminHomePage.jpg"><br><br>
2. Add Book <br> <img src="previews/AdminAddBook.jpg"><br><br>
3. Update Book <br> <img src="previews/AdminUpdateBook.jpg"><br><br>
4. View Books <br> <img src="previews/AdminViewBook.jpg"><br><br>
5. Delete Book <br> <img src="previews/AdminDeleteBook.jpg"><br><br>
6. View Transaction History <br> <img src="previews/AdminViewTransactions.jpg"><br><br>

### Customer

1. Home Page <br> <img src="previews/CustomerHomePage.jpg"><br><br>
2. View Books <br> <img src="previews/CustomerViewBook.jpg"><br><br>
3. Purchase Book <br> <img src="previews/CustomerPurchaseBook.jpg"><br><br>
4. View Transaction History <br> <img src="previews/CustomerViewTransactions.jpg"><br><br>

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/yuanjie8629"><img src="https://avatars.githubusercontent.com/u/86699785?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Tan Yuan Jie</b></sub></a><br /><a href="#question-yuanjie8629" title="Answering Questions">💬</a> <a href="https://github.com/yuanjie8629/OnlineBookShopping/commits?author=yuanjie8629" title="Code">💻</a> <a href="#content-yuanjie8629" title="Content">🖋</a> <a href="#data-yuanjie8629" title="Data">🔣</a> <a href="#design-yuanjie8629" title="Design">🎨</a> <a href="https://github.com/yuanjie8629/OnlineBookShopping/commits?author=yuanjie8629" title="Documentation">📖</a> <a href="#ideas-yuanjie8629" title="Ideas, Planning, & Feedback">🤔</a> <a href="#infra-yuanjie8629" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="#maintenance-yuanjie8629" title="Maintenance">🚧</a> <a href="#tool-yuanjie8629" title="Tools">🔧</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
