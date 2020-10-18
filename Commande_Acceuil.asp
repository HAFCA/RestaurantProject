<html>
<body>
<head>
<link rel="stylesheet" href="CSS/Style.css">
</head>
  
<%
Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")
  Set Rs = Server.CreateObject("ADODB.RecordSet")
rs.open "ps_SelectAllCommande_TCOMMANDES",cx
%>
<h2>Liste des commandes:</h2>
<form method="post" action="Cherche_Commande_par_menu.asp">
 <input type="text" class="form-control" placeholder="Enter un menu" name="rechercher">
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
<form method="post" action="Modifier_Supprimer_Commande.asp">
<%
for each x in rs.Fields
  if x.name="IdCommande" then%>
    <td>
    <input type="submit" name="IdCommande" value="<%=x.value%>">
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
<form method="post" action="Ajouter_Commande.asp">
<button type=submit name="action" value="ajouter commande"></boutton>
</form>
<b>Ajouter Commande</b>
</body>
</html>