<%@ page import="logica.Parqueadero" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: JorgePapa
  Date: 5/10/2021
  Time: 6:45 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String respuesta = "{";
    String proceso = request.getParameter("proceso"); //request HTTP
    int idparqueadero = 0;
    Parqueadero p = new Parqueadero();

    switch (proceso) {
        case "guardarParqueadero":
            System.out.println("Guardar Parqueadero");
            p.setRazonSocial(request.getParameter("razonSocial"));
            p.setNumPlazasCarro(Integer.parseInt(request.getParameter("numPlazasCarro")));
            p.setNumPlazasMoto(Integer.parseInt(request.getParameter("numPlazasMoto")));
            p.setValorMinutoCarro(Double.parseDouble(request.getParameter("valorMinutoCarro")));
            p.setValorMinutoMoto(Double.parseDouble(request.getParameter("valorMinutoMoto")));

            if (p.guardarParqueadero()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;

        case "eliminarParqueadero":
            System.out.println("Eliminar Parqueadero");
            idparqueadero = Integer.parseInt(request.getParameter("id"));
            System.out.println(idparqueadero);
            if (p.eliminarParqueadero(idparqueadero)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;

        case "actualizarParqueadero":
            System.out.println("Actualizar Parqueadero");
            idparqueadero = Integer.parseInt(request.getParameter("id"));
            p.setRazonSocial(request.getParameter("razonSocial"));
            p.setNumPlazasCarro(Integer.parseInt(request.getParameter("numPlazasCarro")));
            p.setNumPlazasMoto(Integer.parseInt(request.getParameter("numPlazasMoto")));
            p.setValorMinutoCarro(Double.parseDouble(request.getParameter("valorMinutoCarro")));
            p.setValorMinutoMoto(Double.parseDouble(request.getParameter("valorMinutoMoto")));

            if (p.actualizarParqueadero(idparqueadero)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "listarParqueadero":
            System.out.println("Listar Parqueaderos");
            List<Parqueadero> parqueaderoList = p.listarParqueadero();
            if (parqueaderoList.isEmpty()) {
                respuesta += "\"" + proceso + "\": true,\"Parqueadero\":[]"; //genera una lista vacía en el json
            } else {
                respuesta += "\"" + proceso + "\": true,\"Parqueadero\":" + new Gson().toJson(parqueaderoList); //guarda la lista en el json
            }
            break;

        default:
            respuesta += "\"ok\": false,";
            respuesta += "\"error\": \"INVALID\",";
            respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                    + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }

    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>