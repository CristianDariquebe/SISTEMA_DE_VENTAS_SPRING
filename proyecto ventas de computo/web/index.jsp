<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>INICIO DE SESION</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    <style>
      #LOGON{
        background-color: lightskyblue;
        color: black;
        margin: 10px auto;
        width: 400px;
        padding: 10px;
      }
    </style>
  </head>
  <body>
    <div id="LOGON">
      <div style="text-align: left;">
        <img src="img/Logo2.jpg" width='400' />
      </div>
        <h1><center>INICIO DE SESION</center></h1>
      <p>${requestScope.error}</p>
      <form method="post" action="LogonIngresar">
        <table>
          <tr>
            <td rowspan="2"><img src="img/Logeo2.png" width='130' height='130'  /></td>
            <td>Usuario:</td>
            <td><input type="text" name="usuario"/></td>
          </tr>
          <tr>
            <td>Clave:</td>
            <td><input type="password" name="clave"/></td>
          </tr>    
          <tr>
            <td colspan="3" style="text-align: center;">
              <input type="submit" value="Ingresar" />
            </td>
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>
