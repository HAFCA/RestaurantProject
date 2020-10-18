<html>
<body>

<%
nom = Request.Form("nom")
desc = Request.Form("desc")
Set cx = Server.CreateObject("ADODB.Connection")
cx.Open Application("PC")
Set Rs = Server.CreateObject("ADODB.RecordSet")

sql="INSERT INTO TMENUS (Menu,Description) "
sql=sql & " VALUES "
sql=sql & "('"&nom&"',"
sql=sql & "'" & Request.Form("desc") & "')"

on error resume next
cx.Execute sql,recaffected
if err<>0 then
  Response.Write("No update permissions!")
   Response.Write("    le menu choisi est"&nom&"  ")
else
  Response.Write("<h3>" & recaffected & " ce menu est ajouté </h3>")
end if%>
<form method="post" action="Menu_Acceuil.asp">
<input type="submit" name="mn" value="nouveau menu">
	</form>
<%cx.close
%>

</body>
</html>