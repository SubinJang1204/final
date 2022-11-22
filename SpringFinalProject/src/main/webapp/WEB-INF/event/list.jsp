<!DOCTYPE html>
<html>
<head>
  <title>title</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 <style type="text/css">
 .menu i{cursor:pointer;}
    .menu .hide{display:none;}
 </style>
</head>
<body>
  <div>
    <ul>
        <li class="menu">
            <i class="bi bi-justify" style="font-size: 18pt;top:3px"></i>
            <div class="hide">
                <span>메뉴1-1</span>
                <span>메뉴1-2</span>
                <span>메뉴1-3</span>
                <span>메뉴1-4</span>
                <span>메뉴1-5</span>
                <span>메뉴1-6</span>
            </div>
        </li>
 
    </ul>
</div>
<script>
    $(document).ready(function(){
        $(".menu>i").click(function(){
            var submenu = $(this).next(".hide");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
</body>
</html>