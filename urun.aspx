<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urun.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.urun" %>

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
                   <div class="pull-right">
                      <a style="float:right;font-weight: bold;font-size:15px;text-decoration:underline !important;" id="linkAyarla" runat="server">Giriş Yap</a>
                      <asp:Label CssClass="h6" style="color:white;" runat="server" id="adisoyadi"></asp:Label>
                      <a onserverclick="logout_ServerClick" class="btn-outline-danger fa-border" style="border-width:0px;border-radius:10px;font-weight: bold;font-size:15px;text-decoration:underline !important;" id="session" runat="server">çıkış yap.</a>
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


           <div class="container">
               <div class="row">
                  <div class="col-xl-12 fa-border" style="border-color:rgba(0, 0, 0, 0.4);max-height:250px !important;border-top-width: 0px;border-radius:5px;">
                      <img class="img-responsive" style="max-height:100%;" src="images/banner.png" alt="#" />
                   </div>
               </div>
               <!-- Ürün Varsa Buraya -->
               <div class="row" id="div1" runat="server" visible="false">

                 <form id="form2" method="post" role="form" runat="server">

                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager >

                     <asp:Label runat="server" style="display:none;" ID="userID"></asp:Label>

                    <asp:Repeater runat="server" ID="Repeater1">
                        <ItemTemplate>
                   <div class="col-md-12" style="margin-top:50px;margin-bottom:50px;"> 
                      <div class="row">

                          <div class="col-md-7 product_blog form-control">
                              <img src="<%# Eval("resim") %>" alt="#" />
                          </div>

                          <div class="col-md-4" style="margin-left:30px;word-wrap:break-word;">
                              <h1 style="font-size:40px;"><%# Eval("urun") %> <%# Eval("kategori") %></h1>
                              <h6 style="font-size:12px;color:indianred;margin-top: -30px;font-weight:500;"><%# Eval("kategoriTuru") %> Parça</h6>
                              <h3><span style="color: indianred !important;"><%# Eval("fiyat") %></span> TL</h3>
                              <br />
                              <br />
                              <h6 style="font-weight:500;">Ürün Bilgisi</h6>
                              <p style="color:rgba(0, 0, 0, 0.6) !important;white-space:pre-wrap;"><%# Eval("aciklama") %></p>


                              <h6>Adet : <input type="text" class="h6" id="TextBoxAdet" value="1" style="width: 35px;padding: 5px 10px;" readonly/>
                              <asp:Button runat="server" class="btn-outline-danger h6" OnClientClick="decrease();return false;" Text="-" style="outline:none;width:25px;border-radius:7px;"/>
                              <asp:Button runat="server" class="btn-outline-success h6" OnClientClick="increase();return false;" Text="+" style="outline:none;width: 25px;border-radius:7px;" />
                              </h6>      
                              <br />
                              <label ID="Label1" Class="alert alert-success h5 fa-border" style="border-radius:10px;padding:10px 10px;display:none;border-color:rgba(0,0,0,0.5);">Ürün sepete eklendi.</label>
                              <br />
                              <asp:Button  id="Button1" Text="Sepete Ekle" OnClientClick='<%# "test("+ Eval("urunID") + ");return false;" %>' runat="server" class="btn-outline-warning h4" style="outline:none;border-width:1px !important;border-radius:15px !important;padding:10px 10px;"/>
                              

                              <br />
                              <br />
                              <h6 style="font-weight:300;font-size:13px;color:rgba(0, 0, 0, 0.6) !important;">Ürün No : <%# Eval("urunID") %></h6>

                         </div>
                         </div>
                       </div>
                     </ItemTemplate>
                   </asp:Repeater>
                  <asp:Label runat="server" Style="display:none" ID="anonymousLabel"></asp:Label>
                 </form>
               </div>
               <!-- Ürün Yoksa Hata -->
               <div class="row" id="div2" runat="server" visible="false">
                  <div class="col-md-12" style="margin-top:50px;margin-bottom:50px;">
                      <h1 style="font-size:48px;">HATA</h1>
                      <h3>Böyle bir sayfa mevcut değil.</h3>
                  </div>
               </div>

               <!-- Ürün Kodu Hata -->
               <div class="row" id="div3" runat="server" visible="false">
                  <div class="col-md-12" style="margin-top:50px;margin-bottom:50px;">
                      <h1 style="font-size:48px;">HATA</h1>
                      <h3>Ürün kodu yanlış girildi.</h3>
                  </div>
               </div>

               <!-- Böyle bir ürün yok Hata -->
               <div class="row" id="div4" runat="server" visible="false">
                  <div class="col-md-12" style="margin-top:50px;margin-bottom:50px;">
                      <h1 style="font-size:48px;">HATA</h1>
                      <h3>Böyle bir ürün mevcut değil.</h3>
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
       <script type="text/javascript">
            function test(urunID) {
                var value = parseInt(document.getElementById('TextBoxAdet').value, 10);
                var userID = document.getElementById('userID').innerHTML;
                var anonymousID = document.getElementById('anonymousLabel').innerHTML;
                PageMethods.Test(userID, value, anonymousID, urunID, test_Success);
            }
           function test_Success(response) {
               if (response > 0) {
                   document.getElementById("sepetLabelSergile").style.display = "block";
               } else {
                   document.getElementById("sepetLabelSergile").style.display = "none";
               }
               document.getElementById("sepetLabel").innerHTML = response;
               document.getElementById("Label1").style.display = "block";
               setTimeout(function () { document.getElementById("Label1").style.display = "none"; }, 4000);
            }
            function decrease() {
                var value = parseInt(document.getElementById('TextBoxAdet').value, 10);
                value = isNaN(value) ? 0 : value;
                if (value > 1) {
                    value--;
                }
                document.getElementById('TextBoxAdet').value = value;
            }
            function increase() {
                var value = parseInt(document.getElementById('TextBoxAdet').value, 10);
                value = isNaN(value) ? 0 : value;
                if (value < 9) {
                    value++;
                }
                document.getElementById('TextBoxAdet').value = value;
            }
       </script>
   </body>
</html>
