<#import "/spring.ftl" as spring>

<body ng-app="myApp" ng-controller="MainController">
<div id="content" class="form-group has-success">

    <form>
        <table border="1">
            <tr>
                <th bgcolor="#ffefd5">Make</th>
                <td><input type="text" class="form-control" ng-model="carMake"/></td>
            </tr>
            <tr>
                <th bgcolor="#ffefd5">Model</th>
                <td><input type="text" class="form-control" ng-model="carModel"/></td>
            </tr> <br><br>
        </table>
        <button ng-submit="submitCar(carMake, carModel)", type="submit">Submit</button>
    </form>
    <table border="1" class="table table-stripped" style="border: 2px solid black" >
        <tr bgcolor="aqua">
            <th width="250px">Make</th>
            <th width="250px">Model</th>
        </tr>

        <#assign carList = [
        {"carMake":"Ford", "carModel":"Mustang"},
        {"carMake":"Buggati", "carModel":"Veyron"},
        {"carMake":"Mahindra", "carModel":"Thar"}
        ]>

        <#list carList as cars>
            <tr>
                <td>${cars.carMake}</td>
                <td>${cars.carModel}</td>
            </tr>
        </#list>
    </table>

</div>
</body>

<style>
    table::-webkit-resizer {
        size: 200px;
    }
    button {
        background-color: cornflowerblue;
    }
</style>

<script>
    var car_O = '{"carMake" : "Ford", "carModel" : "Boss-429"}';
    var carList = JSON.parse(car_O);
    var app = angular.module("myApp", []);

    app.controller("MainController", function($scope, $http){
        $scope.cars =[];
        $scope.carList = {
            id : -1,
            carMake : "",
            carModel : ""
        };

        _refreshCarData();

        function submitCar(carMake, carModel) {

        }

        $scope.submitCar = function(carMake, carModel) {
            var data = {};
            data.carList.carMake = carMake;
            data.carList.carModel = carModel;
            location.reload();

            $http({
                method : 'POST',
                url : '/',
                data : data
            }).success(function (){
                $scope.processing = false;

                $('input[ng-model]').each(function () {
                    angular.element(this).controller('ngModel').$setViewValue($(this).val());
                });

            }).error(function(data){
                alert(JSON.stringify(data));
            })
        };

        function _refreshCarData() {
            $http({
                method : 'GET',
                url : 'http://localhost:8080'
            }).then(function successCallBack(response) {
                $scope.car = response.data;
            }, function errorCallBack(response) {
                console.log(response.statusText);
            });
        }

        function _clearFormData() {
            $scope.carList.id = -1;
            $scope.carList.carMake = "";
            $scope.carList.carModel = "";
        };
    });
</script>
