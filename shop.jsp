<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="style.html"%>
<%@include file="header.html"%>

<%

    Connection connect = null;
    Statement s = null;

    try{
        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/item_shop"+"?user=root&password=12345678");
        s = connect.createStatement();
        String sql = "SELECT * FROM item";
        ResultSet rec = s.executeQuery(sql);

%>

<section>
         <div id="main_slider" class="section carousel slide banner-main" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#main_slider" data-slide-to="0" class="active"></li>
               <li data-target="#main_slider" data-slide-to="1"></li>
               <li data-target="#main_slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active" style="height: 120px;">
                  <div class="container">
                     
                  </div>
               </div>
         </div>
      </section>

<%
        while((rec != null)&&(rec.next())){
%>
         <div class="">
          <div class="container">
            <div class="row">
               <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                  <div class="sport_product">
                     <figure><img src="images/<%=rec.getString("image")%>" alt="img"/></figure>
                    <h3> $<strong class="price_text">50</strong></h3>
                     <h4><%=rec.getString("name")%></h4>
                  </div>
               </div>
            </div>
            </div>
        </div>
<%
        }
    }catch(Exception e){
        out.println(e.getMessage());
        e.printStackTrace();
    }

    try{
        if(s != null){
            s.close();
        }
    }catch(Exception e){
        out.println(e.getMessage());
        e.printStackTrace();
    }

%>