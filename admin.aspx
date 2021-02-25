<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Otomotiv_Yedek_Parça_E_Ticaret_Sitesi.admin" %>

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
            <a class="nav-link active text-red" href="admin.aspx">
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
        <div class="col-md-12 justify-content-center" style="margin-top:-100px">
          <div class="card bg-secondary shadow border-0">
            <div class="card-body px-lg-5 py-lg-5" style="margin-bottom:50px;">
              <form method="post" role="form" runat="server">
                  <style> @media (min-width:1100px){
                          .maxWidthGrid
    {
        max-width: 800px;
        max-height: 500px;
        overflow:scroll;
    }}
 @media (min-width:700px){
                          .maxWidthGrid
    {
        max-width: 700px;
        max-height: 250px;
        overflow:scroll;
    }}
  @media (max-width:480px){
                          .maxWidthGrid
    {
        max-width: 700px;
        max-height: 150px;
        overflow:scroll;
    }}
                  </style>
                    <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true" class="table align-items-center table-flush" HeaderStyle-CssClass="thead-dark" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Mesaj No">  
                                <ItemTemplate>  
                                <div class="text-center">
                                  <h2>  <asp:Label CssClass="mb-0 text-xs" ID="urunmontajid" runat="server" Text='<%#Eval("iletisimFormID")%>'> </asp:Label>  </h2>
                                </div>
                                </ItemTemplate>  
                            </asp:TemplateField> 


                            <asp:TemplateField HeaderText="Adı-Soyadı">  
                                <ItemTemplate>  
                                    <div class="text-center">
                                      <asp:Label CssClass="mb-0 text-xs" ID="anakart" runat="server" Text='<%# String.Format("{0}", Eval("adsoyad")) %>'> </asp:Label>  
                                    </div>
                                </ItemTemplate>  
                            </asp:TemplateField> 


                                    
                            <asp:TemplateField HeaderText="Telefon">  
                                <ItemTemplate>  
                                    <div class="text-center">
                                     <asp:Label CssClass="mb-0 text-xs" ID="bellek" runat="server" Text='<%# String.Format("{0}", Eval("telefon")) %>'> </asp:Label>
                                    </div>
                                </ItemTemplate>  
                            </asp:TemplateField> 

                            <asp:TemplateField HeaderText="Email">  
                                <ItemTemplate>  
                                    <div class="text-center">
                                     <asp:Label CssClass="mb-0 text-xs" ID="gpu" runat="server" Text='<%# String.Format("{0}", Eval("adres")) %>'> </asp:Label>
                                    </div>
                                </ItemTemplate>  
                            </asp:TemplateField> 

               
                            <asp:TemplateField HeaderText="Mesaj">  
                                <ItemTemplate>  
                                    <div class="maxWidthGrid scroll-x">
                                       <asp:Label CssClass="mb-0 text-xs" ID="disk" runat="server" Text='<%# String.Format("{0}", Eval("mesaj")) %>'> </asp:Label>
                                    </div>
                                </ItemTemplate>  
                            </asp:TemplateField> 
           


                            <asp:TemplateField HeaderText="Tarih">  
                                <ItemTemplate>  
                                    <div class="text-center">
                                       <asp:Label CssClass="mb-0 text-xs" ID="guckaynagi" runat="server" Text='<%# String.Format("{0}", Eval("tarih")) %>'> </asp:Label>
                                    </div>
                                </ItemTemplate>  
                            </asp:TemplateField> 


                            <asp:TemplateField HeaderText="Sil">  
                                <ItemTemplate>  
                                    <div class="text-center">
                                     <asp:LinkButton CssClass="btn btn-warning my-4" ID="asd" runat="server" Text='Sil'  CausesValidation="false" CommandName="Delete" AutoPostBack="true"> </asp:LinkButton>  
                                    </div>
                                </ItemTemplate>  
                            </asp:TemplateField> 
                        </Columns>  
                    </asp:GridView>
              </form>
            </div>
          </div>
        </div>
      </div>
</body>

</html>