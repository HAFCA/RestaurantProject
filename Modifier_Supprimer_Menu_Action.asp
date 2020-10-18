<!DOCTYPE html>
<html>
<head>
<title>ADO - Submit DataBase Record</title>
<link rel="stylesheet" href="CSS/Style.css">
<title> Menus </title>
</head>

<link rel="stylesheet" href="CSS/Style.css">
<title> Menus </title>

<body>
<h2>Submit to Database</h2>

<%on error resume next

Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")

if Request.form("action")="Modifier" then
     IdMenu=Request.Form("IdMenu")
     
     sql="UPDATE TMENUS SET Menu='" & Request.Form("cls") & "',"
     sql=sql & "Description='" & Request.Form("Description") & "' WHERE TMENUS.[IdMenu]=" & IdMenu
cx.Execute sql, Recordsaffected

if err <> 0 then
Response.Write("vous avez choisi " &ta& "  ")
Response.Write("vous n'avez pas la permission de modifier cet element!")
else
Response.Write("le menu  " & IdMenu & " est modifié.")
end if
 Response.Write("")
end if
if Request.Form("action")="Supprimer" then
     IdMenu=Request.Form("IdMenu")
cx.Execute "DELETE FROM TMENUS WHERE TMENUS.[IdMenu]=" & IdMenu, Recordsaffected
 if err <> 0 then
 Response.Write("You do not have permission to delete a record from this database!")
 else
 Response.Write("Record number " & IdMenu & " was deleted.")
 end if
     Response.Write("")
end if%>
<form method="post" action="Menu_Acceuil.asp">
<input type="submit" name="mn" value="nouveau menu">
	</form>
<%cx.close%>


</body>
</html>