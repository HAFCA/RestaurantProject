<%
IdMenu=Request.Form("IdMenu")
if IdMenu="" then response.end
Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")
set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * from TMENUS where TMENUS.[IdMenu]=" & IdMenu , cx
%>
<!DOCTYPE html>
<html>
<head>
<title>ADO - Edit DataBase Record</title>
<link rel="stylesheet" href="CSS/style.css" type="text/css" media="screen" />
</head>
<body>
<h2>Modifier ou supprimer </h2>
<form method="post" action="Modifier_Supprimer_Menu_Action.asp" target="_blank">
  <input name="IdMenu" type="hidden" value=<%=IdMenu%>>
<table id = "style_table">
	<tr>
  <td> Menu</td>
 <td> 
 <form>

  <select name="cls">
  <option value="Friture">Friture</option>
  <option value="Regime">Regime</option>
  <option value="Tacos">Tacos</option>
  <option value="Pizza">Pizza</option>
  </select>
</form>

</td>
	    </tr>

<%
for each x in rs.Fields
     if x.name <> "IdMenu" and x.name <> "Menu" then %>
        <tr>
         <td><%=x.name%> </td>
         <td> <input name="<%=x.name%>" value="<%=x.value%>" size="50"></td>
     <%end if
next

rs.close
cx.close
%>
</tr>
</table>
<br>
<input type="submit" name="action" value="Modifier">
<input type="submit" name="action" value="Supprimer">
</form>


</body>
</html>