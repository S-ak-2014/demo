<#import "/spring.ftl" as spring>

<body ng-app="myApp" ng-controller="MainController">
<div id="content">

    <form name = "carForm" ng-submit = "submitCar()">
        <table>
            <tr>
                <th>Make</th>
                <td><input type="text" ng-model="carForm.carMake"/></td>
            </tr>
            <tr>
                <th>Model</th>
                <td><input type="text" ng-model="carForm.carModel"/></td>
            </tr> <br><br>
            <tr>
                <td colspan="2"><input type="submit" value="Submit" class="blue-button"/> </td>
            </tr>
        </table>
    </form>
    <table class="datatable">
        <tr>
            <th>Make</th>
            <th>Model</th>
        </tr>

        <#list car as carMake, carModel>
            <tr>
                <td>${carMake}</td>
                <td>${carModel}</td>
            </tr>
        </#list>
    </table>

</div>
</body>
<script>
    var app = angular.module("myApp", []);

    app.controller("MainController", function($scope, $http){
        $scope.cars =[];
        $scope.carForm = {
            id : -1,
            carMake : "",
            carModel : ""
        };

        _refreshCarData();

        $scope.submitCar = function() {

            $http({
                method : 'POST',
                url : '/cars',
                data : angular.toJson($scope.carForm),
                header : {
                    'Content-Type' : 'application/json'
                }
            }).then(_success, _error);
        };

        function _refreshCarData() {
            $http({
                method : 'GET',
                url : 'http://localhost:8080/cars'
            }).then(function successCallBack(response) {
                $scope.car = response.data;
            }, function errorCallBack(response) {
                console.log(response.statusText);
            });
        }

        function _success(response) {
            _refreshCarData();
            _clearFormData()
        }

        function _error() {
            console.log(response.statusText)
        }

        function _clearFormData() {
            $scope.carForm.id = -1;
            $scope.carForm.carMake = "";
            $scope.carForm.carModel = "";
        };
    });
</script>