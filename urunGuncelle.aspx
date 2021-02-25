<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urunGuncelle.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.urunGuncelle" %>

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
            <a class="nav-link active text-red" href="urunGuncelle.aspx">
              <i class="ni ni-album-2"></i> Ürün Güncelle
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="urunSiparis.aspx">
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
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
        <div class="container" style="margin-top: -200px;">            
            <div class="row">
                <div class="col-md-12 text-center"  style="margin:50px 0px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.6);background-color:#fff;">
                    <br />
                    <h1>Ürünler Tablosu</h1>

                    <div style="display:flow-root;max-width:400px;" class="h3">Kategori :
                        <asp:Dropdownlist id="DropDownList4" OnSelectedIndexChanged="OnSelectedIndexChanged3" style="max-width:250px;margin-left:5px;float:right;" AutoPostBack="true" placeholder="Kategori Seçin!" class="form-control" type="text" runat="server">
                        </asp:Dropdownlist>
                    </div>
                    <div style="padding-top:10px;padding-bottom:45px;border-radius:20px;border-color:rgba(0,0,0,0.4);margin: 25px 0px;">
                        <asp:Label runat="server" id="Label13" CssClass="h6" style="color:black;margin:0px 5px;"></asp:Label>
                        <asp:Label runat="server" id="Label12" CssClass="h6" style="float:right;color:black;margin:0px 5px;"></asp:Label>
                        <table border="1" id="tableSiparis" style="border-collapse:unset;border-color:rgba(0,0,0,0.6);width:100%">
                            <tbody>
                                <asp:Repeater runat="server" ID="Repeater1">
                                <ItemTemplate>
                                    <asp:Label runat="server" id="Label1" style="display:none;"><%# Eval("urunID") %></asp:Label>
                                    <td style="width:150px;">  
                                        <div class="text-center h3" id="test">
                                          <asp:Label runat="server" id="Text1" style="color:black;margin:0px 5px;"><%# Eval("urun") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:150px;">  
                                        <div class="text-center h3">
                                         <asp:Label runat="server" id="Label18" style="color:black;margin:0px 5px;"><%# Eval("fiyat") %> TL</asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:120px;">  
                                        <div class="text-center h3">
                                         <asp:Label runat="server" id="Label14" style="color:black;margin:0px 5px;"><%# Eval("kategoriTuru") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:150px;">  
                                        <div class="text-center h3">
                                         <asp:Label runat="server" id="Label15" style="color:black;margin:0px 5px;"><%# Eval("kategori") %></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width:250px;">  
                                        <div class="text-center h5">
                                          <img src='<%# Eval("resim") %>' class='<%#string.Format("resim{0}", Eval("urunID"))%>' style="width: auto;max-width:100%;max-height:200px;" /></img>
                                        </div>
                                    </td>
                                    <td style="width:550px;">  
                                        <div class="text-center h5">
                                         <textarea readonly class='<%#string.Format("form-control h3 aciklama{0}", Eval("urunID"))%>' runat="server" style="margin-left:5px;padding-bottom:100px;float:right;white-space: pre-line;">
                                         <%# Eval("aciklama") %></textarea>
                                        </div>
                                    </td>
                                    <td style="width:100px;padding: 0px 5px;">  
                                        <div class="text-center h6">
                                            <h4><asp:LinkButton class="fa-border text-center btn-warning" OnClientClick='<%# "showItem(\""+Eval("urunID")+"\",\""+Eval("urun")+"\",\""+Eval("fiyat")+"\",\""+Eval("kategoriTuru")+"\",\""+Eval("kategoriID")+"\");return false;" %>' style="padding:0px 5px;margin-top:5px;width: 100%;border-radius: 20px;display:inline-block;border-color:rgba(0,0,0,0.5);" runat="server">
                                            Seç</asp:LinkButton></h4>
                                        </div>
                                    </td>
                                    <td style="width:100px;padding: 0px 5px;">  
                                        <div class="text-center h6">
                                            <h4><asp:LinkButton class="fa-border text-center btn-danger" OnClientClick='<%# "deleteItem(\"" + Eval("urunID") + "\",\"" + Eval("urun") + "\",\"" + Eval("kategori") + "\"); return false;" %>' style="padding:0px 5px;margin-top:5px;width: 100%;border-radius: 20px;display:inline-block;border-color:rgba(0,0,0,0.5);" runat="server">
                                            Sil</asp:LinkButton></h4>
                                        </div>
                                    </td>
                                </tr>

                                    <asp:Button ID="btn" OnClick="test" CssClass="brn" runat="server" style = "display:none;" />

                                </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
              </div>
            </div>
          </ContentTemplate>
        </asp:UpdatePanel>
                <!-- Modal -->
      

         <div id="myModal" class="modal2">
            
            <!-- Modal content -->
            <div class="modal-content2 fa-border" style="border-radius: 50px;">
                <div class="close">&times;</div>
                <div class="row justify-content-center">
                 <div class="col-md-10" style="margin:50px 0px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.6);background-color:#fff;padding-bottom: 40px;">
                         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>
                            <br />
                            <h1>Ürün Özellikleri</h1>
                            <br />
                            <div style="display:flow-root;" class="h3">Ürün Adı : 
                                <asp:TextBox ID="urun" class="form-control h3" runat="server" style="max-width:330px;margin-left:5px;float:right;">
                                </asp:TextBox>
                            </div>
                 
                            <div style="display:flow-root;" class="h3">Fiyat: : 
                                <asp:TextBox ID="fiyat" class="form-control h3" runat="server" style="max-width:330px;margin-left:5px;float:right;">
                                </asp:TextBox>
                            </div>
                                <div style="display:flow-root;" class="h3">Kategori Türü :
                                    <asp:Dropdownlist id="DropDownList1" style="max-width:330px;margin-left:5px;float:right;" AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged" class="form-control" type="text" runat="server">
                                        <asp:ListItem Value="1">Mekanik</asp:ListItem>
                                        <asp:ListItem Value="2">Aksesuar</asp:ListItem>
                                    </asp:Dropdownlist>
                                </div>

                                <div style="display:flow-root;" class="h3">Kategori :
                                    <asp:Dropdownlist id="DropDownList2" style="max-width:330px;margin-left:5px;float:right;" AutoPostBack="true" placeholder="Kategori Seçin!" class="form-control" type="text" runat="server">
                                      </asp:Dropdownlist>
                                </div>


                            <div style="display:flow-root;" class="h3">Açıklama : 
                                <textarea id="aciklama" class="form-control h3" runat="server" style="white-space: pre-line;max-width:330px;margin-left:5px;padding-bottom:100px;float:right;">
                                </textarea>
                            </div>

                            <asp:Label runat="server" id="labelUrunID" style="display:none;"/>


                            <div class="text-center" style="margin-top:20px;">
                                  <strong>
                                      <asp:Label ID="adHata" runat="server" Text="Bu isimde bir ürün zaten mevcut." CssClass="alert alert-danger" style="display:none"></asp:Label>
                                  </strong>
                            </div>

                           <div class="text-center" style="margin-top:20px;">
                                  <strong>
                                      <asp:Label ID="adBos" runat="server" Text="Ürün ismi girmediniz." CssClass="alert alert-danger" style="display:none"></asp:Label>
                                  </strong>
                            </div>

                           <div class="text-center" style="margin-top:20px;">
                                  <strong>
                                      <asp:Label ID="fiyatBos" runat="server" Text="Ürün fiyatını girmelisiniz!" CssClass="alert alert-danger" style="display:none"></asp:Label>
                                  </strong>
                            </div>

                            <div class="text-center" style="margin-top:20px;">
                                  <strong>
                                      <asp:Label ID="aciklamaBos" runat="server" Text="Ürün açıklaması girmelisiniz!" CssClass="alert alert-danger" style="display:none"></asp:Label>
                                  </strong>
                            </div>

                           <div class="text-center" style="margin-top:20px;">
                                  <strong>
                                      <asp:Label ID="resimBos" runat="server" Text="Ürün görseli yüklenemedi." CssClass="alert alert-danger" style="display:none"></asp:Label>
                                  </strong>
                            </div>

                            <div class="text-center" style="margin-top:20px;">
                                  <strong>
                                      <asp:Label ID="Label1" runat="server" Text="Ürün eklendi." CssClass="alert alert-success" style="display:none"></asp:Label>
                                  </strong>
                            </div>
                           </ContentTemplate>
                        </asp:UpdatePanel>
                             <div class="text-center">
                                    <button id="Button" onclick="urunUpdate();" runat="server" type="button" class="btn btn-primary my-4">Güncelle</button>
                            </div>
                </div>
               </div>
             </div>  
           </div>

                <!-- Modal -->
         <div id="myModal2" class="modal2">
            
            <!-- Modal content -->
            <div class="modal-content2 fa-border" style="border-radius: 50px;">
                <div class="close">&times;</div>
                <div class="row justify-content-center">
                 <div class="col-md-10"  style="margin:50px 0px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.6);background-color:#fff;padding-bottom: 40px;">
                  <div class="row justify-content-center" style="margin:30px 30px;">
                     <h2><asp:Label ID="silUrun" runat="server" CssClass="h2"></asp:Label> ürününü silmek isteğinize emin misiniz?</h2>
                  </div>
                     <br />
                     <br />
                  <div class="row justify-content-center">
                    <div class="text-center h6" style="display:-webkit-inline-box;">
                        <asp:Label runat="server" ID="silinecekUrunID" style="display:none;"></asp:Label>
                        <h3><asp:LinkButton class="fa-border text-center btn-danger" OnClientClick="deleteItemConfirm();return false;" style="padding:0px 20px;margin-top:5px;width: 100%;border-radius: 10px;display:inline-block;border-color:rgba(0,0,0,0.5);" runat="server">
                        Sil</asp:LinkButton></h3>
                        <h3><asp:LinkButton class="fa-border text-center btn-warning"  OnClientClick="kapa();return false;" style="margin-left:30px;padding:0px 20px;margin-top:5px;width: 100%;border-radius: 10px;display:inline-block;border-color:rgba(0,0,0,0.5);" runat="server">
                        İptal</asp:LinkButton></h3>
                    </div>
                 </div>
                </div>
               </div>
             </div>
          </div>
      <script>
          var urunIDGenel;
          function showItem(urunID, urun, fiyat, kategoriTuru, kategoriID) {
              document.getElementById("myModal").style.display = "block";
              urunIDGenel = urunID;
              document.getElementById("urun").value = urun;
              document.getElementById("fiyat").value = fiyat;
              var aciklama = document.getElementsByClassName("aciklama" + urunID)[0].value;
              var str = aciklama.trim();
              document.getElementById("aciklama").value = str;
              /*var img = document.createElement('img');
              img.setAttribute('src', document.getElementsByClassName("resim" + urunID)[0].src);
              img.setAttribute("style", 'max-width:100%;width:auto;height:200px;float:right');
              img.setAttribute("class", "silinecek");
              document.getElementById("dResim").appendChild(img);*/
              var kategori;
              if (kategoriTuru == "Mekanik") {
                  kategori = 1;
              }
              else {
                  kategori = 2;
              }
              var DropDownList1 = document.getElementById('<%=DropDownList1.ClientID%>');
              DropDownList1.value = kategori;

              var DropDownList2 = document.getElementById('<%=DropDownList2.ClientID%>');
              DropDownList2.value = kategoriID;
          }

          function deleteItem(urunID, urun,kategori) {
              document.getElementById("silUrun").innerHTML = urun + " " + kategori;
              document.getElementById("myModal2").style.display = "block";
              document.getElementById("silinecekUrunID").value = urunID;
          }
          function deleteItemConfirm() {
              var urunID = document.getElementById("silinecekUrunID").value;
              PageMethods.urunuSil(urunID);
              document.getElementById("myModal2").style.display = "none";
              document.getElementsByClassName("brn")[0].click();
          }
          function kapa() {
              document.getElementById("myModal2").style.display = "none";
          }

          function urunUpdate() {
              var urunID = urunIDGenel;
              var urun =document.getElementById("urun").value;
              var fiyat = document.getElementById("fiyat").value;

              var DropDownList2 = document.getElementById('<%=DropDownList2.ClientID%>');
              var kategoriID = DropDownList2.options[DropDownList2.selectedIndex].value;

              var aciklama = document.getElementById("aciklama").value;
              
              if (urun == "") {
                  setTimeout(function () { document.getElementById("adBos").style.display = "block"; }, 100);
                  setTimeout(function () { document.getElementById("adBos").style.display = "none"; }, 4000);
              } else {
                  if (fiyat == "") {
                      setTimeout(function () { document.getElementById("fiyatBos").style.display = "block"; }, 100);
                      setTimeout(function () { document.getElementById("fiyatBos").style.display = "none"; }, 4000);
                  } else {
                      if (aciklama == "") {
                          setTimeout(function () { document.getElementById("aciklamaBos").style.display = "block"; }, 100);
                          setTimeout(function () { document.getElementById("aciklamaBos").style.display = "none"; }, 4000);
                      } else {
                          PageMethods.urunAdKontrol(urun,urunID, onSuccess);
                          function onSuccess(Response) {
                              if (Response == true) {
                                  setTimeout(function () { document.getElementById("adHata").style.display = "block"; }, 100);
                                  setTimeout(function () { document.getElementById("adHata").style.display = "none"; }, 4000);
                              }
                              else {
                                  PageMethods.urunGuncelleniyor(urun, fiyat, kategoriID, aciklama, urunID);
                                  setTimeout(function () { document.getElementById("Label1").style.display = "block"; }, 100);
                                  setTimeout(function () { document.getElementById("Label1").style.display = "none"; }, 2000);
                                  document.getElementsByClassName("brn")[0].click();
                                  document.getElementById("myModal").style.display = "none";
                                  document.getElementsByClassName("silinecek")[0].remove();
                              }
                          }
                      }
                  }
              }
          }

          var span = document.getElementsByClassName("close")[0];
          var span2 = document.getElementsByClassName("close")[1];

          span.onclick = function () {
              document.getElementById("myModal").style.display = "none";
              document.getElementsByClassName("silinecek")[0].remove();
          }
          span2.onclick = function () {
              document.getElementById("myModal2").style.display = "none";
          }
      </script>
</form>
</body>
</html>