<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.register" %>

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
						Kayıt Ol
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Kullanıcı adını girin.">
						<input class="input100" id="username" runat="server" type="text" placeholder="Kullanıcı Adı">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Şifreyi girin.">
						<input class="input100" id="password" runat="server" type="password" placeholder="Şifre">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Adı girin.">
						<input class="input100" id="adi" runat="server" type="text" placeholder="Adı">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Soyadı girin.">
						<input class="input100" id="soyadi" runat="server" type="text" placeholder="Soyadı">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Telefonu girin.">
						<input class="input100" id="telefon" runat="server" type="text" placeholder="Telefon">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Adresi girin.">
						<textarea class="input100" id="adres" runat="server" type="text" style="padding-bottom:100px;" placeholder="Adres"/>
						<span class="focus-input100"></span>
					</div>

					<div class="text-center">
						  <strong>
							  <asp:Label ID="Label9" runat="server" Text="Böyle bir kullanıcı adı zaten mevcut." CssClass="border h6 alert alert-warning" style="display:none"></asp:Label>
						  </strong>
					</div>

					<div class="text-center">
						  <strong>
							  <asp:Label ID="Label1" runat="server" Text="Doldurulmamış alan mevcut." CssClass="border h6 alert alert-danger" style="display:none"></asp:Label>
						  </strong>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn fa-border" style="border-width:1px;border-color:black;" runat="server" onserverclick="Button1_Click">
							Kayıt ol
						</button>
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