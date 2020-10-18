<html>
<body>
<head>
<link rel="stylesheet" href="CSS/Style.css">
<title> Menus </title>
</head>  
<%
Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")
  Set Rs = Server.CreateObject("ADODB.RecordSet")
rs.open "ps_SelectAll_TMENUS",cx
%>

<h2>Liste des Menus :</h2>
<form method="post" action="Recherche_Menu_TMENUS.asp">
 <input type="text" class="form-control" placeholder="Enter un terme" name="rechercher">
<input type="submit" name="button" value="rechercher" class="btn btn-primary">
</form>
<table id="style_table">

<tr>
<%
for each x in rs.Fields
  response.write("<th>" & ucase(x.name) & "</th>")
  
  
next
%>
 
</tr>
<% do until rs.EOF %>
<tr>
<form method="post" action="Modifier_Supprimer_Menu.asp">
<%
for each x in rs.Fields
  if x.name="IdMenu" then%>
    <td>
    <input type="submit" name="IdMenu" value="<%=x.value%>">
    </td>
  <%else%>
    <td><%Response.Write(x.value)%></td>
     
   
  <%end if
next
%>

<%rs.MoveNext%>

</tr>
<%
loop
cx.close
%>
</table>
</form>
<form method="post" action="Ajouter_Menu.asp">
<button type=submit name="action" value="ajouter menu"></boutton>
</form>
<b>Ajouter Menu</b>
</body>
</html>