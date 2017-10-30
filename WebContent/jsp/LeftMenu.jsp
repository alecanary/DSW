<%@page language="java" contentType="text/html"%>

<%@page import="java.util.HashMap, java.util.Set"%>
<% String base = (String)application.getAttribute("base"); %>
<jsp:useBean id="dataManager" scope="application"
  class="eshop.model.DataManager"/>
<div class="menu"> 
  <div class="box">
    <div class="title">Quick Search</div>
    <p>Book Title/Author:</p>
    <form style="border: 0px solid; padding: 0; margin: 0;">
      <input type="hidden" name="action" value="search"/>
      <input id="text" type="text" name="keyword" size="15"/>
      <input id="submit" type="submit" value="Search"/>
      </form>
    </div>
  <div class="box">
    <div class="title">Categorias</div>
<%
    HashMap<String, String> categories = dataManager.getCategories();
    Set<String> claves = categories.keySet();
    for(String clave:claves) {
    	
      String categoryId = categories.get(clave);
      //System.out.print(categoryId);
      out.println("<p><a href='" + base + "?action=selectCatalog&id="
        + clave + "'>" + categories.get(clave) + "</a></p>"
        );
      }
  %>
    </div>
  </div>
