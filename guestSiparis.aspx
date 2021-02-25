<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guestSiparis.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.guestSiparis" %>

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
                                 <li class="nav-item active">
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

   <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
      <!-- end header -->
       <div style="padding:100px 0px;background-color:#ebebeb;">
        <div class="container">

           <div class="row justify-content-center" style="box-shadow: 0 2px 4px 0 rgba(0,0,0,.4);background-color:#fff;padding:50px 50px;">
           <div style="display:-webkit-inline-box;">
           <h2 style="margin-top:10px;">Sipariş No : </h2><asp:TextBox ID="TextBox1" class="form-control" style="margin-left:10px;width: 300px;" runat="server"></asp:TextBox>
           </div>
           <br />
           <h2><asp:LinkButton ID="Button1" onclick="Button1_Click" class="fa-border text-center btn-primary" style="margin-top: 10px;margin-left:15px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server">
               Bul</asp:LinkButton></h2>
      <asp:UpdatePanel runat="server">
	   <ContentTemplate>

        <div class="col-md-12" runat="server" id="siparisGeldi" style="display:none;">
                <div style="padding-top:10px;padding-bottom:45px;border-radius:20px;border-color:rgba(0,0,0,0.4);margin: 25px 0px;">
                <asp:Label runat="server" id="Label13" CssClass="h6" style="color:black;margin:0px 5px;"></asp:Label>
                    <asp:Label runat="server" id="Label12" CssClass="h6" style="float:right;color:black;margin:0px 5px;"></asp:Label>
                <table border="1" id="tableSiparis" style="border-collapse:unset;border-color:rgba(0,0,0,0.6);width:100%">
                    <tbody>
                        <tr class="alert alert-info h6 text-center">
                            <th style="font-size:14px;" scope="col">Ürün Adı</th>
                            <th style="font-size:14px;" scope="col">Ürün Resmi</th>
                            <th style="font-size:14px;" scope="col">Adet</th>
                            <th style="font-size:14px;" scope="col">Adres</th>
                            <th style="font-size:14px;" scope="col">Kargo Firması</th>
                            <th style="font-size:14px;" scope="col">Kargo No</th>
                            <th style="font-size:14px;" scope="col">Birim Fiyatı</th>
                            <th style="font-size:13px;" scope="col">Fiyat</th>
                            <th style="font-size:14px;" scope="col"></th>
	                    </tr>
                        <asp:Repeater runat="server" ID="Repeater1">
                            <ItemTemplate>
                                    <td style="width:150px;">  
                                        <div class="text-center h6">
                                            <asp:Label runat="server" id="Text1" style="color:black;margin:0px 5px;"><%# Eval("urun")+" "+ Eval("kategori") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:450px;">  
                                        <div class="text-center h5">
                                            <img src='<%# Eval("resim") %>' style="width:200px;height:auto;" /></img>
                                        </div>
                                    </td>
                                    <td style="width:30px;">  
                                        <div class="text-center h5">
                                            <asp:Label runat="server" id="Label14" style="color:black;margin:0px 5px;"><%# Eval("adet") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:150px;">  
                                        <div class="text-center h6">
                                            <asp:Label runat="server" id="Label15" style="font-size:12px;color:black;margin:0px 5px;"><%# Eval("adres") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:110px;">  
                                        <div class="text-center h6">
                                            <asp:Label runat="server" id="Label16" style="font-size:12px;color:black;margin:0px 5px;"><%# Eval("kargo") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:110px;">  
                                        <div class="text-center h5">
                                            <asp:Label runat="server" id="Label17" style="color:black;margin:0px 5px;"><%# Eval("kargoNo") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:110px;">  
                                        <div class="text-center h6">
                                            <asp:Label runat="server" id="Label18" style="color:black;margin:0px 5px;"><%# Eval("fiyat") %> TL</asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:120px;">  
                                        <div class="text-center h6">
                                            <asp:Label runat="server" id="totalFiyat" style="color:black;margin:0px 5px;"><%# Eval("totalFiyat") %> TL</asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:50px;padding: 0px 3px;">  
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
                <asp:Label runat="server" id="Label21" CssClass="h6 alert alert-success" style="float:right;color:black;margin:0px 5px;"></asp:Label><br /><br />
                <asp:Label runat="server" id="Label20" CssClass="h6 alert alert-danger" style="float:right;color:black;margin:0px 5px;"></asp:Label><br /><br />
                <asp:Label runat="server" id="Label19" CssClass="h6 alert alert-info" style="float:right;color:black;margin:0px 5px;"></asp:Label><br />
                </div>
            </div>
           </ContentTemplate>
            </asp:UpdatePanel>
            <div class="container row justify-content-center" style="margin-top:100px;">
                <strong>
                    <asp:Label ID="Label2" runat="server" Text="Böyle bir sipariş numarası bulunmamaktadır." CssClass="alert alert-danger h5" style="display:none;"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="Alan boş bırakıldı." CssClass="alert alert-danger h5" style="display:none;"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Kullanıcı hesabıyla giriş yapmalısınız." CssClass="alert alert-danger h5" style="display:none;"></asp:Label>
                </strong>
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
       </form>
   </body>
</html>
