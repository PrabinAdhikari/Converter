<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.2/angular.min.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.js">
	
</script>
<script type="text/javascript">
	$(function() {
		//alert("on load");
		//$("#amount1").on("keyup", convert); 
		$(document).on('keyup', '#amount1', function() {
			convert();
		})
		function convert() {
			//	alert($(JSON.stringify($("#dataform").serializeObject())));
			$.ajax({
				url : "convert",
				type : "POST",
				dataType : 'JSON',
				contentType : 'application/json',
				data : JSON.stringify($("#dataform").serializeObject())
			}).done(function(data) {
				console.log("Before Parse::" + data);
				$("#amount2").val(data);
			}).error(function(a, b, c) {
				console.log("Prabin 1234");
			})
		}

		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
	})
</script>

<script type="text/javascript">
	var myApp1 = angular.module('myApp', []);

	myApp1.controller('convertorCtrl', [
			'$scope',
			'$http',
			function($scope, $http) {
				$scope.amount1 = 1;
				$scope.currency1 = {
					"value123" : "AUD",
					"values" : [ "EUR", "AUD", "BGN", "BRL", "CAD", "CHF",
							"CNY", "CZK", "DKK", "GBP", "HKD", "HRK", "HUF",
							"IRD", "ILS", "INR" ]
				};
				$scope.currency2 = {
					"value" : "AUD",
					"values" : [ "EUR", "AUD", "BGN", "BRL", "CAD", "CHF",
							"CNY", "CZK", "DKK", "GBP", "HKD", "HRK", "HUF",
							"IRD", "ILS", "INR" ]
				};

				$scope.amount2 = 1;

				$scope.convert = function() {
					//alert(amount1);
					var data = {
						from : $scope.currency1.value123,
						to : $scope.currency2.value,
						amtFrom : $scope.amount1,
						amtTo : "0"

					}
					data = JSON.stringify(data);
					console.log(data);
					$http.post('convert', data).success(function(data, status) {
						$scope.amount2 = data;
					})
				}
			} ])
</script>

</head>
<body>
	Currency converter :

	<div>

		<form id="dataform">

			<select id="fromCountry" name="from">
				<option selected>EUR</option>
				<option>AUD</option>
				<option>BGN</option>
				<option>BRL</option>
				<option>CAD</option>
				<option>CHF</option>
				<option>CNY</option>
				<option>CZK</option>
				<option>DKK</option>
				<option>GBP</option>
				<option>HKD</option>
				<option>HRK</option>
				<option>HUF</option>
				<option>IDR</option>
				<option>ILS</option>
				<option>INR</option>
			</select> <input id="amount1" type="text" name="amtFrom"
				placeholder="Enter Amount" /> <br /> <select id="toCountry"
				name="to">
				<option selected="selected">EUR</option>
				<option>AUD</option>
				<option>BGN</option>
				<option>BRL</option>
				<option>CAD</option>
				<option>CHF</option>
				<option>CNY</option>
				<option>CZK</option>
				<option>DKK</option>
				<option>GBP</option>
				<option>HKD</option>
				<option>HRK</option>
				<option>HUF</option>
				<option>IDR</option>
				<option>ILS</option>
				<option>INR</option>
			</select> <input id="amount2" type="text" name="amtTO"
				placeholder="Enter Amount" /> <br /> <br /> <input type="button"
				id="convertButton" value="convert" />
		</form>
	</div>

	<div id="converter" ng-app="myApp">
		<div ng-controller="convertorCtrl">
			<select ng-model="currency1.value123"
				ng-options="v for v in currency1.values" ng-change="convert()">
			</select> <input id="" type="text" name="amtFrom" placeholder="Enter Amount"
				ng-model="amount1" ng-change="convert()" /> <br /> <select
				ng-model="currency2.value" ng-change="convert()"
				ng-options="v for v in currency2.values"></select> <input id=""
				type="text" name="toAmt" placeholder="Enter Amount"
				ng-model="amount2" />

		</div>
	</div>
</body>
</html>
