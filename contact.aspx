<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.contact" %>

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
      <!-- header -->
      <header class="header">
        <asp:Label runat="server" style="display:none;" ID="userID"></asp:Label>
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
                   <div class="pull-right">
                      <a style="font-weight: bold;font-size:15px;text-decoration:underline !important;" href="login.aspx?default.aspx" id="linkAyarla" runat="server">Giriş Yap</a>  
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
                                 <li class="nav-item" style="display:none;" runat="server" id="userSiparis" >
                                    <a class="nav-link color-grey-hover" href="profile.aspx?siparisler">Siparişlerim</a>
                                 </li>
                                  <li class="nav-item" style="display:none;" runat="server" id="guestSiparis">
                                    <a class="nav-link color-grey-hover" href="guestSiparis.aspx">Siparişlerim</a>
                                 </li>
                                 <li class="nav-item active">
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

         <div style="background-color:#ebebeb;">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12 fa-border" style="border-color:rgba(0, 0, 0, 0.4);max-height:250px !important;border-top-width: 0px;border-radius:5px;">
                      <img class="img-responsive" style="max-height:100%;" src="images/banner.png" alt="#" />
                    </div>
                </div>
                <div class="row justify-content-between" style="margin:50px 0px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.6);background-color:#fff;">
                    <div class="col-md-4" style="margin:50px 0px;">
                        <h3>İletişim Formu</h3>
                        <br />

                         <div style="display:flow-root;" class="h6">Ad-Soyad : <asp:TextBox ID="adsoyad" class="form-control h6" runat="server" style="max-width:240px;margin-left:5px;float:right;"></asp:TextBox></div>
                        <div style="display:flow-root;" class="h6">Telefon : <asp:TextBox ID="telefon" class="form-control h6" runat="server" style="max-width:240px;margin-left:5px;float:right;"></asp:TextBox></div>
                        <div style="display:flow-root;" class="h6">Adres : <textarea id="adres" class="form-control h6" runat="server" style="max-width:240px;margin-left:5px;padding-bottom:100px;float:right;"></textarea></div>
                        <div style="display:flow-root;" class="h6">Mesaj : <textarea id="mesaj" class="form-control h6" runat="server" style="max-width:240px;margin-left:5px;padding-bottom:100px;float:right;"></textarea></div>
                      
                        <h6><asp:LinkButton OnClientClick="iletisimFormu();return false;" class="fa-border text-center btn-success" style="margin-top: 10px;margin-left:15px;width:240px;float: right;border-radius: 20px;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Yolla</asp:LinkButton></h6>
                        <br />
                        <br />
                        <br />
                        <div class="text-center" runat="server">
                            <strong>
                                <asp:Label ID="Label1" runat="server" Text="Ad-Soyad boş bırakılamaz." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text="Telefon boş bırakılamaz." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="Adres boş bırakılamaz." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text="Mesaj boş bırakılamaz." CssClass="alert alert-danger" style="display:none;"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="Başarıyla iletildi." CssClass="alert alert-success" style="display:none;"></asp:Label>
                            </strong>
                        </div>
                    </div>
                    <div class="col-md-8" style="margin:50px 0px;border-radius:50px;display:block;margin-left:auto;margin-right:auto;">
                         <iframe class="fa-border" style="border-color:rgba(0,0,0,0.5);border-radius: 30px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12453.303520950165!2d35.5336511!3d38.7103265!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc6e55fc623330b00!2zRXJjaXllcyDDnG5pdmVyc2l0ZXNp4oCL!5e0!3m2!1str!2str!4v1605399419903!5m2!1str!2str" width="700" height="600" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
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
      <script src="js/bootstrap.min.js"></script>
      <script src="js/parallax.js"></script>
      <script src="js/animate.js"></script>
      <script src="js/ekko-lightbox.js"></script>
      <script src="js/custom.js"></script>
         <script>
             function iletisimFormu() {
                 var adsoyad=document.getElementById("adsoyad").value;
                 var telefon=document.getElementById("telefon").value;
                 var adres=document.getElementById("adres").value;
                 var mesaj = document.getElementById("mesaj").value;
                 if (adsoyad == "") {
                     setTimeout(function sifre() { document.getElementById("Label1").style.display = "block"; }, 100);
                     setTimeout(function sifre() { document.getElementById("Label1").style.display = "none"; }, 3000);
                 } else {
                     if (telefon == "") {
                         setTimeout(function sifre() { document.getElementById("Label2").style.display = "block"; }, 100);
                         setTimeout(function sifre() { document.getElementById("Label2").style.display = "none"; }, 3000);
                     } else {
                         if (adres == "") {
                             setTimeout(function sifre() { document.getElementById("Label3").style.display = "block"; }, 100);
                             setTimeout(function sifre() { document.getElementById("Label3").style.display = "none"; }, 3000);
                         } else {
                             if (mesaj == "") {
                                 setTimeout(function sifre() { document.getElementById("Label4").style.display = "block"; }, 100);
                                 setTimeout(function sifre() { document.getElementById("Label4").style.display = "none"; }, 3000);
                             } else {
                                 setTimeout(function sifre() { document.getElementById("Label5").style.display = "block"; }, 100);
                                 setTimeout(function sifre() { document.getElementById("Label5").style.display = "none"; }, 5000);
                                 PageMethods.iletisim(adsoyad, telefon, adres, mesaj);
                                 setTimeout(function sifre() { window.location.href = "default.aspx"; }, 6000);
                             }
                         }
                     }
                 }
             }
         </script>
       </form>
   </body>
</html>
