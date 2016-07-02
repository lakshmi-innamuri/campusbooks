<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.emich.edu.User"%>
<%@ page import="com.emich.edu.Book"%>
<%@ page import="java.util.Map.Entry"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Results Page</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/campusbooks.css">
<script src="<%=request.getContextPath()%>/script/campusbookscript.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"> </script>
<script>
	$(document).ready(function(){
		$("#admin").load("adminHomePage.jsp");
	});
	
	</script>

</head>
<%@ include file="/jsps/header.jsp"%>
<body>

<div id="allContent">
	<aside id="admin" ></aside>

	<section class="secSearchResult">
		<div id="userSearchResults">
			<table cellspacing="14">

				<%			
				
				session = request.getSession();
				Book searchCriteriaObj = (Book) session.getAttribute("searchCriteria");

				Map<Book, User> mapInSession = new HashMap<Book, User>();
				mapInSession = (Map<Book, User>) session.getAttribute("searchResults");

			//	Map<String, String> map = new HashMap<String, String>();
			//	mapInSession = (Map<Book, User>) session.getAttribute("searchResults");
				
				System.out.println("map is empty: "+mapInSession.isEmpty());
			
				if(!mapInSession.isEmpty()){
					out.println("<caption>Search Results</caption><tr> <th>Book Title</th> <th>Seller</th></tr>");
					for (Entry<Book, User> entry : mapInSession.entrySet()) {
						Book key = entry.getKey();
						User value = entry.getValue();
						out.println("<tr>");
						out.println("<td><a href='"+request.getContextPath()+"/CampusBooksServlet?viewBookDetails=yes&bookName="+ key.getBookTitle()+"&bookId="+key.getBookId()+"'>" + key.getBookTitle()
								+ "</a></td>");
						out.println("<td><a href='"+request.getContextPath()+"/CampusBooksServlet?viewSeller=yes&sellerName="+ value.getUsesrName()+"&sellerId="+value.getUserId()+"'>" + value.getUsesrName()
								+ "</a></td>");
						
						
						/* out.println("<td><a href='bookDetails.jsp?bookId="+ key.getBookTitle()+"'>"+key.getBookTitle() + "</a></td>");
						out.println("<td><a href='sellerProfile.jsp?sellerName="+ value.getUsesrName()+"&sellerId="+value.getUserId()+"'>" + value.getUsesrName()
								+ "</a></td>"); */
						out.println("</tr>");
					}
				}
				else{
					out.println("Sorry, No Books match you criteria");
				}
				
			%>
			</table>



		</div>
	</section>
</div>
</body>
</html>