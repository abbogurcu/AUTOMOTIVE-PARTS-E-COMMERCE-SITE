<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urunSiparis.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.urunSiparis" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
      ERU CM Administration Page
  </title>
    <link rel="apple-touch-icon" sizes="180x180" href="/p/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/p/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/p/favicon-16x16.png">
<link rel="manifest" href="/p/site.webmanifest">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="assets2/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="assets2/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
      <link href="assets2/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
      <link href="css/bootstrap.css" rel="stylesheet" />
</head>

<body class="bg-default">
  <form method="post" runat="server">
      <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
      <div class="container px-4">
        <a class="navbar-brand">
          &nbsp;</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbar-collapse-main">
        <ul class="navbar-nav">
          <li class="nav-item ">
            <a class="nav-link" href="admin2.aspx">
              <i class="ni ni-lock-circle-open"></i> Şifre Değiştir
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="admin.aspx">
              <i class="ni ni-bell-55"></i> İletişim Kutusu
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="urunYukle.aspx">
              <i class="ni ni-image"></i> Ürün Yükle
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="urunGuncelle.aspx">
              <i class="ni ni-album-2"></i> Ürün Güncelle
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active text-red" href="urunSiparis.aspx">
              <i class="ni ni-album-2"></i> Ürün Sipariş
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="urunKargo.aspx">
              <i class="ni ni-album-2"></i> Kargo
            </a>
          </li>
        </ul>
          <!-- Collapse header -->
          <div class="navbar-collapse-header d-md-none">
            <div class="row">
              <div class="col-6 collapse-brand">
                <a href="../index.html">
                  &nbsp;</a></div>
              <div class="col-6 collapse-close">
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
               <div class="col-lg-2" style="position: absolute;right: 0;">
                   <div class="pull-right">
                       <asp:Label CssClass="h6" style="color:white;" runat="server" id="adisoyadi"></asp:Label>
                      <a onserverclick="logout2_ServerClick" class="btn-outline-danger fa-border" style="border-width:0px;border-radius:10px;font-weight: bold;font-size:15px;text-decoration:underline !important;" id="session" runat="server">Güvenli Çıkış</a>

                   </div>
               </div>
     </nav>
   </div>
    <!-- Header -->
    <div class="header bg-gradient-primary py-7 py-lg-8">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6">
              <h1 class="text-white">ERU CM Administration Page</h1>
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
         <div class="container" style="margin-top: -200px;margin-bottom:100px;position:relative;background-color:#cacacac4;border-radius:40px;">            
            <div class="row justify-content-end">
                    <div style="float:right;display:-webkit-inline-box;margin-top:30px;margin-right: 10%;">
                        <div class="h6" style="padding-top: 8px;margin-right:5px;">Tarihe Göre Listele :</div>
                            <div class="dropdown h6">
                            <button class="fa-border text-center btn-danger dropdown-toggle h6" style="outline:none;padding:5px 5px;width: 100%;border-radius: 20px;display:inline-block;border-width:unset;border-bottom-width:1px;border-color:rgba(0,0,0,0.5);" runat="server" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Seçiniz
                            </button>
                            <div class="dropdown-menu float-right" aria-labelledby="dropdownMenu2">
                                <button runat="server" onserverclick="siparisTumu" class="dropdown-item h6" type="button">Tümü</button>
                                <button runat="server" onserverclick="siparisYil" class="dropdown-item h6" type="button">Son 1 Yıl</button>
                                <button runat="server" onserverclick="siparisAy" class="dropdown-item h6" type="button">Son 30 Gün</button>
                                <button runat="server" onserverclick="siparisHafta" class="dropdown-item h6" type="button">Son 1 Hafta</button>
                                <button runat="server" onserverclick="siparisUcGun" class="dropdown-item h6" type="button">Son 3 Gün</button>
                                <button runat="server" onserverclick="siparisGun" class="dropdown-item h6" type="button">Son 1 Gün</button>
                          </div>
                        </div>
                    </div>
             </div>
             <div class="row justify-content-center" style="margin-top:50px;">
                 <div class="col-md-10">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                   <ContentTemplate>
                    <asp:Repeater runat="server" ID="Repeater1" OnItemDataBound="ItemDataBound">
                        <ItemTemplate>
                            <div class="fa-border" style="padding-left: 10px;padding-right: 10px;padding-top:10px;padding-bottom:45px;border-radius:20px;border-color:rgba(0,0,0,0.4);margin-bottom: 50px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.4);background-color:#fff;">
                            <asp:Label runat="server" id="Label13" CssClass="h6" style="color:black;margin:0px 5px;">Sipariş No : <%# Eval("siparisID") %></asp:Label>
                                <asp:Label runat="server" id="Label12" CssClass="h6" style="float:right;color:black;margin:0px 5px;">Sipariş Tarihi : <%# Eval("tarih") %></asp:Label>
                            <table border="1" id="tableSiparis" style="border-collapse:unset;border-color:rgba(0,0,0,0.6);width:100%;">
                                <tbody>
                                    <tr class="alert alert-info h6 text-center">
                                        <th style="font-size:16px;" scope="col">Ürün Adı</th>
                                        <th style="font-size:16px;" scope="col">Adet</th>
                                        <th style="font-size:16px;" scope="col">Adres</th>
                                        <th style="font-size:16px;" scope="col">Birim Fiyatı</th>
                                        <th style="font-size:16px;" scope="col">Fiyat</th>
                                        <th style="font-size:16px;" scope="col"></th>
	                        	    </tr>
                                    <asp:Repeater runat="server" ID="Repeater2" OnItemDataBound="ItemDataBound2">
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
                                                <td style="width:200px;">  
                                                    <div class="text-center h6">
                                                        <asp:Label runat="server" id="Label15" style="color:black;margin:0px 5px;"><%# Eval("adres") %></asp:Label>
                                                    </div>
                                                </td>
                                                <td style="width:90px;">  
                                                    <div class="text-center h6">
                                                        <asp:Label runat="server" id="Label18" style="color:black;margin:0px 5px;"><%# Eval("fiyat") %> TL</asp:Label>
                                                    </div>
                                                </td>
                                                <td style="width:117px;">  
                                                    <div class="text-center h6">
                                                        <asp:Label runat="server" id="totalFiyat" style="color:black;margin:0px 5px;"><%# Eval("totalFiyat") %> TL</asp:Label>
                                                    </div>
                                                </td>
                                               <asp:Label runat="server" id="onayTut" style="display:none;"><%# Eval("onay") %></asp:Label>

                                                <td style="width:90px;">  
                                                    <div class='<%# string.Format("text-center h6 goster{0}{1}", Eval("siparisID"),Eval("urunID")) %>' style="display:none;" runat="server" id="onayGoster">
                                                        <h4><asp:LinkButton ID="onayButonu" OnClientClick='<%# "siparisOnay(\""+ Eval("siparisID") +"\",\""+Eval("urunID")+"\");return false;" %>' class="fa-border text-center btn-outline-primary" style="padding:5px 5px;margin-top:5px;width: 80%;border-radius: 20px;display:inline-block;border-color:rgba(0,0,0,0.5);" runat="server">
                                                            Onay</asp:LinkButton></h4>
                                                    </div>
                                                    <div class='<%# string.Format("text-center h6 sakla{0}{1}", Eval("siparisID"),Eval("urunID")) %>' style="display:none;" runat="server" id="onaySakla">
                                                        <h4 style="color:lawngreen;">Onaylı</h4>
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
                    </ContentTemplate>
                  </asp:UpdatePanel>

                </div>
            </div>
        </div> 
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.js"></script>
      <script>
          $(document).ready(function () {
              $('.dropdown-toggle').dropdown();
          });

          function siparisOnay(siparisID, urunID) {
              PageMethods.siparisOnayServer(siparisID, urunID);
              document.getElementsByClassName("goster" + siparisID + urunID)[0].style.display = "none";
              document.getElementsByClassName("sakla" + siparisID + urunID)[0].style.display = "block";
          }
      </script>
</form>
</body>
</html>