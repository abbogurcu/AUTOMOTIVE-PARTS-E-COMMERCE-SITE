<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.profile" %>

<!DOCTYPE html>
<html lang="en">
    <head>
   <!-- Basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Mobile Metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- Site Metas -->
   <title>ERU CAR MECHANIC AND ACCESSORIES</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- site icon -->
   <link rel="icon" href="images/fevicon.png" type="image/png" />
   <!-- Bootstrap core CSS -->
   <link href="css/bootstrap.css" rel="stylesheet">
   <!-- FontAwesome Icons core CSS -->
   <link href="css/font-awesome.min.css" rel="stylesheet">
   <!-- Custom animate styles for this template -->
   <link href="css/animate.css" rel="stylesheet">
   <!-- Custom styles for this template -->
   <link href="style.css" rel="stylesheet">
   <!-- Responsive styles for this template -->
   <link href="css/responsive.css" rel="stylesheet">
   <!-- Colors for this template -->
   <link href="css/colors.css" rel="stylesheet">
   <!-- light box gallery -->
   <link href="css/ekko-lightbox.css" rel="stylesheet">

   <!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
   <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->
   </head>
   <body id="home_page" class="home_page">
       <form method="post" id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager >
      <asp:Label runat="server" style="display:none;" ID="Label25"></asp:Label>
      <!-- end loader -->
      <!-- header -->
      <header class="header">
           
        <div class="header_top_section">
           <div class="container" style="width:auto !important;margin-left:25px !important;margin-right:25px !important;">
              <div class="row">
               <div class="col-lg-3">
                  <div class="full">
                     <div class="logo" style="margin-left: 15px;">
                        <a href="default.aspx"><img src="images/logov2.png" alt="#" /></a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 site_information">
                  <div class="full">
                      <div class="top_section_info">
                         <ul>
                           <li>İletişim : <img src="images/i1.png" alt="#" /> <a href="#">( +90 352 207 66 66 )</a></li>
                           <li><img src="images/i2.png" alt="#" /> <a href="#">basinyayin@erciyes.edu.tr</a></li>
                           <li style="margin-top:10px;"><img src="images/i3.png" alt="#" / > <a href="#">Yenidoğan, Turhan Baytop Sokak No:1, 38280 Talas/Kayseri</a></li>
                        </ul>
                      </div>
                  </div>
               </div>
               <div class="col-lg-3" style="padding-top:30px;">
                        <a class="h5 fa-border btn-outline-success pull-right" style="width: 160px;margin-left: 5px;padding-right:10px;color:white;border-radius:10px;border-width:1px;" href="basket.aspx"><img style="width:52px;height:auto" src="images/basketv2.png" alt="#" />Sepet</a> 
                        <div id="sepetLabelSergile" runat="server">
                         <asp:Label CssClass="fa-border h5 fa-border btn-success pull-right" style="border-color:black;color: white;border-radius: 30px;padding: 3px 10px;position: absolute;right: 20px; top: 49px;font-weight: 300;" runat="server" ID="sepetLabel"></asp:Label>
                        </div>
                        <a class="h5 fa-border btn-outline-warning pull-right" style="padding-right:10px;color:white;border-radius:10px;border-width:1px;" href="profile.aspx"><img style="width:52px;height:auto" src="images/profile.png" alt="#" />Hesabım</a>                      
               </div>
               <div class="col-lg-2">
                   <div class="pull-right" style="display:-webkit-inline-box;">
                      <asp:Label CssClass="h6" style="color:white;" runat="server" id="adisoyadi"></asp:Label>
                       <a onserverclick="logout2_ServerClick" class="btn-outline-danger fa-border" style="border-width:0px;border-radius:10px;font-weight: bold;font-size:15px;text-decoration:underline !important;" id="session" runat="server">çıkış yap.</a>
                   </div>
                </div>
           </div>
         </div>
       </div>

        <div class="header_bottom_section" style="border-color:black;">

         <div class="container">
            
           <div class="row">
               <div class="col-md-12">
                  <div class="full ">
                     <div class="main_menu">
                        <nav class="navbar navbar-inverse navbar-toggleable-md">
                           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#cloapediamenu" aria-controls="cloapediamenu" aria-expanded="false" aria-label="Toggle navigation">
                           <span class="float-left">Menu</span>
                           <span class="float-right"><i class="fa fa-bars"></i> <i class="fa fa-close"></i></span>
                           </button>
                           <div class="collapse navbar-collapse justify-content-md-center" id="cloapediamenu">
                             <ul class="navbar-nav">
                                 <li class="nav-item">
                                    <a class="nav-link" href="default.aspx">Ana Sayfa</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link color-aqua-hover" href="mechanic.aspx">Mekanik</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link color-aqua-hover" href="acces.aspx">Aksesuar</a>
                                 </li>
                                 <li class="nav-item active" >
                                    <a class="nav-link color-grey-hover" href="profile.aspx?siparisler">Siparişlerim</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link color-grey-hover" href="contact.aspx">İletişim</a>
                                 </li>
                              </ul>
                           </div>
                        </nav>
                     </div>
                     <div class="search_bar">
                       
                           <input type="text" class="search_field" placeholder="Search" required />
                           <button class="search_button" type="button"><i class="fa fa-search"></i></button>
                       
                     </div>
                  </div>
               </div>
            </div>
         </div>
       </div>
           
      </header>
      <!-- end header -->

      <!--Main Content -->
    <div class="container" style="padding-left:15px !important;padding-right:15px !important;">
        <div class="row justify-content-center">
            <div class="col-md-3 fa-border" style="max-height: 300px;border-color:rgba(0,0,0,0.5);margin-top:100px;margin-bottom:100px;border-radius:10px;">
                <h4 class="fa-border form-control-label" style="display: inline-block;width: 100%;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);margin-top:10px;">
                    <img style="width:64px;height:auto" src="images/profile.png" alt="#" />
                    <asp:Label style="font-size: 16px;" runat="server" ID="labelUsername"></asp:Label>
                    <asp:Label runat="server" ID="userID" style="display:none"></asp:Label>
                </h4>
                <div id="div4" runat="server">
                    <h4><asp:LinkButton OnClientClick="profil(1);return false;disable(this);" class="fa-border text-center btn-outline-warning" style="width: 100%;border-radius: 20px;margin-top:100px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Profil Bilgilerim</asp:LinkButton></h4>

                    <h4><asp:LinkButton OnClientClick="profil(2);return false;disable(this);" class="fa-border text-center btn-outline-warning" style="width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Siparişlerim</asp:LinkButton></h4>
                </div>

            </div>
            <div class="col-md-9" style="padding-left:35px;border-color:black;border-width:0px;border-left-width:1px;">
                    <div id="div1" runat="server">
                        <div style="padding-bottom:50px;margin-top:100px;">
                        <!-- Şifre Değiştirme -->
                        <div style="display: -webkit-inline-box;width:300px;" id="sifre" runat="server">
                            <asp:Label CssClass="h6" style="color:black;" text="Şifre :" runat="server"></asp:Label>
                            <asp:Label style="margin-left:5px;color:black;display:none;margin-top: 4px;" type="password" ID="sifreLabel" class="h6" runat="server"></asp:Label>
                            <h6><asp:LinkButton ID="sifreGoster" OnClientClick="sifreGoster(1);return false;" class="fa-border text-center btn-primary" style="margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Göster</asp:LinkButton></h6>
                            <h6><asp:LinkButton ID="sifreSakla" OnClientClick="sifreGoster(2);return false;" class="fa-border text-center btn-secondary" style="margin-left:10px;width: 100%;border-radius: 20px;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);display:none;" runat="server">
                        Sakla</asp:LinkButton></h6>
                            <h6><asp:LinkButton OnClientClick="sifre(1);return false;" class="fa-border text-center btn-outline-primary" style="margin-left:20px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Güncelle</asp:LinkButton></h6>
                        </div>
                        <div id="sifre2" runat="server" style="width: 300px;display:none;">
                            <asp:TextBox ID="password" placeholder="Yeni şifrenizi girin!" class="form-control" runat="server"></asp:TextBox>
                            <div style="display:-webkit-inline-box">
                                <asp:TextBox ID="password2" placeholder="Yeni şifrenizin tekrarını girin!" class="form-control" runat="server"></asp:TextBox>
                                <h6><asp:LinkButton OnClientClick="sifre(3);return false;" class="fa-border text-center btn-outline-success" style="margin-top: 10px;margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            Onayla</asp:LinkButton></h6>
                                <h6><asp:LinkButton OnClientClick="sifre(2);return false;" class="fa-border text-center btn-outline-danger" style="margin-top: 10px;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            İptal</asp:LinkButton></h6>
                            </div>
                        </div>
                        <div class="text-center" runat="server">
                            <strong>
                                <asp:Label ID="Label2" runat="server" Text="Şifreler uyuşmuyordu." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="Alan boş bırakıldı." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="Şifre başarıyla değişti." CssClass="alert alert-success" style="display:none;"></asp:Label>
                            </strong>
                        </div>
                        <div class="text-center" runat="server">
                            <strong>
                            </strong>
                        </div>

                        <!-- Bitiş Şifre Değiştirme -->

                        <!-- Ad Değiştirme -->
                        <div style="display: -webkit-inline-box;margin-top:20px;width:300px;" id="ad" runat="server">
                            <asp:Label CssClass="h6" style="color:black;" text="Adı :" runat="server"></asp:Label>
                            <asp:Label style="margin-left:5px;color:black;" ID="adLabel" class="h6" runat="server"></asp:Label>
                            <h6><asp:LinkButton OnClientClick="ad(1);return false;" class="fa-border text-center btn-outline-primary" style="margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Güncelle</asp:LinkButton></h6>
                        </div>
                        <div id="ad2" runat="server" style="width: 300px;display:none;margin-top:20px;">
                            <asp:TextBox ID="adi" placeholder="Adınızı girin!" class="form-control" runat="server"></asp:TextBox>
                            <h6><asp:LinkButton OnClientClick="ad(3);return false;" class="fa-border text-center btn-outline-success" style="margin-top: 10px;margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Onayla</asp:LinkButton></h6>
                            <h6><asp:LinkButton OnClientClick="ad(2);return false;" class="fa-border text-center btn-outline-danger" style="margin-top: 10px;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        İptal</asp:LinkButton></h6>
                        </div>
                        <div class="text-center" runat="server">
                            <strong>
                                <asp:Label ID="Label4" runat="server" Text="Ad boş bırakılamaz." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="Ad başarıyla değişti." CssClass="alert alert-success" style="display:none;"></asp:Label>
                            </strong>
                        </div>
                        <!-- Bitiş Ad Değiştirme -->

                        <!-- Soyad Değiştirme -->
                        <div style="display: -webkit-inline-box;margin-top:20px;width:300px;" id="soyad" runat="server">
                            <asp:Label CssClass="h6" style="color:black;" text="Soyadı :" runat="server"></asp:Label>
                            <asp:Label style="margin-left:5px;color:black;" ID="soyadLabel" class="h6" runat="server"></asp:Label>
                            <h6><asp:LinkButton OnClientClick="soyad(1);return false;" class="fa-border text-center btn-outline-primary" style="margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Güncelle</asp:LinkButton></h6>
                        </div>
                        <div id="soyad2" runat="server" style="width: 300px;display:none;margin-top:20px;">
                            <asp:TextBox ID="soyadi" placeholder="Soyadınızı girin!" class="form-control" runat="server"></asp:TextBox>
                            <h6><asp:LinkButton OnClientClick="soyad(3);return false;" class="fa-border text-center btn-outline-success" style="margin-top: 10px;margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Onayla</asp:LinkButton></h6>
                            <h6><asp:LinkButton OnClientClick="soyad(2);return false;" class="fa-border text-center btn-outline-danger" style="margin-top: 10px;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        İptal</asp:LinkButton></h6>
                        </div>
                        <div class="text-center" runat="server">
                            <strong>
                                <asp:Label ID="Label6" runat="server" Text="Soyad boş bırakılamaz." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label7" runat="server" Text="Soyad başarıyla değişti." CssClass="alert alert-success" style="display:none;"></asp:Label>
                            </strong>
                        </div>
                        <!-- Bitiş Soyad Değiştirme -->

                        <!-- Telefon Değiştirme -->
                        <div style="display: -webkit-inline-box;margin-top:20px;width:300px;" id="tel" runat="server">
                            <asp:Label CssClass="h6" style="color:black;" text="Telefon :" runat="server"></asp:Label>
                            <asp:Label style="margin-left:5px;color:black;" ID="telefonLabel" class="h6" runat="server"></asp:Label>
                            <h6><asp:LinkButton OnClientClick="tel(1);return false;" class="fa-border text-center btn-outline-primary" style="margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Güncelle</asp:LinkButton></h6>
                        </div>
                        <div id="tel2" runat="server" style="width: 300px;display:none;margin-top:20px;">
                            <asp:TextBox ID="telefon" placeholder="Telefon numaranızı girin!" class="form-control" runat="server"></asp:TextBox>
                            <h6><asp:LinkButton OnClientClick="tel(3);return false;" class="fa-border text-center btn-outline-success" style="margin-top: 10px;margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Onayla</asp:LinkButton></h6>
                            <h6><asp:LinkButton OnClientClick="tel(2);return false;" class="fa-border text-center btn-outline-danger" style="margin-top: 10px;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        İptal</asp:LinkButton></h6>
                        </div>
                        <div class="text-center" runat="server">
                            <strong>
                                <asp:Label ID="Label8" runat="server" Text="Telefon boş bırakılamaz." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label9" runat="server" Text="Telefon başarıyla değişti." CssClass="alert alert-success" style="display:none;"></asp:Label>
                            </strong>
                        </div>
                        <!-- Bitiş Telefon Değiştirme -->

                         <!-- Adres Değiştirme -->
                        <div style="width:300px;display:inline-grid;" id="adres" runat="server">
                            <div style="display:-webkit-inline-box;margin-top:20px">
                                <asp:Label CssClass="h6" style="color:black;" text="Adres :" runat="server"></asp:Label>
                                <asp:DropDownList onchange="adres(4);return false;" CssClass="form-control h6" runat="server" ID="DropDownList1" style="padding-bottom: 5px;margin-top: -5px;margin-left:5px;"></asp:DropDownList>
                            </div>
                            <div style="display:-webkit-inline-box">
                                <textarea readonly id="TextArea1" class="form-control h6" runat="server" style="padding-bottom:100px;margin-left:60px;"></textarea>
                                <h6><asp:LinkButton OnClientClick="adres(1);return false;" class="fa-border text-center btn-outline-primary" style="margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            Güncelle</asp:LinkButton></h6>
                                 <h6><asp:LinkButton OnClientClick="adres(5);return false;" class="fa-border text-center btn-outline-danger" style="margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            Sil</asp:LinkButton></h6>
                            </div>
                        </div>
                        <div id="adres2" runat="server" style="width: 300px;display:none">
                            <div style="width: 300px;display:-webkit-inline-box;">
                                <asp:Label CssClass="h6" style="color:black;margin-top:20px;" text="Adres :" runat="server"></asp:Label>
                                <textarea id="TextArea2" class="form-control h6" placeholder="Yeni adresinizi girin!" runat="server" style="margin-left:5px;padding-bottom:100px;"></textarea>
                                <h6><asp:LinkButton OnClientClick="adres(3);return false;" class="fa-border text-center btn-outline-success" style="margin-top: 10px;margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            Onayla</asp:LinkButton></h6>
                                <h6><asp:LinkButton OnClientClick="adres(2);return false;" class="fa-border text-center btn-outline-danger" style="margin-top: 10px;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            İptal</asp:LinkButton></h6>
                            </div>
                            <div style="margin-left: 60px;">
                            <asp:TextBox ID="adresTxt" placeholder="Adres adını girin!" class="form-control" style="display:none;width: 300px;" runat="server"></asp:TextBox>
                            </div>
                         </div>
                            <div class="text-center" runat="server">
                                <strong>
                                     <asp:Label ID="LabelSil" runat="server" Text="Adres başarıyla silindi." CssClass="alert alert-danger" style="display:none;margin-left: 60px;width:350px;"></asp:Label>
                                    <asp:Label ID="Label10" runat="server" Text="Adres boş bırakılamaz." CssClass="alert alert-danger" style="margin-left: 60px;display:none;width:350px;"></asp:Label>
                                    <asp:Label ID="Label11" runat="server" Text="Adres başarıyla değişti." CssClass="alert alert-success" style="margin-left: 60px;display:none;width:350px;"></asp:Label>
                                </strong>
                            </div>
                        <!-- Bitiş Adres Değiştirme -->
                   </div>
                   </div>
                    <div id="div2" style="display:none;padding-top:1px;padding-bottom:50px;" runat="server">

                      <div style="float:right;display:-webkit-inline-box;margin-top:30px;">
                           <div class="h6" style="padding-top: 8px;margin-right:5px;">Tarihe Göre Listele :</div>
                             <div class="dropdown h6">
                              <button class="fa-border text-center btn-danger dropdown-toggle h6" style="padding:5px 5px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Seçiniz
                              </button>
                              <div class="dropdown-menu float-right" aria-labelledby="dropdownMenu2">
                                <button runat="server" onserverclick="siparisAy" class="dropdown-item h6" type="button">Son 30 Gün</button>
                                <button runat="server" onserverclick="siparisYil" class="dropdown-item h6" type="button">Son 1 Yıl</button>
                                <button runat="server" onserverclick="siparisTumu" class="dropdown-item h6" type="button">Tümü</button>
                              </div>
                            </div>
                        </div>

                       <div style="margin-top:100px;">
                        <asp:Repeater runat="server" ID="Repeater1" OnItemDataBound="ItemDataBound">
                            <ItemTemplate>
                             <div class="fa-border" style="padding-left: 10px;padding-right: 10px;padding-top:10px;padding-bottom:45px;border-radius:20px;border-color:rgba(0,0,0,0.4);margin-bottom: 50px;">
                              <asp:Label runat="server" id="Label13" CssClass="h6" style="color:black;margin:0px 5px;">Sipariş No : <%# Eval("siparisID") %></asp:Label>
                                 <asp:Label runat="server" id="Label12" CssClass="h6" style="float:right;color:black;margin:0px 5px;">Sipariş Tarihi : <%# Eval("tarih") %></asp:Label>
                                <table border="1" id="tableSiparis" style="border-collapse:unset;border-color:rgba(0,0,0,0.6);width:100%">
                                    <tbody>
                                        <tr class="alert alert-info h6 text-center">
                                            <th style="font-size:14px;" scope="col">Ürün Adı</th>
                                            <th style="font-size:14px;" scope="col">Adet</th>
                                            <th style="font-size:14px;" scope="col">Adres</th>
                                            <th style="font-size:14px;" scope="col">Kargo Firması</th>
                                            <th style="font-size:14px;" scope="col">Kargo No</th>
                                            <th style="font-size:14px;" scope="col">Birim Fiyatı</th>
                                            <th style="font-size:13px;" scope="col">Fiyat</th>
                                            <th style="font-size:14px;" scope="col"></th>
	                        	        </tr>
                                        <asp:Repeater runat="server" ID="Repeater2">
                                            <ItemTemplate>
                                                    <td style="width:172px;">  
                                                        <div class="text-center h6">
                                                            <asp:Label runat="server" id="Text1" style="color:black;margin:0px 5px;"><%# Eval("urun")+" "+ Eval("kategori") %></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td style="width:30px;">  
                                                        <div class="text-center h6">
                                                            <asp:Label runat="server" id="Label14" style="color:black;margin:0px 5px;"><%# Eval("adet") %></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td style="width:30px;">  
                                                        <div class="text-center h6">
                                                            <asp:Label runat="server" id="Label15" style="font-size: 12px;color:black;margin:0px 5px;"><%# Eval("adres") %></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td style="width:111px;">  
                                                        <div class="text-center h6">
                                                            <asp:Label runat="server" id="Label16" style="color:black;margin:0px 5px;"><%# Eval("kargo") %></asp:Label>
                                                        </div>
                                                    </td>
                                                   <td style="width:101px;">  
                                                        <div class="text-center h6">
                                                            <asp:Label runat="server" id="Label17" style="color:black;margin:0px 5px;"><%# Eval("kargoNo") %></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td style="width:90px;">  
                                                        <div class="text-center h6">
                                                            <asp:Label runat="server" id="Label18" style="font-size: 15px;color:black;margin:0px 5px;"><%# Eval("fiyat") %> TL</asp:Label>
                                                        </div>
                                                    </td>
                                                    <td style="width:117px;">  
                                                        <div class="text-center h6">
                                                            <asp:Label runat="server" id="totalFiyat" style="color:black;margin:0px 5px;"><%# Eval("totalFiyat") %> TL</asp:Label>
                                                        </div>
                                                    </td>
                                                    <td style="width:50px;">  
                                                        <div class="text-center h6">
                                                           <h4><asp:LinkButton href='<%# string.Format("urun.aspx?{0}", Eval("urunID")) %>' class="fa-border text-center btn-outline-primary" style="padding:0px 5px;margin-top:5px;width: 100%;border-radius: 20px;display:inline-block;border-color:rgba(0,0,0,0.5);" runat="server">
                                                              Detay</asp:LinkButton></h4>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <asp:Label runat="server" id="Label21" CssClass="h6 alert alert-success" style="float:right;color:black;margin:0px 5px;">Toplam Fiyat(KDV Hariç) : <%# Eval("KDVsiz") %> TL</asp:Label><br /><br />
                                <asp:Label runat="server" id="Label20" CssClass="h6 alert alert-danger" style="float:right;color:black;margin:0px 5px;">Toplam KDV : <%# Eval("KDV") %> TL</asp:Label><br /><br />
                                <asp:Label runat="server" id="Label19" CssClass="h6 alert alert-info" style="float:right;color:black;margin:0px 5px;">Toplam Fiyat : <%# Eval("genelToplam") %> TL</asp:Label><br />
                              </div>
                           </ItemTemplate>
                        </asp:Repeater>
                      </div>
                    </div>
                    <div id="div3" style="display:none;" runat="server">
                        <div style="margin-top:100px;padding-bottom:50px;">
                        <div style="width:300px;display:inline-grid;" id="div5" runat="server">
                            <div style="display:-webkit-inline-box;margin-top:20px">
                                <asp:Label CssClass="h6" style="color:black;" text="Adres :" runat="server"></asp:Label>
                                <asp:DropDownList onchange="adres2(4);return false;" CssClass="form-control h6" runat="server" ID="DropDownList2" style="padding-bottom: 5px;margin-top: -5px;margin-left:5px;"></asp:DropDownList>
                            </div>
                            <div style="display:-webkit-inline-box">
                                <textarea readonly id="TextArea3" class="form-control h6" runat="server" style="padding-bottom:100px;margin-left:60px;"></textarea>
                                <h6><asp:LinkButton OnClientClick="adres2(1);return false;" class="fa-border text-center btn-outline-primary" style="margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            Güncelle</asp:LinkButton></h6>
                                 <h6><asp:LinkButton OnClientClick="adres2(5);return false;" class="fa-border text-center btn-outline-danger" style="margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            Sil</asp:LinkButton></h6>
                            </div>
                        </div>
                        <div id="div6" runat="server" style="width: 300px;display:none">
                            <div style="width: 300px;display:-webkit-inline-box;">
                                <asp:Label CssClass="h6" style="color:black;margin-top:20px;" text="Adres :" runat="server"></asp:Label>
                                <textarea id="TextArea4" class="form-control h6" placeholder="Yeni adresinizi girin!" runat="server" style="margin-left:5px;padding-bottom:100px;"></textarea>
                                <h6><asp:LinkButton OnClientClick="adres2(3);return false;" class="fa-border text-center btn-outline-success" style="margin-top: 10px;margin-left:10px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            Onayla</asp:LinkButton></h6>
                                <h6><asp:LinkButton OnClientClick="adres2(2);return false;" class="fa-border text-center btn-outline-danger" style="margin-top: 10px;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                            İptal</asp:LinkButton></h6>
                            </div>
                            <div style="margin-left: 60px;width:300px;">
                            <asp:TextBox ID="TextBox1" placeholder="Adres adını girin!" class="form-control" style="display:none;width: 300px;" runat="server"></asp:TextBox>
                            </div>
                         </div>
                            <div class="text-center" runat="server">
                                <strong>
                                     <asp:Label ID="Label22" runat="server" Text="Adres başarıyla silindi." CssClass="alert alert-danger" style="display:none;margin-left: 60px;width:350px;"></asp:Label>
                                    <asp:Label ID="Label23" runat="server" Text="Adres boş bırakılamaz." CssClass="alert alert-danger" style="margin-left: 60px;display:none;width:350px;"></asp:Label>
                                    <asp:Label ID="Label24" runat="server" Text="Adres başarıyla değişti." CssClass="alert alert-success" style="margin-left: 60px;display:none;width:350px;"></asp:Label>
                                </strong>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
       </div>
     
   
      <!-- footer -->
      <footer class="footer layout_padding">
         <div class="container">
            <div class="row">

               <div class="col-md-8 col-sm-12">
                  <div class="footer_link_heading">
                     <h3>Adres</h3>
                  </div>
                  <div class="address_infor">
                     <p> 
                        <span class="icon"><img src="images/location_icon.png" alt="#" /></span>
                        <span class="addrs">Yenidoğan, Turhan Baytop Sokak No:1, 38280 Talas/Kayseri</span>
                     </p>
                  </div>
               </div>

               <div class="col-md-4 col-sm-12">
                  <div class="footer_link_heading">
                     <h3>Sosyal Medya</h3>
                  </div>
                  <div class="social_icon">
                    <ul>
                       <li><a href="https://tr-tr.facebook.com/EruMedya/"><img src="images/fb.png" alt="#" /></a></li>
                       <li><a href="https://twitter.com/EruMedya"><img src="images/tw.png" alt="#" /></a></li>
                       <li><a href="https://www.linkedin.com/school/erciyes-university"><img src="images/in.png" alt="#" /></a></li>
                    </ul>
                  </div>
               </div>
              
            </div>
         </div>
      </footer>
      <div class="cpy">
        <div class="container">
           <div class="row">
             <div class="col-md-12">
               <p>© 2020 Tüm hakları Sanze tarafından saklıdır.</p>
             </div>
           </div>
        </div>
      </div>
      <!-- end footer -->
      <!-- Core JavaScript
         ================================================== -->
      <script src="js/jquery.min.js"></script>
      <script src="js/tether.min.js"></script>
      <script src="js/bootstrap.js"></script>
      <script src="js/parallax.js"></script>
      <script src="js/animate.js"></script>
      <script src="js/ekko-lightbox.js"></script>
      <script src="js/custom.js"></script>

      <script type="text/javascript">
           $('.dropdown-toggle').dropdown();
            function profil(a) {

                var div1 = document.getElementById("div1");
                var div2 = document.getElementById("div2");
                var div3 = document.getElementById("div3");

                if (a == 1) {
                    div1.style.display = "block";
                    div2.style.display = "none";
                    div3.style.display = "none";
                } else if (a == 2) {
                    div1.style.display = "none";
                    div2.style.display = "contents";
                    div3.style.display = "none";

                } else if (a == 3) {
                    div1.style.display = "none";
                    div2.style.display = "none";
                    div3.style.display = "block";
                    div5.style.display = "inline-grid";
                    div5.style.display = "none";
                }
                $("#div4").load(window.location.href + " #div4");
            }
            var userID = document.getElementById('userID').innerHTML;
            function sifre(a) {

                var sifre = document.getElementById("sifre");
                var sifre2 = document.getElementById("sifre2");

                if (a == 1) {
                    sifre.style.display = "none";
                    sifre2.style.display = "block";
                } else if (a == 2) {
                    sifre.style.display = "-webkit-inline-box";
                    sifre2.style.display = "none";
                } else if (a == 3) {
                    sifre.style.display = "-webkit-inline-box";
                    sifre2.style.display = "none";

                    var password = document.getElementsByName('password')[0].value;
                    var password2 = document.getElementsByName('password2')[0].value;
                    if (password == password2 && password != "" && password2 != "") {
                        PageMethods.sifreDegistir(userID, password);

                        sifreLabel.innerHTML = password;

                        setTimeout(function sifre() { document.getElementById("Label1").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label1").style.display = "none"; }, 2000);

                        document.getElementById('password').value = '';
                        document.getElementById('password2').value = '';
                    } else if (password == "" || password2 == "") {
                        setTimeout(function sifre() { document.getElementById("Label3").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label3").style.display = "none"; }, 2000);
                        document.getElementById('password').value = '';
                        document.getElementById('password2').value = '';
                    }
                    else {
                        setTimeout(function sifre() { document.getElementById("Label2").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label2").style.display = "none"; }, 2000);
                        document.getElementById('password').value = '';
                        document.getElementById('password2').value = '';
                    }
                }
            }
            function ad(a) {

                var ad = document.getElementById("ad");
                var ad2 = document.getElementById("ad2");

                if (a == 1) {
                    ad.style.display = "none";
                    ad2.style.display = "-webkit-inline-box";
                    document.getElementsByName('adi')[0].value = document.getElementById("adLabel").innerHTML;
                } else if (a == 2) {
                    ad.style.display = "-webkit-inline-box";
                    ad2.style.display = "none";
                } else if (a == 3) {
                    ad.style.display = "-webkit-inline-box";
                    ad2.style.display = "none";

                    var adi = document.getElementsByName('adi')[0].value;
                    var soyadi = soyadLabel.innerHTML;

                    if (adi != "") {
                        PageMethods.adDegistir(userID, adi);
                        adLabel.innerHTML = adi;
                        adisoyadi.innerHTML = adi;
                        labelUsername.innerHTML = adi + ' ' + soyadi;

                        setTimeout(function sifre() { document.getElementById("Label5").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label5").style.display = "none"; }, 2000);
                    } else {
                        setTimeout(function sifre() { document.getElementById("Label4").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label4").style.display = "none"; }, 2000);
                    }
                    document.getElementById('ad').value = '';
                }
            }
            function soyad(a) {

                var soyad = document.getElementById("soyad");
                var soyad2 = document.getElementById("soyad2");

                if (a == 1) {
                    soyad.style.display = "none";
                    soyad2.style.display = "-webkit-inline-box";
                    document.getElementsByName('soyadi')[0].value = document.getElementById("soyadLabel").innerHTML;
                } else if (a == 2) {
                    soyad.style.display = "-webkit-inline-box";
                    soyad2.style.display = "none";
                } else if (a == 3) {
                    soyad.style.display = "-webkit-inline-box";
                    soyad2.style.display = "none";

                    var soyadi = document.getElementsByName('soyadi')[0].value;
                    var adi = adLabel.innerHTML;

                    if (soyadi != "") {
                        PageMethods.soyadDegistir(userID, soyadi);
                        soyadLabel.innerHTML = soyadi;
                        labelUsername.innerHTML = adi + ' ' + soyadi;

                        setTimeout(function sifre() { document.getElementById("Label7").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label7").style.display = "none"; }, 2000);
                    } else {
                        setTimeout(function sifre() { document.getElementById("Label6").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label6").style.display = "none"; }, 2000);
                    }
                    document.getElementById('soyadi').value = '';
                }
            }
            function tel(a) {

                var tel = document.getElementById("tel");
                var tel2 = document.getElementById("tel2");

                if (a == 1) {
                    tel.style.display = "none";
                    tel2.style.display = "-webkit-inline-box";
                    document.getElementsByName('telefon')[0].value = document.getElementById("telefonLabel").innerHTML;
                } else if (a == 2) {
                    tel.style.display = "-webkit-inline-box";
                    tel2.style.display = "none";
                } else if (a == 3) {
                    tel.style.display = "-webkit-inline-box";
                    tel2.style.display = "none";

                    var telefon = document.getElementsByName('telefon')[0].value;

                    if (telefon != "") {
                        PageMethods.telefonDegistir(userID, telefon);
                        telefonLabel.innerHTML = telefon;

                        setTimeout(function sifre() { document.getElementById("Label9").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label9").style.display = "none"; }, 2000);
                    } else {
                        setTimeout(function sifre() { document.getElementById("Label8").style.display = "block"; }, 100);
                        setTimeout(function sifre() { document.getElementById("Label8").style.display = "none"; }, 2000);
                    }
                    document.getElementById('telefon').value = '';
                }
            }
            function adres(a) {
                var adres = document.getElementById("adres");
                var adres2 = document.getElementById("adres2");
                var adresTxt = document.getElementById("adresTxt");

                var adresArea = document.getElementById('<%=DropDownList1.ClientID%>');
                var adresID = adresArea.options[adresArea.selectedIndex].value;


                if (a == 1) {
                    adres.style.display = "none";
                    adres2.style.display = "inline-grid";
                    adresTxt.style.display = "block";
                    document.getElementById("adresTxt").value = adresArea.options[adresArea.selectedIndex].innerHTML;
                    document.getElementById("TextArea2").value = document.getElementById("TextArea1").value;
                } else if (a == 2) {
                    adres.style.display = "inline-grid";
                    adres2.style.display = "none";
                    adresArea.selectedIndex = 0;
                    adresID = adresArea.options[0].value;
                    if (adresID != -1) {
                        PageMethods.adresFullCek(userID, adresID, onSucceed);
                        function onSucceed(result) {
                            document.getElementById("TextArea1").value = result;
                        }
                        adresTxt.style.display = "none";
                    } else {
                        adres.style.display = "none";
                        adres2.style.display = "inline-grid";
                        adresTxt.style.display = "block";
                        document.getElementById("adresTxt").value = null;
                        document.getElementById("TextArea2").value = null;
                    }
                } else if (a == 3) {
                    if (document.getElementById("TextArea2").value != "" && document.getElementById("adresTxt").value != "") {
                        
                        if (adresID != -1) {
                            adres.style.display = "inline-grid";
                            adres2.style.display = "none";

                            PageMethods.adresDegistir(document.getElementById("TextArea2").value, adresArea.options[adresArea.selectedIndex].value, document.getElementById("adresTxt").value);
      
                            $("#adres").load(window.location.href + " #adres");
                            $("#div3").load(window.location.href + " #div3");
                            document.getElementById("TextArea2").value = null;
                            document.getElementById("adresTxt").value = null;

                            setTimeout(function sifre2() { document.getElementById("Label11").style.display = "block"; }, 100);
                            setTimeout(function sifre2() { document.getElementById("Label11").style.display = "none"; }, 2000);
                        }
                        else {
                            adres.style.display = "inline-grid";
                            adres2.style.display = "none";

                            PageMethods.adresEkle(userID, document.getElementById("TextArea2").value, document.getElementById("adresTxt").value);
                            $("#div5").load(window.location.href + " #div5");
                            $("#adres").load(window.location.href + " #adres");
                            $("#div3").load(window.location.href + " #div3");
                            document.getElementById("TextArea2").value = null;
                            document.getElementById("adresTxt").value = null;

                            setTimeout(function sifre2() { document.getElementById("Label11").style.display = "block"; }, 100);
                            setTimeout(function sifre2() { document.getElementById("Label11").style.display = "none"; }, 2000);
                        }
                    }
                    else
                    {
                        setTimeout(function sifre4() { document.getElementById("Label10").style.display = "block"; }, 100);
                        setTimeout(function sifre4() { document.getElementById("Label10").style.display = "none"; }, 2000);
                    }
                }
                else if (a == 4) {
                    if (adresID == -1) {
                        document.getElementById("TextArea1").value = null;
                        document.getElementById("TextArea2").value = null;
                        adresTxt.value = null;

                        adres.style.display = "none";
                        adres2.style.display = "inline-grid";
                        adresTxt.style.display = "block";

                    } else {
                        adresTxt.style.display = "none";
                        adres.style.display = "inline-grid";
                        adres2.style.display = "none";

                        PageMethods.adresFullCek(userID, adresID, onSucceed);
                        function onSucceed(result) {
                            document.getElementById("TextArea1").value = result;
                        }
                        document.getElementById("TextArea2").value = document.getElementById("TextArea1").value;
                        document.getElementById("adresTxt").value = adresArea.options[adresArea.selectedIndex].innerHTML;
                    }
                } else if (a == 5) {
                    PageMethods.adresSil(adresID);
                    $("#div5").load(window.location.href + " #div5");
                    $("#adres").load(window.location.href + " #adres");
                    $("#div3").load(window.location.href + " #div3");
                    $("#div1").load(window.location.href + " #div1");
                    setTimeout(function sifre3() { document.getElementById("LabelSil").style.display = "block"; }, 100);
                    setTimeout(function sifre3() { document.getElementById("LabelSil").style.display = "none"; }, 2000);
                    document.getElementById('TextArea2').value = null;
                    adresTxt.value = null;
                }
          }
          function adres2(a) {
              var div5 = document.getElementById("div5");
              var div6 = document.getElementById("div6");
              var TextBox1 = document.getElementById("TextBox1");

              var adresArea = document.getElementById('<%=DropDownList2.ClientID%>');
              var adresID = adresArea.options[adresArea.selectedIndex].value;


             if (a == 1) {
                 div5.style.display = "none";
                 div6.style.display = "inline-grid";
                 TextBox1.style.display = "block";
                 document.getElementById("TextBox1").value = adresArea.options[adresArea.selectedIndex].innerHTML;
                 document.getElementById("TextArea4").value = document.getElementById("TextArea3").value;
             } else if (a == 2) {
                 div5.style.display = "inline-grid";
                 div6.style.display = "none";
                 adresArea.selectedIndex = 0;
                 adresID = adresArea.options[0].value;
                 if (adresID != -1) {
                     PageMethods.adresFullCek(userID, adresID, onSucceed);
                     function onSucceed(result) {
                         document.getElementById("TextArea3").value = result;
                     }
                     TextBox1.style.display = "none";
                 } else {
                     div5.style.display = "none";
                     div6.style.display = "inline-grid";
                     TextBox1.style.display = "block";
                     document.getElementById("TextBox1").value = null;
                     document.getElementById("TextArea4").value = null;
                 }
             } else if (a == 3) {
                 if (document.getElementById("TextArea4").value != "" && document.getElementById("TextBox1").value != "") {

                     if (adresID != -1) {
                         div5.style.display = "inline-grid";
                         div6.style.display = "none";

                         PageMethods.adresDegistir(document.getElementById("TextArea4").value, adresArea.options[adresArea.selectedIndex].value, document.getElementById("TextBox1").value);

                         $("#div1").load(window.location.href + " #div1");
                         $("#div5").load(window.location.href + " #div5");
                         document.getElementById("TextArea4").value = null;
                         document.getElementById("TextBox1").value = null;

                         setTimeout(function sifre2() { document.getElementById("Label24").style.display = "block"; }, 100);
                         setTimeout(function sifre2() { document.getElementById("Label24").style.display = "none"; }, 2000);
                     }
                     else {
                         div5.style.display = "inline-grid";
                         div6.style.display = "none";

                         PageMethods.adresEkle(userID, document.getElementById("TextArea4").value, document.getElementById("TextBox1").value);

                         $("#div1").load(window.location.href + " #div1");
                         $("#div5").load(window.location.href + " #div5");
                         document.getElementById("TextArea4").value = null;
                         document.getElementById("TextBox1").value = null;

                         setTimeout(function sifre2() { document.getElementById("Label24").style.display = "block"; }, 100);
                         setTimeout(function sifre2() { document.getElementById("Label24").style.display = "none"; }, 2000);
                     }
                 }
                 else {
                     setTimeout(function sifre4() { document.getElementById("Label23").style.display = "block"; }, 100);
                     setTimeout(function sifre4() { document.getElementById("Label23").style.display = "none"; }, 2000);
                 }
             }
             else if (a == 4) {
                 if (adresID == -1) {
                     document.getElementById("TextArea3").value = null;
                     document.getElementById("TextArea4").value = null;
                     document.getElementById("TextBox1").value = null;

                     div5.style.display = "none";
                     div6.style.display = "inline-grid";
                     TextBox1.style.display = "block";

                 } else {
                     TextBox1.style.display = "none";
                     div5.style.display = "inline-grid";
                     div6.style.display = "none";

                     PageMethods.adresFullCek(userID, adresID, onSucceed);
                     function onSucceed(result) {
                         document.getElementById("TextArea3").value = result;
                     }
                     document.getElementById("TextArea4").value = document.getElementById("TextArea3").value;
                     document.getElementById("TextBox1").value = adresArea.options[adresArea.selectedIndex].innerHTML;
                 }
             } else if (a == 5) {
                 PageMethods.adresSil(adresID);

                 $("#DropDownList2").load(window.location.href + " #DropDownList2");
                 $("#div5").load(window.location.href + " #div5");
                 $("#div1").load(window.location.href + " #div1");

                 setTimeout(function sifre3() { document.getElementById("Label22").style.display = "block"; }, 100);
                 setTimeout(function sifre3() { document.getElementById("Label22").style.display = "none"; }, 2000);
                 document.getElementById("TextArea4").value = null;
                 TextBox1.value = null;
             }
         }
          function sifreGoster(a) {
              if (a == 1) {
                  document.getElementById("sifreLabel").style.display = "block";
                  document.getElementById("sifreSakla").style.display = "inline-block";
                  document.getElementById("sifreGoster").style.display = "none";
              } else {
                  document.getElementById("sifreLabel").style.display = "none";
                  document.getElementById("sifreSakla").style.display = "none";
                  document.getElementById("sifreGoster").style.display = "inline-block";
              }
          }
          
      </script>
       </form>
   </body>
</html>
