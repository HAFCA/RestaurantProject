<%
IdCommande=Request.Form("IdCommande")
if IdCommande="" then response.end
Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")
set rs = Server.CreateObject("ADODB.Recordset")
set rs1 = Server.CreateObject("ADODB.Recordset")
set rs2 = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * from TCOMMANDES where TCOMMANDES.[IdCommande]=" & IdCommande , cx
rs1.Open "ps_SelectIdMenu_TMENUS", cx
rs2.Open "ps_selectFacture_TFACTURES", cx

%>
<!DOCTYPE html>
<html>
<head>
<title>Edit DataBase Record</title>
<link rel="stylesheet" href="CSS/style.css" type="text/css" media="screen" />
</head>
<body>
<h2>Modifier ou supprimer </h2>
<form method="post" action="Modifier_Supprimer_Commande_Action.asp" target="_blank">
  <input name="IdCommande" type="hidden" value=<%=IdCommande%>>
 
<table id="style_table">
	<tr>
  <td> IdFacture</td>
 <td> 
  <div class="dropdown" style="float:left;">
 <select name="idFac" size="1" >
  </div>
<%do until rs2.EOF%>
<div class="dropdown-content">
<option value="<%=rs2("IdFacture")%>"class="dropbtn"><%Response.Write rs2("IdFacture") %></option>
</div>
<%rs2.MoveNext
loop%>
</div>
</select>

</td>
	    </tr>
	    <tr>
  <td> IdMenu</td>
 <td> 
 <select name="idMe" size="1">
<%do until rs1.EOF%>
<option value="<%=rs1("IdMenu")%>"><%Response.Write rs1("IdMenu") %></option>

<%rs1.MoveNext
loop%>
</select>

</td>
	    </tr>

<%
for each x in rs.Fields
     if x.name <> "IdCommande" and x.name <> "IdFacture" and x.name <> "IdMenu" then %>
        <tr>
         <td><%=x.name%> </td>
         <td> <input name="<%=x.name%>" value="<%=x.value%>" size="50"></td>
     <%end if
next

rs.close
rs1.close
rs2.close
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