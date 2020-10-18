<html>
<body>
<head>
<link rel="stylesheet" href="CSS/Style.css">
<title> Ajouter Commande </title>
</head>
<form method="post" action="Ajouter_Menu_Action.asp">
<table>
<tr>
<td>Menu :</td>
<td>
<select name="nom" size="1">
<option value="Friture">Friture</option>
<option value="Regime">Regime</option>
<option value="Tacos">Tacos</option>
<option value="Pizza">Pizza</option>

</select>
</td>
</tr>
<tr>
<td>Description du menu:</td>
<td><input name="desc"></td>
</tr>



</table>
<br><br>
<input type="submit" value="Ajouter">
<input type="reset" value="Annuler">
</form>