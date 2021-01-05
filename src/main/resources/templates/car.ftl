<#import "/spring.ftl" as spring>

<body ng-app="demo" ng-controller="MainController">
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
        <button type="button" ng-click="submitCar(carMake, carModel)">Submit</button>
    </form>
    <table border="1" class="table table-stripped" style="border: 2px solid black" >
        <tr bgcolor="aqua">
            <th width="250px">Make</th>
            <th width="250px">Model</th>
        </tr>

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
    button {
        background-color: cornflowerblue;
    }
</style>

<!--Work on the submitCar function to get the data listed in the carList-->
<script>

    var app = angular.module("demo", []);

    app.controller("MainController", function ($scope, $http) {

        var carList = {
            carMake : "",
            carModel : ""
        }
        $scope.submitCar = function(carMake, carModel) {

            alert("Are you sure that you want to add car?")

            var data = {};

            carList.carMake = carMake;
            carList.carModel = carModel;

            $http({
               method : 'POST',
               url : "/",
               data : data
            }).success(function(response) {
                $scope.processing = true;
                response.data = carList;
            });

        }

    })

</script>