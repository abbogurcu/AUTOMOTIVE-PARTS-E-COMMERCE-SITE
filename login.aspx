<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.login" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>ERU CMA</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets2/css/argon-dashboard.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/css/util.css">
	<link rel="stylesheet" type="text/css" href="login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-color:darkgray;">
			<div class="wrap-login100">
				<form method="post" runat="server" class="login100-form validate-form">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Giriş
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" id="username" runat="server" type="text" name="username" placeholder="Kullanıcı Adı">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" id="password" runat="server" type="password" name="pass" placeholder="Şifre">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>


					<div class="text-center">
						  <strong>
							  <asp:Label ID="Label9" runat="server" Text="Kullanıcı adı veya şifre yanlış." CssClass="border h6 alert alert-warning" style="display:none"></asp:Label>
						  </strong>
					</div>


					<div class="container-login100-form-btn">
						<button class="login100-form-btn fa-border" style="border-width:1px;border-color:black;" runat="server" onserverclick="Button1_Click">
							Giriş
						</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1" style="font-size: 18px;" href="register.aspx">
							Henüz kayıt olmadın mı?
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
<!--===============================================================================================-->
	<script src="login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/bootstrap/js/popper.js"></script>
	<script src="login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/daterangepicker/moment.min.js"></script>
	<script src="login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="login/js/main.js"></script>

</body>
</html>