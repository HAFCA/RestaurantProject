
<html>
<body>
<head>
<link rel="stylesheet" href="CSS/Style.css">
<title> Commandes </title>
</head>
<%
Dim menu
menu = Request.Form("rechercher")
Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")
  Set Rs = Server.CreateObject("ADODB.RecordSet")

sql="SELECT IdMenu, Menu, Description FROM TMENUS WHERE Menu LIKE "
sql=sql & "('" & Request.Form("rechercher") & "')"

rs.Open sql, cx
%>

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