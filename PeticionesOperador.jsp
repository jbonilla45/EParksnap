<%@ page import="logica.Operador" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: JorgePapa
  Date: 3/10/2021
  Time: 11:09 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>

<%
    String respuesta = "{";
    String proceso = request.getParameter("proceso"); //request HTTP
    int id = 0;

    Operador o = new Operador();

    switch (proceso){
        case "guardarOperador":
            System.out.println("Guardar Operador");
            o.setNombre(request.getParameter("nombre"));
            o.setApellido(request.getParameter("apellido"));
            o.setCargo(request.getParameter("cargo"));

            if (o.guardarOperador()) {
                respuesta += "\"" + proceso + "\": true";
            }
            else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;

        case "actualizarOperador":

            System.out.println("Actualizar Operador");
            id= Integer.parseInt(request.getParameter("id"));
            o.setNombre(request.getParameter("nombre"));
            o.setApellido(request.getParameter("apellido"));
            o.setCargo(request.getParameter("cargo"));

            if (o.actualizarContacto(id)){
                respuesta += "\"" + proceso + "\": true";
            }else{
                respuesta += "\"" + proceso + "\": false";
            }
            break;

        case "eliminarOperador":
            System.out.println("Eliminar Operador");
            id = Integer.parseInt(request.getParameter("id"));
            if (o.borrarOperador(id)){
                respuesta += "\"" + proceso + "\": true";
            }else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;

        case "listarOperador":
            System.out.println("Listar Operadores");
            List<Operador> listarOperador = o.listarOperador();
            if(listarOperador.isEmpty()){
                respuesta += "\"" + proceso + "\": true,\"Operador\":[]"; //genera una lista vacía en el json
            } else{
                respuesta += "\"" + proceso + "\": true,\"Operador\":" + new Gson().toJson(listarOperador); //guarda la lista en el json
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