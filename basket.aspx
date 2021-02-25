<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basket.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.basket" %>

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
       <asp:Label runat="server" ID="userID" style="display:none"></asp:Label>
       <asp:Label runat="server" Style="display:none" ID="anonymousLabel"></asp:Label>
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
     <div style="background-color: #ebebeb;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12" id="sepetBos" runat="server" style="box-shadow: 0 2px 4px 0 rgba(0,0,0,.4);background-color:#fff;">
                    <div class="text-center">
                       <h4 class="alert alert-warning fa-border" style="border-radius:40px;border-color:rgba(0,0,0,0.5);margin:50px 0px;">Sepetiniz henüz boş. Alışverişinize <a href="default.aspx"><span>buraya</span></a> tıklayarak devam edebilirsiniz.</h4>
                    </div>
                </div>
                <div class="col-md-12" id="sepetDolu" runat="server">
                    <div class="col-md-8 sepetDolu">
                        <h1 style="margin: 20px 0px;">Sepetim </h1>
                          <asp:Repeater runat="server" ID="Repeater1">
                            <ItemTemplate>
                             <div style="margin-bottom: 20px;">
                                <table border="1" id="tableSiparis" style="border-collapse:unset;border-color:rgba(0,0,0,0.6);width:100%">
                                    <tbody>
                                         <td style="width:150px;">  
                                             <div class="text-center h6">
                                                <asp:Label runat="server" id="Text1" style="color:black;margin:0px 5px;"><%# Eval("urun")+" "+ Eval("kategori") %></asp:Label>
                                            </div>
                                         </td>
                                         <td style="width:250px;">  
                                            <div class="text-center h6">
                                                <img style="width: auto;max-width:100%;max-height:200px;"  src="<%# Eval("resim") %>" alt="#" />
                                            </div>
                                         </td>
                                         <td style="width:85px;">  
                                            <div class="text-center h5" style="display:-webkit-inline-box;">
                                                 <h6><button class="btn-danger h5" OnClick='<%# "decrease(\"" + Eval("urunID") + "\"); return false;" %>' style="outline:none;height: 30px;width:25px;border-width:unset;">-</button>
                                                 <input type="text" class="h5" id='<%# Eval("urunID") %>' value="<%# Eval("adet") %>" style="width: 35px;padding: 5px 10px;" readonly/>
                                                 <button class="btn-success h5"  onclick='<%# "increase(\"" + Eval("urunID") + "\"); return false;" %>' style="outline:none;height: 30px;width: 25px;border-width:unset;">+</button>
                                            </div>
                                            <div class="text-center h6">
                                                <button runat="server" class="btn-outline-danger" onclick='<%# "deleteItem(\"" + Eval("sepetID") + "\",\"" + Eval("urunID") + "\"); return false;" %>' style="margin-top: -10px;border-color: rgba(255,0,0,0.5);padding: 3px 5px;border-radius: 15px; font-weight: 400;"><img src="images/trash.png" style="width:20px;height:auto;"/> Kaldır</button>
                                            </div>
                                         </td>
                                         <td style="width:85px;">  
                                            <div class="text-center h6">
                                                <label id='<%# string.Format("Label{0}", Eval("urunID")) %>' style="color:black;margin:0px 5px;"><%# Eval("urunFiyat") %></label> TL
                                            </div>
                                         </td>
                                    </tbody>
                                </table>
                              </div>
                           </ItemTemplate>
                        </asp:Repeater>
                      <button id="Button1" OnClick="deleteItems();return false;" class="btn-outline-danger h5" style="border-width:1px !important;border-radius:15px !important;padding:10px 10px;">Sepeti Boşalt</button>
                    </div>
                <div class="col-md-4" style="background-color:white;max-width: 333px;float:right;margin-top:50px;margin-bottom:20px;padding-bottom:10px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.4);">
                    <h3 style="margin-top:20px;">Adreslerim</h3>
                    <div id="div5" runat="server" style="width: 300px;display:none;">
                        <div style="width: 300px;">
                            <asp:Label CssClass="h6" style="color:black;margin-top:20px;" text="Adres :" runat="server"></asp:Label>
                            <textarea id="TextArea4" class="form-control h6" placeholder="Yeni adresinizi girin!" runat="server" style="max-width:240px;float:right;margin-left:5px;padding-bottom:100px;"></textarea>
                        </div>
                    </div>
                    <div style="width:300px;display:none;" id="div6" runat="server">
                        <div style="display:-webkit-inline-box;margin-top:20px">
                            <asp:Label CssClass="h6" style="color:black;" text="Adres :" runat="server"></asp:Label>
                            <asp:DropDownList onchange="adres();return false;" CssClass="form-control h6" runat="server" ID="DropDownList2" style="max-width:250px;padding-bottom: 5px;margin-top: -5px;margin-left:5px;"></asp:DropDownList>
                        </div>
                            <textarea readonly id="TextArea3" class="form-control h6" runat="server" style="max-width:250px;padding-bottom:100px;margin-left:60px;"></textarea>
                                <h6><asp:LinkButton href="profile.aspx?adresler" class="fa-border text-center btn-outline-success" style="max-width:250px;float:right;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Yeni Adres Ekle</asp:LinkButton></h6>
                    </div>
                </div>
                 <div class="col-md-4" style="background-color:white;max-width: 333px;float:right;margin-bottom:50px;padding-bottom:10px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.4);">
                        <h3 style="margin-top:20px;">Sipariş Özeti</h3>
                        <br />
                        <br />
                        <h5 style="font-weight: 300">Sepetinizde <asp:Label runat="server" ID="urunAdet" class="h6" style="font-weight: 500;"></asp:Label> adet ürün mevcut.</h5>
                        <br />
                        <h5 style="font-weight: 400">Fiyat (KDV'siz) :  <asp:Label runat="server" ID="urunFiyatKDVsiz" class="h6" style="font-weight: 600;"></asp:Label> TL</h5>
                        <h5 style="font-weight: 400">KDV :  <asp:Label runat="server" ID="urunKDV" class="h6" style="font-weight: 600;"></asp:Label> TL</h5>
                        <h5 style="font-weight: 400">Toplam : <asp:Label runat="server" ID="urunFiyatToplam" class="h6" style="font-weight: 600;"></asp:Label> TL</h5>
                        <br />
                        <label class="p" style="color:black;"><input id="CheckBox1" class="checkmark" type="checkbox" name="colorCheckbox" runat="server" value="check"><asp:Label style="padding-left:30px;" class="p" runat="server" Text="Sözleşmeyi "></asp:Label><asp:LinkButton style="text-decoration:underline !important;" CssClass="h6" ID="sozlesme" OnClientClick="showSozlesme();return false;" Text="okudum" runat="server"></asp:LinkButton> , kabul ediyorum.</label>
                        <br />
                        <br />
                        <h4><asp:LinkButton ID="satinAlButton" class="fa-border text-center btn-outline-success" OnClientClick="satinAl();return false;" style="outline:none;padding:5px 10px;width: 100%;border-radius: 20px;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
                        Satın Al</asp:LinkButton></h4>
                        <div class="text-center" runat="server">
                           <strong>
                               <asp:Label ID="Label1" runat="server" Text="Adres boş geçilemez." CssClass="alert alert-danger h6" style="display:none;"></asp:Label>
                               <asp:Label ID="Label2" runat="server" Text="Lütfen sözleşmeyi okuduktan sonra onaylayınız." CssClass="alert alert-danger h6" style="display:none;"></asp:Label>
                           </strong>
                       </div>
                 </div>
               </div>
               <div class="col-md-12" id="sepetSiparis" style="display:none;margin:100px 0px;padding:50px 50px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.4);background-color:#fff;" runat="server">
                   <h2>Sipariş Bilgilerim</h2>
                   <br />
                   <div style="display:-webkit-inline-box;">
                        <h4>Satın alma işlemi başarıyla sonuçlandı. Sipariş numaranızla</h4><asp:LinkButton OnClientClick="window.location.href='guestSiparis.aspx';return false;" runat="server" Text=" buradan " class="h4 fa-border text-center btn-outline-primary" style="border-radius: 20px;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);padding: 0px 10px;margin: 0px 5px;"></asp:LinkButton><h4>sorgulama yapabilirsiniz.</h4>
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" CssClass="h3 alert alert-primary"></asp:Label>
                </div>
                <div class="col-md-12" id="sepetSiparis2" style="display:none;margin:100px 0px;padding:50px 50px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.4);background-color:#fff;" runat="server">
                    <h2>Sipariş Bilgilerim</h2>
                    <br />
                    <div style="display:-webkit-inline-box;">
                        <h4>Satın alma işlemi başarıyla sonuçlandı. Siparişinizi</h4><asp:LinkButton OnClientClick="window.location.href='profile.aspx?siparisler';return false;" runat="server" Text=" buradan " class="h4 fa-border text-center btn-outline-primary" style="border-radius: 20px;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);padding: 0px 10px;margin: 0px 5px;"></asp:LinkButton><h4>görebilirsiniz.</h4>
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" CssClass="h3 alert alert-primary"></asp:Label>            
                </div>
            </div>
         </div>
       </div>
        <!-- The Modal -->

        <div id="myModal" class="modal2">
            
            <!-- Modal content -->
            <div class="modal-content2 fa-border" style="border-radius: 50px;">
                <div id="kapat" class="close">&times;</div>
                <h2>MESAFELİ SATIŞ SÖZLEŞMESİ</h2>
<h4>1.TARAFLAR</h4>
<p>İşbu Sözleşme aşağıdaki taraflar arasında aşağıda belirtilen hüküm ve şartlar çerçevesinde imzalanmıştır. </p>
<h5>A.‘ALICI’ ; (sözleşmede bundan sonra "ALICI" olarak anılacaktır)</h5>

<h5>B.‘SATICI’ ; (sözleşmede bundan sonra "SATICI" olarak anılacaktır)</h5>
<p>AD- SOYAD:</p>
<p>ADRES: </p>
<p>İş bu sözleşmeyi kabul etmekle ALICI, sözleşme konusu siparişi onayladığı takdirde sipariş konusu bedeli ve varsa kargo ücreti, vergi gibi belirtilen ek ücretleri ödeme yükümlülüğü altına gireceğini ve bu konuda bilgilendirildiğini peşinen kabul eder.</p>
<h4>2.TANIMLAR</h4>
<p>İşbu sözleşmenin uygulanmasında ve yorumlanmasında aşağıda yazılı terimler karşılarındaki yazılı açıklamaları ifade edeceklerdir.</p>
<p>BAKAN: Gümrük ve Ticaret Bakanı’nı,</p>
<p>BAKANLIK: Gümrük ve Ticaret  Bakanlığı’nı,</p>
<p>KANUN: 6502 sayılı Tüketicinin Korunması Hakkında Kanun’u,</p>
<p>YÖNETMELİK: Mesafeli Sözleşmeler Yönetmeliği’ni (RG:27.11.2014/29188)</p>
<p>HİZMET: Bir ücret veya menfaat karşılığında yapılan ya da yapılması taahhüt edilen mal sağlama dışındaki her türlü tüketici işleminin konusunu ,</p>
<p>SATICI: Ticari veya mesleki faaliyetleri kapsamında tüketiciye mal sunan veya mal sunan adına veya hesabına hareket eden şirketi,</p>
<p>ALICI: Bir mal veya hizmeti ticari veya mesleki olmayan amaçlarla edinen, kullanan veya yararlanan gerçek ya da tüzel kişiyi,</p>
<p>SİTE: SATICI’ya ait internet sitesini,</p>
<p>SİPARİŞ VEREN: Bir mal veya hizmeti SATICI’ya ait internet sitesi üzerinden talep eden gerçek ya da tüzel kişiyi,</p>
<p>TARAFLAR: SATICI ve ALICI’yı,</p>
<p>SÖZLEŞME: SATICI ve ALICI arasında akdedilen işbu sözleşmeyi,</p>
<p>MAL: Alışverişe konu olan taşınır eşyayı ve elektronik ortamda kullanılmak üzere hazırlanan yazılım, ses, görüntü ve benzeri gayri maddi malları ifade eder.</p>
<h4>3.KONU</h4>
<p>İşbu Sözleşme, ALICI’nın, SATICI’ya ait internet sitesi üzerinden elektronik ortamda siparişini verdiği aşağıda nitelikleri ve satış fiyatı belirtilen ürünün satışı ve teslimi ile ilgili olarak 6502 sayılı Tüketicinin Korunması Hakkında Kanun ve Mesafeli Sözleşmelere Dair Yönetmelik hükümleri gereğince tarafların hak ve yükümlülüklerini düzenler.
Listelenen ve sitede ilan edilen fiyatlar satış fiyatıdır. İlan edilen fiyatlar ve vaatler güncelleme yapılana ve değiştirilene kadar geçerlidir. Süreli olarak ilan edilen fiyatlar ise belirtilen süre sonuna kadar geçerlidir.</p>
            </div>

        </div>
      <!-- main content -->

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
               function showSozlesme() {
                   document.getElementById("myModal").style.display = "block";
               }

               var span = document.getElementsByClassName("close")[0];

               span.onclick = function () {
                   document.getElementById("myModal").style.display = "none";
               }

               function increase(urunID) {
                   var adet = document.getElementById(urunID).value;
                   var price = document.getElementById("Label" + urunID).innerHTML;
                   var priceAdet = price / adet;
                   if (adet < 9) {
                       adet++;
                       // Sepet Genel Durum
                       var txtToplam = parseFloat(document.getElementById("urunFiyatToplam").innerHTML);
                       txtToplam = txtToplam + priceAdet;
                       document.getElementById("urunFiyatToplam").innerHTML = txtToplam;

                       var txtToplam2 = parseFloat(document.getElementById("urunFiyatKDVsiz").innerHTML);
                       txtToplam2 = txtToplam2 + (priceAdet - priceAdet * 18 / 100);
                       document.getElementById("urunFiyatKDVsiz").innerHTML = txtToplam2;

                       var txtToplam3 = parseFloat(document.getElementById("urunKDV").innerHTML);
                       txtToplam3 = txtToplam3 + priceAdet * 18 / 100;
                       document.getElementById("urunKDV").innerHTML = txtToplam3;

                       document.getElementById("urunAdet").innerHTML = adet;
                       ////////////////////
                   }
                   document.getElementById(urunID).value = adet;

                   document.getElementById("Label" + urunID).innerHTML = priceAdet * adet;


                   var userID = document.getElementById('userID').innerHTML;
                   var anonymousID = document.getElementById('anonymousLabel').innerHTML;

                   PageMethods.itemIncDec(userID, adet, anonymousID, urunID, test_Success);
                   function test_Success(response) {
                       if (response > 0) {
                           document.getElementById("sepetLabelSergile").style.display = "block";
                       } else {
                           document.getElementById("sepetLabelSergile").style.display = "none";
                       }
                       document.getElementById("sepetLabel").innerHTML = response;
                       document.getElementById("urunAdet").innerHTML = response;
                   }
               }


               function decrease(urunID) {
                   var adet = document.getElementById(urunID).value;
                   var price = document.getElementById("Label" + urunID).innerHTML;
                   var priceAdet = price / adet;
                   if (adet > 1) {
                       adet--;
                       // Sepet Genel Durum
                       var txtToplam = parseFloat(document.getElementById("urunFiyatToplam").innerHTML);
                       txtToplam = txtToplam - priceAdet;
                       document.getElementById("urunFiyatToplam").innerHTML = txtToplam;

                       var txtToplam2 = parseFloat(document.getElementById("urunFiyatKDVsiz").innerHTML);
                       txtToplam2 = txtToplam2 - (priceAdet - priceAdet * 18 / 100);
                       document.getElementById("urunFiyatKDVsiz").innerHTML = txtToplam2;

                       var txtToplam3 = parseFloat(document.getElementById("urunKDV").innerHTML);
                       txtToplam3 = txtToplam3 - priceAdet * 18 / 100;
                       document.getElementById("urunKDV").innerHTML = txtToplam3;
                        ////////////////////
                   }
                   document.getElementById(urunID).value = adet;

                   document.getElementById("Label" + urunID).innerHTML = priceAdet * adet;


                   var userID = document.getElementById('userID').innerHTML;
                   var anonymousID = document.getElementById('anonymousLabel').innerHTML;

                   PageMethods.itemIncDec(userID, adet, anonymousID, urunID, test_Success);
                   function test_Success(response) {
                       if (response > 0) {
                           document.getElementById("sepetLabelSergile").style.display = "block";
                       } else {
                           document.getElementById("sepetLabelSergile").style.display = "none";
                       }
                       document.getElementById("sepetLabel").innerHTML = response;
                       document.getElementById("urunAdet").innerHTML = response;
                   }
               }

               ///////////////////////////Sepet Ürün Sil
               function deleteItem(a, b) {
                   PageMethods.deleteItemRequest(a, document.getElementById("userID").innerHTML, document.getElementById("anonymousLabel").innerHTML, sepetCheck);
                   function sepetCheck(response) {
                       if (response > 0) {
                           document.getElementById("sepetLabelSergile").style.display = "block";
                       } else {
                           document.getElementById("sepetLabelSergile").style.display = "none";
                       }
                       document.getElementById("sepetLabel").innerHTML = response;
                       document.getElementById("urunAdet").innerHTML = response;
                   }

                   var silinenUrunFiyati = document.getElementById("Label" + b).value;

                   // Sepet Genel Durum
                   var txtToplam = parseFloat(document.getElementById("urunFiyatToplam").innerHTML);
                   txtToplam = txtToplam - silinenUrunFiyati;

                   var txtToplam2 = parseFloat(document.getElementById("urunFiyatKDVsiz").innerHTML);
                   txtToplam2 = txtToplam2 - (silinenUrunFiyati - silinenUrunFiyati * 18 / 100);

                   var txtToplam3 = parseFloat(document.getElementById("urunKDV").innerHTML);
                   txtToplam3 = txtToplam3 - silinenUrunFiyati * 18 / 100;
                   // Sepet Genel Durum Burada sayfa yenilendikten sonra sağ fiyat kısmı yenilecektir.

                   PageMethods.itemCount(document.getElementById("userID").innerHTML, document.getElementById("anonymousLabel").innerHTML, itemCount_Success);
                   function itemCount_Success(Response) {
                       if (Response == 0) {
                           document.getElementById("sepetDolu").style.display = "none";
                           document.getElementById("sepetBos").style.display = "block";
                       }
                   }
                   $("#sepetDolu").load(" #sepetDolu > *");


                   //////////////////Fiyatlar yenileniyor.
                   document.getElementById("urunFiyatToplam").innerHTML = txtToplam;

                   document.getElementById("urunFiyatKDVsiz").innerHTML = txtToplam2;

                   document.getElementById("urunKDV").innerHTML = txtToplam3;
                   ////////////////////

               }

               ///////////////////////////Sepet Boşalt

               function deleteItems() {
                   PageMethods.deleteItemsRequest(document.getElementById("userID").innerHTML, document.getElementById("anonymousLabel").innerHTML,sepetCheck);
                   function sepetCheck(response) {
                       if (response > 0) {
                           document.getElementById("sepetLabelSergile").style.display = "block";
                       } else {
                           document.getElementById("sepetLabelSergile").style.display = "none";
                       }
                       document.getElementById("sepetLabel").innerHTML = response;
                       document.getElementById("urunAdet").innerHTML = response;
                   }

                   PageMethods.itemCount(document.getElementById("userID").innerHTML, document.getElementById("anonymousLabel").innerHTML, itemCount_Success);
                   function itemCount_Success(response) {
                       if (response == 0) {
                           document.getElementById("sepetDolu").style.display = "none";
                           document.getElementById("sepetBos").style.display = "block";
                       }
                   }
               }
                // Adres değiştirme
               function adres() {
                   var userID = document.getElementById('userID').innerHTML;
                   var adresArea = document.getElementById('<%=DropDownList2.ClientID%>');
                   var adresID = adresArea.options[adresArea.selectedIndex].value;

                   PageMethods.adresFullCek(userID, adresID, onSucceed);
                   function onSucceed(result) {
                       document.getElementById("TextArea3").value = result;
                   }
               }

               // Satın Al
               function satinAl() {
                   var anonymousID = document.getElementById('anonymousLabel').innerHTML;
                   var anonymousAdres = document.getElementById("TextArea4").value;
                   var userID = document.getElementById('userID').innerHTML;
                   var userAdres = document.getElementById("TextArea3").value;

                   if (userID.length == 0) {
                       if (document.getElementById("TextArea4").value.length == 0) {
                           setTimeout(function () { document.getElementById("Label1").style.display = "block"; }, 100);
                           setTimeout(function () { document.getElementById("Label1").style.display = "none"; }, 5000);
                       } else {
                           if (document.getElementById("CheckBox1").checked == false) {
                               setTimeout(function () { document.getElementById("Label2").style.display = "block"; }, 100);
                               setTimeout(function () { document.getElementById("Label2").style.display = "none"; }, 5000);
                           } else {
                               document.getElementById('satinAlButton').style.display = "none";
                               setTimeout(function () { document.getElementById("Label3").style.display = "block"; }, 100);
                               setTimeout(function () { document.getElementById("Label3").style.display = "none"; }, 10000);
                               PageMethods.siparisVer(anonymousID, anonymousAdres, onSuccess);
                               function onSuccess(Response) {
                                   document.getElementById("sepetDolu").style.display = "none";
                                   document.getElementById("sepetBos").style.display = "none";
                                   document.getElementById("sepetSiparis").style.display = "block";
                                   document.getElementById("sepetSiparis2").style.display = "none";
                                   document.getElementById("Label4").innerHTML = "Sipariş No : " + Response;
                                   document.getElementById("sepetLabelSergile").style.display = "none";
                               }
                           }
                       }
                   } else {
                       if (document.getElementById("TextArea3").value.length == 0) {
                           setTimeout(function () { document.getElementById("Label1").style.display = "block"; }, 100);
                           setTimeout(function () { document.getElementById("Label1").style.display = "none"; }, 5000);
                       } else {
                           if (document.getElementById("CheckBox1").checked == false) {
                               setTimeout(function () { document.getElementById("Label2").style.display = "block"; }, 100);
                               setTimeout(function () { document.getElementById("Label2").style.display = "none"; }, 5000);
                           } else {
                               document.getElementById('satinAlButton').style.display = "none";
                               setTimeout(function () { document.getElementById("Label3").style.display = "block"; }, 100);
                               setTimeout(function () { document.getElementById("Label3").style.display = "none"; }, 10000);
                               PageMethods.siparisVer(userID, userAdres,onSuccess);
                               function onSuccess(Response) {
                                   document.getElementById("sepetDolu").style.display = "none";
                                   document.getElementById("sepetBos").style.display = "none";
                                   document.getElementById("sepetSiparis").style.display = "none";
                                   document.getElementById("sepetSiparis2").style.display = "block";
                                   document.getElementById("Label5").innerHTML = "Sipariş No : " + Response;
                                   document.getElementById("sepetLabelSergile").style.display = "none";
                               }
                           }
                       }
                   }
               }
           </script>
       </form>
   </body>
</html>
