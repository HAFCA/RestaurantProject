<!DOCTYPE html>
<html>
<head>
<title>Submit DataBase Record</title>
</head>
<body>
<h2>Submit to Database</h2>

<%on error resume next
idFac = Request.Form("idFac")
idMe = Request.Form("idMe")
Qt = Request.Form("Qt")
id = Request.Form("IdCommande")

Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")

if Request.form("action")="Modifier" then
     sql="UPDATE TCOMMANDES SET IdFacture="&idFac&","
     sql=sql & "IdMenu="&idMe&","
     sql=sql & "Qt="&Qt&" WHERE TCOMMANDES.[IdCommande]=" &id
cx.Execute sql, Recordsaffected

if err <> 0 then
Response.Write("vous avez choisi " &idFac& " et   "&idMe& " et la quantite  "&Qt&" ")
Response.Write("vous n'avez pas la permission de modifier cet element!")
else
Response.Write("la commande  " & IdCommande & " est modifiee.")
end if
 Response.Write("")
end if
if Request.Form("action")="Supprimer" then
     IdCommande=Request.Form("IdCommande")
cx.Execute "DELETE FROM TCOMMANDES WHERE TCOMMANDES.[IdCommande]=" & IdCommande, Recordsaffected
 if err <> 0 then
 Response.Write("echec de modification!")
 else
 Response.Write("cet commande d'id " & IdCommande & " est bien supprime.")
 end if
     Response.Write("")
end if%>
<form method="post" action="Commande_Acceuil.asp">
<input type="submit" name="mn" value="Table de commandes">
	</form>
<%cx.close%>


</body>
</html>