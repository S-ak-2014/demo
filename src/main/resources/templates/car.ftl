<#import "/spring.ftl" as spring>
<head>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-sanitize.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="MainController">
<div id="content" class="form-group has-success">

    <div class="container">

        <form name="carForm" class="form-group has-success">
            <table>
                <tr>
                    <th>Maker</th>
                    <td><input type="text" name="carMaker" data-ng-model="carMaker" required></td>
                </tr>
                <tr>
                    <th>Model</th>
                    <td><input type="text" name="carModel" data-ng-model="carModel" required></td>
                </tr>
            </table>
            <button type="button" ng-disabled="carForm.$invalid" ng-click="submitCar(carMaker, carModel)">SUBMIT</button>
        </form>

        <br><br>

        <table border="1" class="table table-stripped" style="border: 2px solid black" >
            <tr bgcolor="aqua">
                <th width="250px">Maker</th>
                <th width="250px">Model</th>
            </tr>

            <#list carList as cars>
                <tr>
                    <td>${cars.carMaker}</td>
                    <td>${cars.carModel}</td>
                </tr>
            </#list>
        </table>

    </div>

</div>
</body>

<style>
    button {
        background-color: cornflowerblue;
    }

    .table tr:nth-child(even) {
        background-color: lightgrey;
    }

</style>

<script>

    var app = angular.module("myApp", []);

    app.controller("MainController", function ($scope, $http) {

        var carList = {
            carMaker : "",
            carModel : ""
        };

        $scope.submitCar = function (carMaker, carModel) {
            alert("Do you want to add Car?");

            carList.carMaker = carMaker;
            carList.carModel = carModel;

            $http({
                method : 'POST',
                url : "/",
                data : carList
            }).success(function (response) {
                $scope.processing = true;
                response.data = carList;
                location.reload();
            });
        };
    });
</script>