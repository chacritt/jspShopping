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
                           <div class="carousel-caption ">
                              <h1>ยินดีต้อนรับสู่ <strong class="color">ชาคริต Shop</strong></h1>
                              <p>ศูนย์รวม item ต่างในเกมส์ออนไลน์ที่ดีที่สุด ราคาถูกที่สุด ระบบดีที่สุด สะดวกที่สุด และใช้ภาษา jsp ในการพัฒนาเว็บไซต์ซึ่งมีคนใช้เขียนน้อยมาก </p>
                           </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           <div class="img-box">
                              <figure><img src="images/item_gif.gif" alt="img"/></figure>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
         </div>
      </section>

      <!-- plant -->
      <div id="plant" class="section  product">
         <div class="container">
            <div class="row">
               <div class="col-md-12 ">
                  <div class="titlepage">
                     <h2><strong class="black"> Our</strong>  Products</h2>
                     <span>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected randomised words which dont look even slightly believable</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
<%
        while((rec != null)&&(rec.next())){
%>
         <div class="clothes_main section ">
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
