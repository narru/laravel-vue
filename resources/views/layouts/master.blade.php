<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>Vue js Admin</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
</head>
<style type="text/css">
  li.nav-link{
    color: black;
  }
</style>
<body class="hold-transition sidebar-mini">
<div class="wrapper" id="app">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
            {{ Auth::user()->name }} <span class="caret"></span>
        </a>

        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
          <router-link to="/profile" class="dropdown-item"><i class="fas fa-user-circle text-indigo mr-2"></i>Profile</router-link>
            <a class="dropdown-item" href="{{ route('logout') }}"
               onclick="event.preventDefault();
                             document.getElementById('logout-form').submit();">
                {{ __('Logout') }}
            </a>

            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        </div>
    </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
            class="fa fa-th-large"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="{{  asset('img/logo.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Admin Dashboard</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{ asset('img/profile.png') }}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <!-- <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                All Setting up
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item" style="color: black;">
                <router-link to="/dashboard" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/content" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Content</p>
                </router-link>
              </li>
            </ul>
          </li> -->
          <li class="nav-item">
            <router-link to="/branch" class="nav-link">
              <i class="fas fa-code-branch mr-1"></i> 
              <p>
                Branch information
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fas fa-users mr-1"></i>
              <p>
                Staff Information
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fas fa-newspaper mr-1"></i>
              <p>
                News Articles
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fas fa-business-time mr-1"></i>
              <p>
                Circulars
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fas fa-file mr-1"></i>
              <p>
                Reports
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fas fa-file-download mr-1"></i>
              <p>
                Download Forms
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fab fa-wpforms mr-1"></i>
              <p>
                Manuals
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fas fa-percent mr-1"></i>
              <p>
                Interest Rates 
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fab fa-accusoft mr-1"></i>
              <p>
                Softwares
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fas fa-exchange-alt mr-1"></i>
              <p>
                Preeti To Unicode
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="fab fa-product-hunt"></i>
              <p>
                Product Paper
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/product" class="nav-link">
              <i class="nav-icon fab fa-lastfm-square"></i>
              <p>
                Products
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/users" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Users
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/developer" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                Developer
              </p>
            </router-link>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <router-view></router-view>

        <vue-progress-bar></vue-progress-bar>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2018 <a href="#">Zalayan inc</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<script type="text/javascript" src="{{ asset('js/app.js') }}"></script>
</body>
</html>
