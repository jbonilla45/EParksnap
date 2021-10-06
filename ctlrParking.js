var app = angular.module('EasyParkingG6S57', []);

app.controller('ctlrPark', function ($scope, $http) {

    var alertPlaceholder = document.getElementById('liveAlertPlaceholder');

    function alertBootstrap(message, type) {
        var wrapper = document.createElement('div')
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

        alertPlaceholder.append(wrapper)
    }

    /*PROCEDIMIENTOS PARA PARQUEADERO*/

    $scope.guardarParqueadero = function () {
        if ($scope.razonSocial === undefined || $scope.numPlazasCarro === undefined || $scope.numPlazasMoto === undefined) {
            alert('Todos los campos son obligatorios');

        } else {
            console.log('Entra a guardar Parqueadero');
            let parqueadero = {
                proceso: 'guardarParqueadero',
                razonSocial: $scope.razonSocial,
                numPlazasCarro: $scope.numPlazasCarro,
                numPlazasMoto: $scope.numPlazasMoto,
                valorMinutoCarro: $scope.valorMinutoCarro,
                valorMinutoMoto: $scope.valorMinutoMoto
            };

            $http({
                method: 'POST',
                url: 'PeticionesParking.jsp',
                params: parqueadero
            }).then(function (respuesta) {
                console.log(respuesta);
                if (respuesta.data.guardarParqueadero) {
                    alertBootstrap('Parqueadero Guardado!', 'success');
                    $scope.listarParqueadero();
                } else {
                    alert('Error al guardar en la BD');
                }
            }).catch(function (error) {
                alert('Servicio no disponible, intente más tarde!');
                console.log(error);
            });
        }
    };

    $scope.listarParqueadero = function () {
        $scope.mostrarLista = true;
        let params = {
            proceso: 'listarParqueadero'
        };

        $http({
            method: 'GET',
            url: 'PeticionesParking.jsp',
            params: params
        }).then(function (respuesta) {
            $scope.parqueaderos = respuesta.data.Parqueadero;
            console.log($scope.parqueaderos);
        });
    };

    $scope.eliminarParqueadero = function () {

        let params = {
            proceso: 'eliminarParqueadero',
            id: $scope.id
        };
        $http({
            method: 'GET',
            url: 'PeticionesParking.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.eliminarParqueadero) {
                alertBootstrap('Parqueadero eliminado!', 'success');
                $scope.listarParqueadero();
            } else {
                alert('Error al eliminar operador');
            }
        });
    };

    $scope.actualizarParqueadero = function () {
        let params = {
            proceso: 'actualizarParqueadero',
            id: $scope.id,
            razonSocial: $scope.razonSocial,
            numPlazasCarro: $scope.numPlazasCarro,
            numPlazasMoto: $scope.numPlazasMoto,
            valorMinutoCarro: $scope.valorMinutoCarro,
            valorMinutoMoto: $scope.valorMinutoMoto

        };

        $http({
            method: 'GET',
            url: 'PeticionesParking.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.actualizarParqueadero) {
                alertBootstrap('Parqueadero Actualizado!', 'success');
                $scope.listarParqueadero();
            } else {
                alert('No se pudo actualizar');
            }
            console.log(respuesta);
        });
    };

    $scope.mostrarFormulario = function () {
        $scope.mostrarLista = false;
    };

    $scope.mostrarFormActualizarParqueadero = function (parqueadero) {
        $scope.mostrarLista = false;
        $scope.actualizar = true;
        $scope.id = parqueadero.id;
        $scope.razonSocial = parqueadero.razonSocial;
        $scope.numPlazasCarro = parqueadero.numPlazasCarro;
        $scope.numPlazasMoto = parqueadero.numPlazasMoto;
        $scope.valorMinutoCarro = parqueadero.valorMinutoCarro;
        $scope.valorMinutoMoto = parqueadero.valorMinutoMoto;
    };

    $scope.abrirModalParqueadero = function (id) {
        $scope.id = id;
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        myModal.show();
    };


});