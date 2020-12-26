<#import "/spring.ftl" as spring>


<div class="myDiv">
    <div class="row">
        <div class="form-group has-success">
            <label>Car Make</label>
            <input type="text" class="form-control" ng-model="make"><br><br>
        </div>
    </div>
    <div class="row">
        <div class="form-group has success">
            <label>Car Model</label>
            <input type="text" class="form-control" ng-model="model"><br><br>
        </div>
    </div>
    <div class="row">
        <button ng-click="carList()" type="button" class="btn btn-outline btn-primary btn-xs">
            Car List
        </button>
    </div>
</div>
<div class="list-view">
    <div class="form-group on-success">
        <table class="datatable">
            <tr>
                <th>Make</th>
                <th>Model</th>
            </tr>
            <#list carList as carlist>
                <tr>
                    <td>${carlist.make}</td>
                    <td>${carlist.model}</td>
                </tr>
            </#list>
        </table>
    </div>
</div>

<style>
    .myDiv {
        padding-left: 50px;
        padding-top: 20px;
        border : 2px black;
        background-color : aliceblue;
    }
</style>

<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-sanitize.js"></script>
<script>
    var make;
    var model;

    function carList() {
        carlist.make = make;
        carlist.model = model;
    }
</script>