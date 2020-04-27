<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 26/04/2020
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar navbar-expand-lg navbar-light bg-black">
    <div class="container">
        <a class="navbar-brand" style="color: white;" href="#">Master-BLOG</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            </ul>
            <ul class=" navbar-nav my-2 my-lg-0">
                <li class="nav-item active">
                    <a style="color: white;" class="aColor nav-link aColor" href="#">Home <span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a style="color: white;" class="nav-link aColor" href="#">Users</a>
                </li>
                <li class="nav-item">
                    <a style="color: white;" class="nav-link aColor" href="#">Tags</a>
                </li>
                <li class="nav-item">
                    <div class="dropdown">
                        <a class="btn btn-dark dropdown-toggle" href="#" role="button" id="menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img alt="AbdeslamRehaimi" class="avatar" src="profile.jpg" height="20" width="20">
                        </a>
                        <div class="dropdown-menu dropdown-menu-sw mt-2" style="width: 180px; background-color: #ffffffe8;" role="menu" aria-labelledby="menu">
                            <a role="menuitem" class="no-underline user-profile-link px-3 pt-2 pb-2 mb-n2 mt-n1 d-block" href="/AbdeslamRehaimi" data-ga-click="Header, go to profile, text:Signed in as">Signed in as <strong
                                    class="css-truncate-target">${fullName}</strong></a>
                            <a role="menuitem" class="dropdown-item" href="#"><span class="adminpro-icon adminpro-locked  icon-drop-user"></span>Disconnect </a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

