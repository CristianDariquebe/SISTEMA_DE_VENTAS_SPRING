<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table style="width: 100%;">
  <tr>
    <td>
      <img src="img/Logo2.jpg" width="400"/>
    </td>
    <td>
      Usuario: ${sessionScope.usuario.usuario}<br/>
      <a href="LogonSalir">CerrarSesión</a>
      <a href="cambiarPass.jsp">-----</a>
    </td>
  </tr>
</table>