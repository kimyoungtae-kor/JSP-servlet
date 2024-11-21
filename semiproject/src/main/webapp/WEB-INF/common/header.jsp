<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="container-fluid">     
            <nav class="navbar bg-white navbar-expand-sm">
                <ul class="navbar-nav container justify-content-start">
                    <a href="index.html" class="float-start"><img src="${cp}images/logo.png" alt="로고" class="img-fluid" width="250"></a>
                    <li class="mx-3 nav-item"><a class="nav-link text-success" href="index.html"><b class="font-color">공지사항</b></a></li>
                    <li class="mx-3 nav-item"><a class="nav-link text-success" href="mypage.html"><b class="font-color">자료실</b></a></li>
                    <li class="mx-3 nav-item"><a class="nav-link text-success" href="post.html?category=1"><b class="font-color">봉사인증</b></a></li>
                    <li class="mx-3 nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-success" href="#" role="button" data-bs-toggle="dropdown"><b class="font-color">커뮤니티</b></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="post.html?category=2">자유게시판</a></li>
                            <li><a class="dropdown-item" href="post.html?category=3">질문과답변</a></li>
                        </ul>
                    </li>
                    
                    
                </ul>
                <ul class="sign">
                       <a href="signin" class="small float-start text-decoration-none">로그인</a>
                       <a href="#" class="small float-start text-decoration-none vertical mx-3"><p> | </p></a>
                       <a href="signup.html" class="small float-start text-decoration-none signup">회원가입</a>
                
                </ul>
                <a href="donation" class="btn btn-block btn-sm col-1 donation">후원하기</a>
               
            </nav>
</header>