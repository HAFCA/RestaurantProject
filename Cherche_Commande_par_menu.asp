<html>
<body>
<head>
<link rel="stylesheet" href="CSS/Style.css">
<title> Commandes </title>
</head>
<%
 Dim rechercher

    rechercher = Request.Form("rechercher")

Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")
  Set Rs = Server.CreateObject("ADODB.RecordSet")

sql="ps_chercher_TCOMMANDES_par_menu'" &rechercher& "'"

rs.Open sql, cx
%>
<h2> Resultats de recherche :</h2>
<table id="style_table">
  <tr>
  <%for each x in rs.Fields
    response.write("<th>" & x.name & "</th>")
  next%>
  </tr>
  <%do until rs.EOF%>
    <tr>
    <%for each x in rs.Fields%>
      <td><%Response.Write(x.value)%></td>
    <%next
    rs.MoveNext%>
    </tr>
  <%loop
  rs.close
  cx.close%>
</table>

</body>
</html>