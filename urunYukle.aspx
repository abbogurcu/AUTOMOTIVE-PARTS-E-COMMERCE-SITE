<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urunYukle.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.urunYukle" %>

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
            <a class="nav-link active text-red" href="urunYukle.aspx">
              <i class="ni ni-image"></i> Ürün Yükle
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="urunGuncelle.aspx">
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
   <form id="form1" method="post" role="form" runat="server">
    <div id="test2" class="container mt--8 pb-5" runat="server" >
      <div class="row justify-content-center">
        <div class="col-lg-6 col-md-7">
          <div class="card bg-secondary shadow border-0">
            <div class="card-body px-lg-5 py-lg-5">

                <div class="form-group mb-3">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-collection"></i></span>
                    </div>
                    <asp:Dropdownlist id="DropDownList1" OnSelectedIndexChanged = "SelectedIndexChanged" AutoPostBack="true" class="form-control" type="text" runat="server">
                        <asp:ListItem Value="1">Mekanik</asp:ListItem>
                        <asp:ListItem Value="2">Aksesuar</asp:ListItem>
                      </asp:Dropdownlist>
                  </div>
                </div>

               <div runat="server" class="form-group mb-3">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-album-2"></i></span>
                    </div>
                    <asp:Dropdownlist id="DropDownList2" OnSelectedIndexChanged = "SelectedIndexChanged2" AutoPostBack="true" placeholder="Kategori Seçin!" class="form-control" type="text" runat="server">
                      </asp:Dropdownlist>
                  </div>
                </div>

                <div class="form-group mb-3" runat="server">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                    </div>
                    <asp:TextBox id="TextBox2" class="form-control" placeholder="Ürün ismini girin!" type="text" runat="server"></asp:TextBox>
                  &nbsp;</div>
                </div>

                <div class="form-group mb-3" runat="server">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                    </div>
                    <asp:TextBox id="TextBox1" class="form-control" placeholder="Ürün fiyatini girin!" type="text" runat="server"></asp:TextBox>
                  &nbsp;</div>
                </div>

                <div class="form-group mb-3" runat="server">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                    </div>
                      <textarea id="TextArea1" class="form-control" placeholder="Ürün açıklaması girin!" runat="server" style="padding-bottom:100px;"></textarea>
                  &nbsp;</div>
                </div>

                <div class="form-group mb-3">
                      <div class="input-group input-group-alternative">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="ni ni-image"></i></span>
                        </div>
                              <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>
                       </div>
                 </div>


                <div class="text-center">
                     <button id="Button" type="submit" class="btn btn-primary my-4" runat="server" onserverclick="Button_Click">Yükle</button>
                </div>

                <div class="text-center">
                      <strong>
                          <asp:Label ID="Label9" runat="server" Text="Ürün görseli yüklenemedi." CssClass="alert alert-success" style="display:none"></asp:Label>
                      </strong>
                </div>

                <div class="text-center">
                      <strong>
                          <asp:Label ID="Label10" runat="server" Text="Fiyat girmediniz." CssClass="alert alert-success" style="display:none"></asp:Label>
                      </strong>
                </div>

                <div class="text-center">
                      <strong>
                          <asp:Label ID="Label11" runat="server" Text="Bu isimde bir ürün zaten mevcut." CssClass="alert alert-success" style="display:none"></asp:Label>
                      </strong>
                </div>

               <div class="text-center">
                      <strong>
                          <asp:Label ID="Label12" runat="server" Text="Ürün ismi girmediniz." CssClass="alert alert-success" style="display:none"></asp:Label>
                      </strong>
                </div>

                <div class="text-center">
                      <strong>
                          <asp:Label ID="Label1" runat="server" Text="Ürün eklendi." CssClass="alert alert-success" style="display:none"></asp:Label>
                      </strong>
                </div>

                <div class="text-center">
                      <strong>
                          <asp:Label ID="Label2" runat="server" Text="Ürün ismini eklemelisiniz!" CssClass="alert alert-warning" style="display:none"></asp:Label>
                      </strong>
                </div>

                <div class="text-center">
                      <strong>
                          <asp:Label ID="Label3" runat="server" Text="Ürün fiyatını girmelisiniz!" CssClass="alert alert-warning" style="display:none"></asp:Label>
                      </strong>
                </div>

                <div class="text-center">
                      <strong>
                          <asp:Label ID="Label13" runat="server" Text="Ürün açıklaması girmelisiniz!" CssClass="alert alert-warning" style="display:none"></asp:Label>
                      </strong>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>

       <div id="test" runat="server">
           <div class="container mt--8 pb-5" runat="server" style="opacity:1;top: 50% !important;">
              <div class="row justify-content-center">
                 <div class="col-lg-6 col-md-7">
                    <div class="card bg-secondary shadow border-0">
                       <div class="card-body px-lg-5 py-lg-5">

                          <div class="text-left">
                             <button id="Button2" type="submit" class="btn btn-warning my-4" runat="server" onserverclick="Button2_Click">Geri</button>
                          </div>

                            <div runat="server" class="form-group mb-3">
                                <div class="input-group input-group-alternative">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-album-2"></i></span>
                                </div>
                                <asp:Dropdownlist id="DropDownList3" OnSelectedIndexChanged = "SelectedIndexChanged3" AutoPostBack="true" placeholder="Kategori Seçin!" class="form-control" type="text" runat="server">
                                    </asp:Dropdownlist>
                                </div>
                            </div>

                            <div class="form-group mb-3" runat="server">
                              <div class="input-group input-group-alternative">
                                <div class="input-group-prepend">
                                  <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                </div>
                                <asp:TextBox id="TextBox3" class="form-control" placeholder="Yeni ürün ismini giriniz!" type="text" runat="server"></asp:TextBox>
                              &nbsp;</div>
                            </div>

                          <strong>
                              <asp:Label ID="Label4" runat="server" Text="Böyle bir kategori zaten bu türde mevcut." CssClass="alert alert-danger" style="display:none"></asp:Label>
                          </strong>

                          <strong>
                              <asp:Label ID="Label5" runat="server" Text="Kategori ismi girmediniz." CssClass="alert alert-danger" style="display:none"></asp:Label>
                          </strong>

                         <strong>
                              <asp:Label ID="Label7" runat="server" Text="Kategori başarıyla eklendi." CssClass="alert alert-success" style="display:none"></asp:Label>
                          </strong>

                         <strong>
                              <asp:Label ID="Label6" runat="server" Text="Kategori başarıyla düzeltildi." CssClass="alert alert-success" style="display:none"></asp:Label>
                          </strong>

                          <div class="text-left">
                             <button id="Button3" type="submit" class="btn btn-primary my-4" runat="server" onserverclick="Button3_Click">Güncelle</button>
                          </div>

                          <div class="text-right">
                             <button id="Button5" type="submit" class="btn btn-danger my-4" runat="server" onserverclick="Button5_Click">Sil</button>
                          </div>

                          <div class="text-left">
                             <button id="Button4" type="submit" class="btn btn-success my-4" runat="server" onserverclick="Button4_Click">Ekle</button>
                          </div>
                      

                       </div>
                    </div>
               </div>
            </div>
         </div>
      </div>

      <div id="test3" runat="server">
           <div class="container mt--8 pb-5" runat="server" style="opacity:1;top: 50% !important;">
              <div class="row justify-content-center">
                 <div class="col-lg-6 col-md-7">
                    <div class="card bg-secondary shadow border-0">
                       <div class="card-body px-lg-5 py-lg-5">

                          <div class="text-left">
                             <button id="Button8" type="submit" class="btn btn-warning my-4" runat="server" onserverclick="Button8_Click">Geri</button>
                          </div>


                          <strong>
                              <asp:Label ID="Label8" runat="server" Text="" CssClass="form-control alert alert-danger" style="padding-bottom: 80px;"></asp:Label>
                          </strong>


                          <div class="text-right">
                             <button id="Button7" type="submit" class="btn btn-danger my-4" runat="server" onserverclick="Button7_Click">Sil</button>
                          </div>

                       </div>
                    </div>
                 </div>
              </div>
         </div>
       </div>
       </form>
     </div>
</body>

</html>