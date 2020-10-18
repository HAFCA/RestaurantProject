<html>
<body>


<%

nom1 = Request.Form("nom1")
nom2 = Request.Form("nom2")
Set cx = Server.CreateObject("ADODB.Connection")
cx.Open Application("PC")
Set Rs = Server.CreateObject("ADODB.RecordSet")

sql="INSERT INTO TCOMMANDES (IdFacture,IdMenu,Qt) "
sql=sql & " VALUES "
sql=sql & "("&nom1&","
sql=sql &nom2&","
sql=sql &  Request.Form("desc") & ")"

on error resume next
cx.Execute sql,recaffected
if err<>0 then
  Response.Write("No update permissions!")
   Response.Write("    le id menu choisi est"&nom1&"  ")
   Response.Write("    le id facture choisi est"&nom2&"  ")
else
  Response.Write("<h3>" & recaffected & " ce menu est ajoute</h3>")
end if%>
<form method="post" action="Commande_Acceuil.asp">
<input type="submit" name="mn" value="Table de commande">
	</form>
<%cx.close
%>

</body>
</html>