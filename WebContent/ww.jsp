<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sleek.CDStore.function.shoppingCart.*"%>
<%@ page import="com.sleek.CDStore.config.URLMapper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">	
<head>
	<%@include file="./lib/header.jsp" %>     
    <!-- Custom styles for this template -->

   
    <title>The Sleek CD Store</title>
    
    
    
</head>
<body>
	<%@ include file="./lib/navbar.jsp" %>	
	<br><br><br>
	<div class="container">
		<div class="row">
			<div class="col-md-9">				
				<h1>The Sleek Store Shopping Cart : <small> </small></h1><br>
				<div class="table-responsive">
					<table id="cartTable" class="table table-hover table-condensed table-striped">
				        <thead>
				          <tr>
				            <th>CD </th>
				            <th>CD Category</th>
				            <th>Quantity</th>
				            <th>Price</th>
				            <th></th>
				          </tr>
				        </thead>
				        <tbody>
				        <%ShoppingCart sc=(ShoppingCart)request.getAttribute("cart"); 
				        for(int i=0;i<sc.getCartList().size();i++){
				        %>
				          <tr id="cartItemTr<%=sc.getCartList().get(i).getCD().getId() %>">
				            <td>
					            <dl>
		  						<dt><%=sc.getCartList().get(i).getCD().getTitle() %></dt>
		  						<dd class="sr-only"><%=sc.getCartList().get(i).getCD().getId() %></dd>
								</dl>	
				            </td>
				            <td><%=sc.getCartList().get(i).getCD().getCategory() %></td>					           
				            <td><div class="col-md-3"><input id="cartItem<%=sc.getCartList().get(i).getCD().getId() %>" type="text" class="form-control" value="<%=sc.getCartList().get(i).getQuantity() %>" placeholder="<%=sc.getCartList().get(i).getQuantity() %>"></div></td>
				            <td><%=sc.getCartList().get(i).getCD().getPrice() %></td>
				            <td>
				            	<button type="submit" class="btn btn-info" onclick="updateCart(<%=sc.getCartList().get(i).getCD().getId()%>)"><span data-toggle="tooltip" data-placement="bottom" title="I am here!" id="shopping-cart" class="glyphicon glyphicon-refresh"></span></button>
				            	<button type="submit" class="btn btn-danger" onclick="removeCart(<%=sc.getCartList().get(i).getCD().getId()%>)"><span data-toggle="tooltip" data-placement="bottom" title="I am here!" id="shopping-cart" class="glyphicon glyphicon-remove"></span></button>
				            </td>
				          </tr>
				        <% }%>  
				  		</tbody>
				  		<tfoot>
				          <tr>
				            <th></th>
				            <th> </th>
				            <th>Total price </th>
				            <th style="text-align:right"><span id="cartTotalPrice" ><%=sc.getTotal()%></span> $ CDN</th>
				            <th></th>
				          </tr>
				          <tr>
				            <th></th>
				            <th> </th>
				            <th>Tax </th>
				            <th style="text-align:right"><span id="cartTaxPrice" ><%=sc.getTax()%></span> $ CDN</th>
				            <th></th>
				          </tr>
				          <tr>
				            <th></th>
				            <th> </th>
				            <th>Shipping </th>
				            <th style="text-align:right"><span id="cartShippingPrice" >10.00</span> $ CDN</th>
				            <th></th>
				          </tr>
				        </tfoot>
			    	</table>
				</div>
			
				<div class="row">
					 <a href="<%=URLMapper.HOME_URL%>" type="submit" class="btn btn-success"> Continue Shopping</a>
					 <a href="<%=URLMapper.CHECKOUT_URL%>" type="submit" class="btn btn-danger"> Confirm Checkingout</a>
				</div>
			</div>
	
		</div>
	</div>

	<br><br>

	<%@include file="./lib/footer.jsp" %>
</body>
</html>