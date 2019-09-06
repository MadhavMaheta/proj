<%-- 
    Document   : lab_report
    Created on : 31 Jul, 2019, 1:21:57 PM
    Author     : Madhav Maheta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Laboratory Login</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../vendor/themify-icons/themify-icons.min.css">
		<!--<link href="C:/Users/ADMIN/Documents/NetBeansProjects/HMS/web/vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="C:/Users/ADMIN/Documents/NetBeansProjects/HMS/web/vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="C:/Users/ADMIN/Documents/NetBeansProjects/HMS/web/vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="C:/Users/ADMIN/Documents/NetBeansProjects/HMS/web/assets/css/styles.css">
		<link rel="stylesheet" href="C:/Users/ADMIN/Documents/NetBeansProjects/HMS/web/assets/css/plugins.css">
		<link rel="stylesheet" href="C:/Users/ADMIN/Documents/NetBeansProjects/HMS/web/assets/css/themes/theme-1.css" id="skin_color" />
	-->
	</head>
	<body class="login" style="background-image:url(https://www.elegantthemes.com/blog/wp-content/uploads/2013/09/bg-9-full.jpg)">
		<div class="row">
			<div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
				<div class="logo margin-top-30">
				<b><h1> Laboratory Report Upload</h1></b>
				</div>

				<div class="box-login"></div>
							
					<form class="form-login" method="post" action="">
						<fieldset>
							<div class="form-group">
								<span class="input-icon">Username:
									<input type="text" class="form-control" name="pName" placeholder="Username">
									<i class="fa fa-user"></i> </span>
							</div>
							<div class="form-group form-actions">
								<span class="input-icon">Select Report
									<input type="file" class="form-control password" name="pReport" placeholder="Password">
									<i class="fa fa-lock"></i>
									 </span>
		
                                                        <div class="form-actions">
								
								<button type="submit" class="btn btn-primary pull-right" name="submit">
									Upload <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
							
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>


<%
               String r_uName = request.getParameter("pName");
               String r_rep = request.getParameter("pReport");
                
               if(r_uName!=null && r_rep!=null){
               Class.forName("com.mysql.jdbc.Driver");
               Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database","root","");
               String upload_report = "insert into lab_report(userid,user_report) values (?, ?)";
               PreparedStatement ps=conn.prepareStatement(upload_report);
               
               FileInputStream fis = null;
               File file = new File(r_rep);
               fis = new FileInputStream(file);
               ps.setString(1,r_uName);
               ps.setBinaryStream(2, fis, (int) file.length());
               int row=ps.executeUpdate();
               if(row>0)
               {
                   response.sendRedirect("welcome_labo.jsp");
                   return;
               }
               }
%>