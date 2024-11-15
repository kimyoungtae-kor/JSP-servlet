<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>더조은</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="images/unnamed.png" types="images/xhr">
   <!-- bootstrap  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-7Pi/otdlbbCR+LnW+F7PwFcSDJOuUJB3OxtEHbg4vSMvzvJjde4Po1v4BR9Gdc9aXNUNFVUY+SK51wWT8WF0Gg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <!-- jquery -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <!-- bxslider -->
   <script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
   <!-- font-awesome -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
    
    </style>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment-with-locales.min.js" integrity="sha512-4F1cxYdMiAW98oomSLaygEwmCnIP38pb4Kx70yQYqRwLVCs3DbRumfBq82T08g/4LJ/smbFGFpmeFlQgoDccgg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
    <div class="wrap">
       <jsp:include page="../common/header.jsp"></jsp:include>

        <main class="container">
          <div class="container clearfix p-2">
               
                <h2 class="text-center fw-bold p-3">View</h2>
            </div>
            <div class="my-3 col-md-9 mx-auto">
                <label for="title" class="form-label mt-3"><i class="fa-solid fa-heading text-danger"></i><b> 제목</b></label>
                <input type="text" class="form-control" id="title" placeholder="title" name="title" value="${post.title}" disabled>

                <label for="content" class="form-label  mt-3"><i class="fa-solid fa-pen text-danger"></i></i><b> Content</b></label>
                <textarea class="form-control" rows="20" id="content" name="content" disabled>${post.content}</textarea>

                <label for="writer" class="form-label mt-3"><i class="fa-solid fa-user-pen text-danger"></i><b> 작성자</b></label>
                <input type="text" class="form-control" id="writer" placeholder="writer" name="writer" value="${post.writer}" disabled>

                <label for="regdate" class="form-label mt-3"><i class="fa-solid fa-clock text-danger"></i><b> 작성일</b></label>
                <input type="text" class="form-control" id="regdate" placeholder="regdate" name="regdate" value="${post.regdate}" disabled>

                <label for="updatedate" class="form-label mt-3"><i class="fa-regular fa-clock text-danger"></i><b> 수정일</b></label>
                <input type="text" class="form-control" id="updatedate" placeholder="updatedate" name="updatedate" value="${post.updatedate}" disabled>
             	
             	<label class="form-label mt-3"><i class="fa-regular fa-file"></i><b> ATTACH</b><br></label><br>
                <label for="attach" class="form-label"><span class="btn btn-primary">파일 첨부</span></label>
                <span class="mx-2 attach-count-txt"></span>
                <input type="file" id="attach"name="files" class="d-none" multiple>
  			<ul class="list-group attach-result">
  				<c:if test="${empty post.attachs}" >
  				 <li class="list-group-item">첨부파일이 없습니다.</li>
  				</c:if>
  				<c:forEach items="${post.attachs}" var="a">
 			  <li class="list-group-item"><a href="${cp}download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}">${a.origin}</a></li>
 			  </c:forEach>
			</ul>
            <div class="clearfix mt-5 mb-2">
                <label class="form-label float-start"><i class="fa-regular fa-comment-dots"></i><b> 댓글</b><br></label>
                <button type="button" class="btn btn-primary float-end btn-sm" id="btnReplyWrite">write reply</button>
            </div>
            <ul class="list-group small replies">
                
            </ul>
			 </div>
               
              <hr>
              <div class ="text-center my-5">
              	<c:if test="${post.writer == member.id}">
                <a href="modify?pno=${post.pno}&${cri.qs2}" class="btn btn-warning">수정</a>
                <a href="remove?pno=${post.pno}&${cri.qs2}" class="btn btn-danger" onclick="return confirm('정말 삭제 하시겠습니까?')">삭제</a>                              
                </c:if>
                <a href="list?${cri.qs2}" class="btn btn-primary">목록</a>
              </div>
             <!-- The Modal -->
            <div class="modal fade" id="replyModal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">댓글</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <label for="replyContent" class="mb-2">content</label>
                        <input type="text" class="form-control mb-3" id="replyContent">
                    
                        <label for="replyWriter" class="mb-2">writer</label>
                        <input type="text" class="form-control mb-3" id="replyWriter" value="${member.id}">
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btnReplyWriteSumbit">작성</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
                    </div>
            
                </div>
                </div>
            </div>
  
      </div>
        </main>
		<script src="${cp}js/reply.js"></script>
        <script>
			moment.locale('ko');            
            const pno = '${post.pno}';

            // replyService.write({content : 'aaaa'})
            replyService.list(pno,function(data){
                let str="";
                for(let i in data){
                    str += makeLi(data[i]);
                }
                $(".replies").append(str);
            });

        function makeLi(reply){
            return `<li class="list-group-item" data-rno="\${reply.rno}">

                <p class="text-black fw-bold my-3 text-truncate">\${reply.content}</p>
                <div class="clearfix text-secondary">
                    <span class="float-start">\${reply.writer}</span>
                    
                    <span class="float-end small">\${moment(reply.regdate,'yyyy/MM/DD-HH:mm:ss').fromNow()}</span>
                    <a type="button" class="float-end  small text-danger mx-2">삭제</a>
                </div>
            </li>`;
        }
        $("#btnReplyWrite").click(function(){
                $("#replyModal").modal("show");
        });
        $(function(){

            $("#btnReplyWriteSumbit").click(function(){
                const writer = $("#replyWriter").val();
                const content = $("#replyContent").val();
                const reply = {pno,writer,content};
                console.log("ffff");
                replyService.write(reply,function(data){
                    $("#replyModal").modal("hide");
                    $("#replyWriter").val("");
                    $("#replyContent").val("");
                    console.log("dddd");
                    location.reload();
                });
            });

        });
        </script>
		
        <footer class="bg-warning text-center p-4 my-5">
            <address>서울특별시 구로구 디지털로 306 대룡포스트 2차 2층 더조은 아카데미 204호</address>
            <p>All rights reserved &copy; copyright.</p>
        </footer>
    </div>
</body>
</html>