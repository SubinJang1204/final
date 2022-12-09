<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
   integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
   integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
   crossorigin="anonymous"></script>

<title>Insert title here</title>
<style type="text/css">
.dropdown:hover .dropdown-menu {
   display: block;
   margin-top: 0;
}
* {
   font-family: 'Gowun Dodum', sans-serif;
}
li {
   margin-right: 10px;
   margin-top: 10px;
   color: #000;
}
li a {
   color: #000;
   text-decoration: none;
}
li a:hover {
   color: #000;
   text-decoration: none;
}
li a:visited {
   color: #000;
   text-decoration: none;
}
html {
   scroll-behavior: smooth;
}
.menu i {
   cursor: pointer;
}
.menu .hide {
   display: none;
   position: relative;
   top: 24px;
   left: -1600px;
   width: 1920px;
   height: 500px;
   background: rgba(0, 0, 0, 0.45);
   backdrop-filter: blur(20px);
   color: #fff;
}
.profile img {
   border-radius: 100%;
   width: 150px;
   height: 150px;
}
.profile img:hover {
   width: 160px;
   height: 160px;
   transition: 0.3s;
}
.profile {
   text-align: center;
   width: 300px;
   height: 300px;
   position: relative;
   top: 160px;
   left: 220px;
}
span.search {
   position: relative;
   top: 130px;
   left: 300px;
}
.search-box {
   padding: 10px;
   top: -180px;
   position: relative;
   left: 660px;
   transform: translate(-50%, -50%);
   height: 50px;
   background-color: #fff;
   border: 1px solid #fff;
   border-radius: 30px;
   transition: 0.4s;
   width: 500px;
}
.search-box:hover {
   box-shadow: 0px 0px .5px 1px #fff;
   width: 800px;
}
.search-box:hover>.search-btn {
   background-color: #fff;
   position: relative;
   left: -20px;
}
.search-btn {
   font-size: 20pt;
   left: 410px;
   top: -5px;
   position: relative;
}
.search-btn i {
   background-color: transparent;
   border-radius: 100%;
}
.search-txt {
   display: flex;
   padding: 0;
   width: 0px;
   border: none;
   background: none;
   outline: none;
   float: left;
   font-size: 15px;
   line-height: 30px;
   transition: .4s;
   color: #000;
}
.search-box:hover>.search-txt {
   width: 700px;
   padding: 0 6px;
}
textarea::placeholder {
   color: #000;
}
.Q_link {
   position: relative;
   display: block;
   top: -230px;
   left: 1450px;
}
.Q_link span {
   margin-bottom: 20px;
   font-size: 1.5em;
   position: relative;
}
.Q_link span:hover {
   top: -5px;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
   <nav class="navbar navbar-expand-lg sticky-top">
      <div class="container-fluid">

         <button class="navbar-toggler navbar-brand" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
               <li class="nav-item" style="margin-left: 215px;"><a
                  class="nav-link active" aria-current="page" href="/"
                  style="color: #000; font-size: 17pt; margin-top: -6px">Logo</a></li>

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" href="#" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false"
                  style="color: #000;"> Category </a>
                  <ul class="dropdown-menu">
                     <li><a class="dropdown-item" href="#" style="color: #000;">Dropdown
                           Menu1</a></li>
                     <li><a class="dropdown-item" href="#" style="color: #000;">Dropdown
                           Menu2</a></li>
                     <li><a class="dropdown-item" href="#" style="color: #000;">Dropdown
                           Menu3</a></li>
                  </ul></li>
              
               <li class="nav-item"><a class="nav-link" href="${root}/shop"
                  style="color: #000;">Shop</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="${root}/sns/list" style="color: #000;">Trend</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="${root}/alba/albalist" style="color: #000;">Recruit</a></li>
        <li class="nav-item"><a class="nav-link" href="${root}/map/maplist"
                  style="color: #000;">Snap</a></li>
               <c:if test="${sessionScope.loginok==null }">

                  <li style="margin-left: 883px;"><a href="${root}/login/main"><i
                        class="bi bi-box-arrow-right" style="font-size: 18pt;"></i></a></li>&nbsp;&nbsp;&nbsp;
                  <li><i class="bi bi-search"
                     style="font-size: 15pt; position: relative; top: 3px"></i></li>
               </c:if>
               <c:if test="${sessionScope.loginok!=null }">

                  <c:if test="${myid=='admin' }">
                     <li style="position: relative; left: 780px;"><a
                        href="manager"><i class="bi bi-gear" id="hov"
                           style="font-size: 16pt;"></i></a></li>&nbsp;&nbsp;&nbsp;
               </c:if>

                  <li style="margin-left: 780px;"><a
                     href="${root}/login/logoutprocess"><i
                        class="bi bi-box-arrow-left" id="hov" style="font-size: 18pt;"></i></a></li>&nbsp;&nbsp;&nbsp;

                  <li><a href="/mypage/myinfo"><i class="bi bi-person" id="hov"
                        style="font-size: 18pt;"></i></a></li>&nbsp;&nbsp;&nbsp;
                  
                  <li><a href="${root }/cart/cart?myid=${myid }"><i class="bi bi-bag"
                        id="hov" style="font-size: 16pt;"></i>
                        <div style="color: white; background-color: #000; width: 17px; top: -24px; height: 17px; border-radius: 100%; position: relative; left: 15px; font-size: 13px; line-height: 17px;">&nbsp;${count }</div></a></li>&nbsp;&nbsp;&nbsp;
               
                  <li style="cursor: pointer;" class="menu"><i
                     class="bi bi-justify" style="font-size: 18pt; top: 3px"></i>
                      <c:if test="${myid=='admin' }">
                        <div class="hide" style="left: -1650px;">
                     </c:if> <c:if test="${myid!='admin' }">
                        <div class="hide">
                     </c:if><span>

                        <div class="profile" onclick="location.href='mypage'">
                           <img src="${root }/photo/${sessionScope.loginphoto}"><br>
                           <br> <span class="loginname">${loginname}님 환영합니다</span>
                        </div>
                  </span>
                  <span class="search">
                        <form name="/mainsc/list" method="post" action="../mainsc/list" target="_parent" id="search_right">
                           <div class="search-box">
                              <input type="text" class="search-txt" name="searchword"
                                 placeholder="search..." onkeydown="onEnterSubmit()">
                              <a class="search-btn" onchange="readURL(this)"><i
                                 class="bi bi-search"></i></a>
                           </div>
                        </form>
                  </span>
                     <div class="Q_link">
                        <span onclick="location.href='${root}/sns/list'" style="display: block">
                        <i class="bi bi-chat"></i>&nbsp;SNS</span>
                        <span onclick="location.href='${root}/event/list'" style="display: block">
                        <i class="bi bi-gift"></i>&nbsp;EVENT</span>
                        <span onclick="location.href='${root}/notice/list'" style="display: block"><i class="bi bi-calendar4-event"></i>&nbsp;NOTICE</span>
						<span onclick="location.href='${root}/qna/list'" style="display: block">
						<i class="bi bi-question-circle"></i>&nbsp;Q&A</span>
						<span onclick="location.href='${root}/login/logoutprocess'"
                           style="display: block"><i class="bi bi-door-closed"></i>&nbsp;LOGOUT</span>
                     </div>
         </div>
         </li>
         </c:if>
         </ul>
      </div>
      </div>
   </nav>
   <script type="text/javascript">
      $(document).ready(function() {
         $(".menu>i").click(function() {
            var submenu = $(this).next(".hide");
            if (submenu.is(":visible")) {
               submenu.slideUp();
            } else {
               submenu.slideDown();
            }
         });
      });
   </script>
</body>
</html>