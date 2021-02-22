<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="style.html"%>
<%@include file="header.html"%>

<%
	if(request.getParameter("Action") != null)	
	{

		Connection connect = null;
		Statement s = null;
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/item_shop"+"?user=root&password=12345678");
            s = connect.createStatement();

            String username = request.getParameter("username");
			   String password = request.getParameter("password");
         
            String sql = "SELECT * FROM  member WHERE " +
                        " Username = '" + username + "' AND " + 
                        " Password = '" + password + "' ";
            
            ResultSet rec = s.executeQuery(sql);
			
            if(!rec.next())
            {
               out.print("<font color=red>Username and Password Incorrect!</font>");
            } else {
               rec.first();
               session.setAttribute("sUserID",rec.getString("id"));	
               %>
                  <script>location.href = "user/shop.jsp";</script>
               <%
            }
            
            } catch (Exception e) {
               // TODO Auto-generated catch block
               out.println(e.getMessage());
               e.printStackTrace();
            }
         
            try {
               if(s!=null){
                  s.close();
                  connect.close();
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               out.println(e.getMessage());
               e.printStackTrace();
            }
		
	}
		
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
                                <h1 align="center">LOGIN</h1>
                            </div >
                            <form method="post" action="login.jsp?Action=Login">
                            <div>
                            <input type="text" name="username" placeholder="username :" class="form-control" style="border-radius: 25px;">
                            <br>
                            <input type="password" name="password" placeholder="password :" class="form-control" style="border-radius: 25px;">
                            <br>
                            <button class="btn btn-danger btn-lg" style="border-radius: 15px;" onclick="onBack()">BACK</button>
                            &nbsp;
                            <button class="btn btn-success btn-lg" style="border-radius: 15px;">LOGIN</button>
                            <br>
                            </div>
                            </form>
                            <a href="register.jsp"><p>register ?</p></a>

                        </div>
                     </div>
                  </div>
               </div>
         </div>
      </section>

   <script>
    function onBack(){
        location.href = "index.jsp";
    }
  </script>