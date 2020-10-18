<html>
<body>
<head>
<link rel="stylesheet" href="CSS/Style.css">
<title> Ajouter Commande </title>
</head>
<%
Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")
set rs = Server.CreateObject("ADODB.Recordset")
set rs1 = Server.CreateObject("ADODB.Recordset")
rs.Open "ps_selectFacture_TFACTURES", cx
rs1.Open "ps_SelectIdMenu_TMENUS", cx
%>
<form method="post" action="Ajouter_Commande_Action.asp">
<table id="style_table" >
<tr>
<td>IdFacture :</td>
<td>
<select name="nom1" size="1">
<%do until rs.EOF%>
<option value="<%=rs("IdFacture")%>"><%Response.Write rs("IdFacture") %></option>

<%rs.MoveNext
loop%>
</select>

</td>
</tr>
<tr>
<td>IdMenu :</td>
<td>
<select name="nom2" size="1">
<%do until rs1.EOF%>

	<option value="<%=rs1("IdMenu")%>"><%Response.Write rs1("IdMenu") %></option>
<%rs1.MoveNext
loop%>
</select>
</td>
</tr>
<tr>
<td>Quantite:</td>
<td><input name="desc"></td>
</tr>
</table>

<input type="submit" value="Ajouter">
<input type="reset" value="Annuler">
</form>
<%
rs.close
rs1.close
cx.close
set rs = Nothing
set rs1 = Nothing
set cx = Nothing
%>