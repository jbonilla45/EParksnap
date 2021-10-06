<%--
  Created by IntelliJ IDEA.
  User: JorgePapa
  Date: 3/10/2021
  Time: 12:23 p. m.
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Operador</title>
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

        #listaOperadores {
            width: 60%;
        }
    </style>
</head>
<body>
<div ng-app="EasyParkingG6S57" ng-controller="ctlr">
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
                        <a class="nav-link" href="#" ng-click="mostrarFormulario()">Crear Operador</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" ng-click="listarOperador()">Listar Operadores</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="liveAlertPlaceholder"></div>

    <div class="container-fluid" ng-show="!mostrarListaOperador">
        <div class="row d-flex justify-content-center">
            <div class="col-6" style="text-align: center" ng-show="!actualizar"><h1>Crear Operador</h1></div>
            <div class="col-6" style="text-align: center" ng-show="actualizar"><h1>Actualizar Operador</h1></div>

        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-6">
                <div class="mb-3">
                    <label class="form-label">Nombre*</label>
                    <input type="text" class="form-control" placeholder="Escriba su nombre" ng-model="nombre">
                </div>
                <div class="mb-3">
                    <label class="form-label">Apellido*</label>
                    <input type="text" class="form-control" placeholder="Escriba su apellido" ng-model="apellido">
                </div>
                <div class="mb-3">
                    <label class="form-label">Cargo*</label>
                    <input type="text" class="form-control" placeholder="Escriba su cargo" ng-model="cargo">
                </div>

                <button type="button" class="btn btn-success" ng-click="guardarOperador()" ng-show="!actualizar">
                    Guardar
                </button>
                <button type="button" class="btn btn-success" ng-click="actualizarOperador()" ng-show="actualizar">
                    Actualizar
                </button>

            </div>
        </div>
    </div>

    <!-- Mostrar lista operadores -->
    <div class="container-fluid" ng-show="mostrarListaOperador" id="listaOperadores">
        <div class="row d-flex justify-content-center">
            <div class="col-6" style="text-align: center"><h1>Lista de Operadores</h1></div>
        </div>
        <table class="table table-hover table-bordered text-center">
            <thead class="table-dark">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Cargo</th>
                <th scope="col">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="operador in operadores">
                <th scope="row">{{operador.id}}</th>
                <td>{{operador.nombre}}</td>
                <td>{{operador.apellido}}</td>
                <td>{{operador.cargo}}</td>
                <td class="">
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <button type="button" class="btn btn-outline-info btn-sm" style="cursor: pointer"
                                class="nav-link" ng-click="mostrarFormActualizar(operador)">Actualizar
                        </button>
                        <button type="button" class="btn btn-outline-danger btn-sm" style="cursor: pointer"
                                ng-click="abrirModal(operador.id)">Eliminar
                        </button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <!-- fin lista operadores -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Borrar Operador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Está seguro que desea eliminar el operador?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                ng-click="eliminarOperador()">Eliminar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="ctlrOperador.js"></script>
</html>

