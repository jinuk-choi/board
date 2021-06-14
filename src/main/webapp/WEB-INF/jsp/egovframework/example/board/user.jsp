<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원가입</title>
      
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  
      
    </head>
    <body>
        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                 <form action="/board/userinsert.do" method="post">
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputID">ID</label>
                        <input type="text" class="form-control" id="user_id" name="userId" placeholder="ID를 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="text" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                </form>
            </div>
        </article>

    </body>
</html>

