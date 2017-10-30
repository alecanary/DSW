<%@page language="java" contentType="text/html"%>
<%@page import="java.util.HashMap"%>
<%@page import="eshop.beans.Book"%>
<%@page import="eshop.beans.CartItem"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <jsp:useBean id="dataManager" scope="application" --%>
<%--   class="eshop.model.DataManager"/> --%>
<%
  String base = (String) application.getAttribute("base");
  @SuppressWarnings("unchecked")
   HashMap<String, CartItem> carrito =
      (HashMap<String, CartItem>)session.getAttribute("shoppingCart");
  request.setAttribute("carrito", carrito);
  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Carrito Java EE</title>
<link rel="stylesheet" href="/eshop/css/eshop.css" type="text/css" />
</head>
<body>
	<jsp:include page="TopMenu.jsp" flush="true" />
	<jsp:include page="LeftMenu.jsp" flush="true" />
	<% 

  if (!carrito.isEmpty()) {
  %>
	<div class="content">
		<h2>Shopping Cart</h2>
		<table>
			<tr>
				<th>Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</th>
				<th>Delete</th>
			</tr>
			<%--           <c:forEach items="${sessionScope['shoppingCart']}" var="item">  --%>
			<%--          <c:forEach items="${sessionScope.shoppingCart}" var="item"> --%>
			<%--        <c:forEach items="${carrito}" var="item"> --%>

			<c:set var="total" scope="session" value="0" />
			<c:forEach items="${shoppingCart}" var="item">
				<c:set var="subtotal" scope="session" value="0" />
				<tr>
					<%--            <td>${item.key}</td> --%>
					<td>${item.value.getBook().getTitle()}</td>

					<td>${item.value.getBook().getAuthor()}</td>
					<td>${item.value.getBook().getPrice()}</td>

					<td>
						<form>
							<input type="hidden" name="action" value="updateItem" /> 
							<input type="hidden" name="bookId" value="${item.value.getBook().getId()}" /> 
							<input size="2" name="quantity" type="text" value="${item.value.getQuantity()}" />

							<c:set var="cantidad" value="${item.value.getQuantity()}" />
							<c:set var="precio" value="${item.value.getBook().getPrice()}" />
							<c:set var="subtotal" scope="session" value="${subtotal  + (cantidad * precio)}" />
							<c:set var="total" scope="session" value="${total  + subtotal}" />
							<input type="submit" value="Update" />
						</form>
					</td>
					<td>${subtotal}</td>
					<td>
						<form>
							<input type="hidden" name="action" value="deleteItem" /> <input
								type="hidden" name="bookId"
								value="${item.value.getBook().getId()}" /> <input type="submit"
								value="Delete" />
						</form>
					</td>
				</tr>
			</c:forEach>




			<tr>
				<td colspan="5" id="total">Total: ${total}</td>
				<td class="total">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="6" class="center"><a class="link1"
					href="<%=base%>?action=checkOut">Check Out</a></td>
			</tr>
		</table>
	</div>
	<%
    }
  else {
    %><p class="info">The Shopping cart is empty.</p>
	<%
    }
  %>

</body>
</html>
