<%@ page import="logica.Vehiculo" %><%--
  Created by IntelliJ IDEA.
  User: JorgePapa
  Date: 23/09/2021
  Time: 8:12 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tablero Parqueadero</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<%
    Vehiculo v = new Vehiculo("","","");
    v.setTotalPagar(0d);
    //String accion = request.getParameter("action");

    String mensaje = "Bienvenido";

    if (request.getAttribute("mensaje") != null) {
        mensaje = (String) request.getAttribute("mensaje");
    }
    if (request.getAttribute("objVehiculo") != null) {
        v = (Vehiculo) request.getAttribute("objVehiculo");
    }

%>
<form class="main" name="Aplicacion" action="AplicacionServlet" method="POST">

    <div class="container-fluid">

        <div class="row mb-3">
            <div class="col-10">
                <h1 class="display-3">EASY PARKING</h1>
            </div>
            <div class="col-2">
                <img src="https://cdn-icons-png.flaticon.com/512/1167/1167984.png">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-6">

                <div class="row mb-3">
                    <div class="col-12">
                        <h2>PLACA</h2>
                    </div>
                    <div class="col-12 ">
                        <input id="placa" class="form-control" type="text" name="placa" value="<%=v.getPlaca()%>"/>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-12">
                        <div>
                            <label>TIPO DE VEHICULO</label>
                            <select aria-label="Tipo de vehiculo..."
                                    name="tipoVehiculo">
                                <option selected>T. vehiculo...</option>
                                <option value="carro">CARRO</option>
                                <option value="moto">MOTO</option>
                            </select>
                        </div>
                        <div>
                            <label>METODO DE PAGO</label>
                            <select aria-label="Medio de pago..."
                                    name="medioPago">
                                <option selected>M. pago...</option>
                                <option value="efectivo">EFECTIVO</option>
                                <option value="credito">CREDITO</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-12">
                        <input class="btn btn-primary btn-lg btn-block" type="submit" value="INGRESO" name="action">
                    </div>
                </div>

            </div>
            <div class="col-6">

                <div class="row mb-3">
                    <div class="col-12">
                        <h2>TOTAL A PAGAR</h2>
                    </div>
                    <div class="col-12">
                        <input class="form-control" type="text" value="<%=v.getTotalPagar()%>" aria-label="readonly input example"
                               readonly>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-4">
                        <label>Ticket #</label>
                    </div>
                    <div class="col-8"><input class="form-control" type="text" name="ticketId" value="0"/></div>
                </div>

                <div class="row mb-3">
                    <div class="col-12"><input class="btn btn-primary btn-lg btn-block" type="submit" value="SALIDA"
                                               name="action">
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-7">
                <img src="https://cdn-icons-png.flaticon.com/512/2555/2555059.png">
                <label class="display-4">100</label>
                <label class="display-4">00</label>
                <img src="https://cdn-icons-png.flaticon.com/512/2606/2606303.png">
                <label class="display-4">100</label>
                <label class="display-4">00</label>
            </div>
            <div class="col-5">
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"
                              style="height: 100px"><%=mensaje%></textarea>
                </div>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-9"></div>
            <div class="col-3">
                <a href="index.jsp" class="btn btn-secondary btn-lg" role="button" data-bs-toggle="button">INICIO</a>
                <input class="btn btn-secondary btn-lg" type="button" value="CERRAR" name="action">
            </div>
        </div>
    </div>
</form>
</body>
</html>
