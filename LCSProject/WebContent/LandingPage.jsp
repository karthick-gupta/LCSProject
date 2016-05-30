<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ComCast LCS</title>
	<link rel="icon" type="image/png" href="comcast.ico">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<style>
	
		body {
			font: 20px Montserrat, sans-serif;
			line-height: 1.8;
			color: #f5f6f7;
		}
		
		p {
			font-size: 16px;
		}
		
		.margin {
			margin-bottom: 40px;
		}
		
		.bg-1 {
			background-color: #1abc9c; /* Green */
			color: #ffffff;
		}
		
		.bg-2 {
			background-color: #474e5d; /* Dark Blue */
			color: #ffffff;
		}
		 
		.bg-3 {
			background-color: #ffffff; /* White */
			color: #555555;
		}
		
		.bg-4 {
			background-color: #2f2f2f; /* Black Gray */
			color: #fff;
		}
		
		.container-fluid {
			padding-top: 70px;
			padding-bottom: 70px;
		}
		
		.navbar {
			padding-top: 15px;
			padding-bottom: 15px;
			border: 0;
			border-radius: 0;
			margin-bottom: 0;
			font-size: 12px;
			letter-spacing: 5px;
		}
		
		.navbar-nav  li a:hover {
			color: #1abc9c !important;
		}
	</style>
	
	<script>
	function validateForm(){
		
		var userData = document.getElementById("userInput").value.trim().replace(/\n/g,'');
		
		var arrayData = userData.split(",");
		var populateJSON = '{ "setOfStrings" : [';		
		
		for (var i = 0; i < arrayData.length; i++) {
				
			if(i == (arrayData.length - 1)){
				populateJSON = populateJSON + '{"value" : "' + arrayData[i].trim() + '"}';
			} else {
				populateJSON = populateJSON + '{"value" : "' + arrayData[i].trim() + '"},';
			}
			
		}
		
		populateJSON = populateJSON + ']}';
		
		document.getElementById("jsonData").value = populateJSON;
		
		/* alert(populateJSON); */
		
		return true;
	}
	</script>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="LandingPage.jsp">Home</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Instructions</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- First Container -->
	<div class="container-fluid bg-1 text-center">
		
		<h3 class="margin">Welcome User!</h3>
		
		<h5 class="margin">This Page Will Help You To Find The Largest Common String In The List Of Strings You Provide !!!</h3>
		
		<form id="LCSForm" action="LCSRequest" method="post" onsubmit="return validateForm()">
		
		<p id="err" style="color:darkred;display:none">No data entered to submit the form</p>
		<textarea id="userInput" class="bg-4" rows="5" cols="75" placeholder="Enter Comma Seperated Strings Here... Then Click Submit..." autofocus></textarea>
		
		<input type="hidden" id="jsonData" name="jsonData" />
		
		<br>
		
		<button style="background-color:#28194c">Submit</button>
		
		</form>
	</div>


	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center">
		<p>
			Comcaset LCS Project <br> - Author - <br>
			<a href="https://www.linkedin.com/in/KarthickNune" target="_blank">KarthickNune-LinkedinProfile</a>
		</p>
	</footer>

</body>
</html>