<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>더조은</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="${cp}images/unnamed.png" types="images/xhr">
    <!-- bootstrap  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
        integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"
        integrity="sha512-7Pi/otdlbbCR+LnW+F7PwFcSDJOuUJB3OxtEHbg4vSMvzvJjde4Po1v4BR9Gdc9aXNUNFVUY+SK51wWT8WF0Gg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- bxslider -->
    <script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"
        integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        .font-color {
            color: #005B48;
            font-size: 30px;
        }

        .donation {
            background-color: #005B48;
            color: white;
            font-size: 30px;
            margin-right: 30px;
        }

        .signup {
            margin-right: 20px;
        }

        .sign {
            margin-top: 50px;
            color: #005B48;
        }

        .sign a:link {
            color: #005B48;
        }

        .donation:hover {
            color: #005B48;
        }

        body {
            font-family: 'MinSans', sans-serif;

        }

        .font-angel {
            color: #009273;
        }

        .textwidth {
            width: 80%;
            margin-left: 10%;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .font-size {
            font-size: 13px;
        }

        .loginimg {
            height: 90%;
            margin-left: 13%;
            width: 70%;
        }
    </style>
    <link rel='stylesheet' type='text/css' href='${cp}font/font.css'>
</head>

<body>

    <div class="wrap">
        <jsp:include page="../common/header.jsp"></jsp:include>
        <main class="container">
            <div class="card mt-5 w-75" style="margin-left: 15%;">
                <div class="text-center mt-5">
                    <p class="font-color bold-text"><span class="font-angel">천사 </span> 회원님, 반갑습니다</p>
                    <p>홈페이지 로그인을 통해, 나의 후원 정보 및 결연아동의 소식,</p>
                    <p>후원 중인 사업 내용, 회원 전용 커뮤니티 등 다양한 서비스를 이용해 보세요.</p>
                </div>

                <form name="frm" class="mx-auto col-12 col-sm-9 p-2 " method="post">
                    <div class="row mb-5">
                        <div class="col-7">
                            <input type="text" class=" form-control textwidth" id="id" placeholder="아이디" name="id">
                            <input type="password" class="form-control my-3 textwidth" id="pwd" placeholder="비밀번호"
                                name="pw">
                            <button class=" btn textwidth" style="background-color: #005B48; color: white;">로그인</button>
                            <div class=" form-check form-switch my-3">
                                <input class="form-check-input " style="margin-left: 1%" type="checkbox" id="mySwitch"
                                    name="remember-id" value="yes">
                                <label class="form-check-label font-size" style="margin-left: 2%" for="mySwitch">아이디
                                    저장</label>
                                <a href="#" class="font-size" style="margin-left: 8%;">아이디</a> <span
                                    class="font-size mx-1"> / </span> <a href="#"
                                    class="font-size"><span>비밀번호찾기</span></a><span class="font-size mx-1"> | </span><a
                                    href="signup.html"><span class="font-size">회원가입</span></a>
                            </div>

                            <button class="btn btn-primary mb-5 " style="margin-left: 10%;">카카오 로그인</button>
                        </div>
                        <div class="col-5">
                        
                            <img src="${cp}images/login.png" class="loginimg">
                        </div>
                    </div>


                </form>
            </div>
        </main>
        <footer class="bg-success text-center p-3 mt-5">
            <address></address>도네이션헤븐 기부천국 | 사업자등록번호 000-00-00000 | 조장 함형준 | 대표이사 함형준 서울특별시 구로구 디지털로 306, 203, 205, 212호
            (구로동, 대륭포스트타워 2차) <br>| 대표전화 0000-0000 | 팩스 00-000-000
            <p>All rights resereved &copy; copyright.</p>
        </footer>
    </div>
    <script>
        /*     if($.cookie("save")){
                $("#id").val($.cookie("save"));
                $("#mySwitch").prop("checked",true);
            } */
    </script>
</body>

</html>