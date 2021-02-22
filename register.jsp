<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="style.html"%>
<%@include file="header.html"%>

<%
    if(request.getParameter("submit")!= null){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String status = request.getParameter("status");

        Connection connect = null;
        Statement s =null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/item_shop"+"?user=root&password=12345678");
            s = connect.createStatement();
            String sql = "INSERT INTO member "+" (username,password,name,email,tel,status)"+"VALUES('"+username+"','"+password+"','"+name+"','"+email+"','"+tel+"','"+status+"')";
            s.execute(sql);%>
                <script>
                    swal({
                        title: "Good job!",
                        text: "Success Register",
                        icon: "success",
                    });
                    setTimeout(function(){ 
                            location.href = "login.jsp";
                        }, 1000);
                </script>
        <%
        }catch(Exception e){
            out.println(e.getMessage());
            e.printStackTrace();
            %>
                <script>
                    swal({
                        title: "Fail!",
                        text: "Register Again",
                        icon: "danger",
                    });
                    setTimeout(function(){ 
                            location.href = "register.jsp";
                        }, 1000);
                </script>
        <%
        }

        try{
            if(s != null){
                s.close();
                connect.close();
            }
        }catch(Exception e){
            out.println(e.getMessage());
            e.printStackTrace();
        }
        }else{
            %>

<section >
         <div id="main_slider" class="section carousel slide banner-main" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#main_slider" data-slide-to="0" class="active"></li>
               <li data-target="#main_slider" data-slide-to="1"></li>
               <li data-target="#main_slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <div class="row marginii">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                            <div class="sport_product" style="border-radius: 25px;">
                            <div class="carousel-caption ">
                                <h1 align="center">REGISTER</h1>
                            </div >
                            <form action="register.jsp" method="post" accept-charset="utf-8">
                            <div>
                            <input type="text" name="username" placeholder="username :" class="form-control" style="border-radius: 25px;" required>
                            <br>
                            <input type="password" name="password" placeholder="password :" class="form-control" style="border-radius: 25px;" required>
                            <br>
                            <input type="text" name="name" placeholder="name :" class="form-control" style="border-radius: 25px;" required>
                            <br>
                            <input type="text" name="email" placeholder="email :" class="form-control" style="border-radius: 25px;" required>
                            <br>
                            <input type="text" name="tel" placeholder="tel :" maxlength="10" class="form-control" style="border-radius: 25px;" required>
                            <input type="hidden" name="status" value="2">
                            <br>
                            <button class="btn btn-danger btn-lg" style="border-radius: 15px;" onclick="onBack()">BACK</button>
                            &nbsp;
                            <input type="submit" name="submit" class="btn btn-success btn-lg" style="border-radius: 15px;" value="CONFIRM">
                            <br>
                            </div>
                            </form>

                        </div>
                     </div>
                  </div>
               </div>
         </div>
      </section>

  <%}%>

  <script>
    function onBack(){
        location.href = "login.jsp";
    }
  </script>
