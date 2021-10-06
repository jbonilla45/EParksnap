<%--
  Created by IntelliJ IDEA.
  User: JorgePapa
  Date: 5/10/2021
  Time: 10:33 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Parqueadero</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    <style>
        #liveAlertPlaceholder {
            width: 90%;
            margin: 20px auto;
        }

        #listaParqueaderos {
            width: 80%;
        }
    </style>
</head>
<body>
<div ng-app="EasyParkingG6S57" ng-controller="ctlrPark">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" ng-click="mostrarFormulario()">Crear Parqueadero</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" ng-click="listarParqueadero()">Listar Parqueaderos</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="liveAlertPlaceholder"></div>

    <div class="container-fluid" ng-show="!mostrarLista">
        <div class="row d-flex justify-content-center">
            <div class="col-6" style="text-align: center" ng-show="!actualizar"><h1>Crear Parqueadero</h1></div>
            <div class="col-6" style="text-align: center" ng-show="actualizar"><h1>Actualizar Parqueadero</h1></div>

        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-6">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Razon Social*</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Escriba la razon social del parqueadero" ng-model="razonSocial">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput2" class="form-label">Plazas para Carros*</label>
                    <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="Plazas disponibles para carros" ng-model="numPlazasCarro">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput3" class="form-label">Plazas para Motos*</label>
                    <input type="text" class="form-control" id="exampleFormControlInput3" placeholder="Plazas disponibles para motos" ng-model="numPlazasMoto">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput4" class="form-label">Valor del minuto para carro*</label>
                    <input type="text" class="form-control" id="exampleFormControlInput4" placeholder="Valor del minuto para carro" ng-model="valorMinutoCarro">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput5" class="form-label">Valor del minuto para moto*</label>
                    <input type="text" class="form-control" id="exampleFormControlInput5" placeholder="valor del minuto para moto" ng-model="valorMinutoMoto">
                </div>
                <button type="button" class="btn btn-success" ng-click="guardarParqueadero()" ng-show="!actualizar">
                    Guardar
                </button>
                <button type="button" class="btn btn-success" ng-click="actualizarParqueadero()" ng-show="actualizar">
                    Actualizar
                </button>

            </div>
        </div>
    </div>

    <!-- Mostrar lista -->
    <div class="container-fluid" ng-show="mostrarLista" id="listaParqueaderos">
        <div class="row d-flex justify-content-center">
            <div class="col-6" style="text-align: center"><h1>Lista de Parqueaderos</h1></div>
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Razon Social</th>
                <th scope="col">Plazas para Carros</th>
                <th scope="col">Plazas para Motos</th>
                <th scope="col">Valor del minuto para carro</th>
                <th scope="col">Valor del minuto para moto</th>
                <th scope="col">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="parqueadero in parqueaderos">
                <th scope="row">{{parqueadero.id}}</th>
                <td>{{parqueadero.razonSocial}}</td>
                <td>{{parqueadero.numPlazasCarro}}</td>
                <td>{{parqueadero.numPlazasMoto}}</td>
                <td>{{parqueadero.valorMinutoCarro}}</td>
                <td>{{parqueadero.valorMinutoMoto}}</td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <button type="button" class="btn btn-outline-info btn-sm" style="cursor: pointer"
                                class="nav-link" ng-click="mostrarFormActualizarParqueadero(parqueadero)">Actualizar
                        </button>
                        <button type="button" class="btn btn-outline-danger btn-sm" style="cursor: pointer"
                                ng-click="abrirModalParqueadero(parqueadero.id)">Eliminar
                        </button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <!-- fin lista-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Eliminar Parqueadero</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Está seguro que desea eliminar el parqueadero?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" ng-click="eliminarParqueadero()"
                        >Eliminar
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- finModal -->
    </div>
</div>
</body>
<script src="ctlrParking.js"></script>
</html>
