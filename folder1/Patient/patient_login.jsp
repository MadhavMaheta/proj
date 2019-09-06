<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<html>
	<head>
		<title>Patient Login</title>
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
				<b><h1> Patient Login</h1></b>
				</div>

				<div class="box-login">
					<form class="form-login" method="post" action="">
						<fieldset>
							<legend>
								Sign in to your account
							</legend>
							<p>
								Please enter your name and password to log in.<br />
							</p>
							<font color="red"><p>${error}</p></font>
							<div class="form-group">
								<span class="input-icon">Username:
									<input type="text" class="form-control" name="username" placeholder="Username">
									<i class="fa fa-user"></i> </span>
							</div>
							<div class="form-group form-actions">
								<span class="input-icon">Password:
									<input type="password" class="form-control password" name="password" placeholder="Password">
									<i class="fa fa-lock"></i>
									 </span>
		
                                                        </div>
							
                                                        <div class="form-actions">
								
								<button type="submit" class="btn btn-primary pull-right" name="submit">
									Login <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
							
						</fieldset>
					</form>
					<div class="copyright">
						&copy; <span class="current-year"></span><span class="text-bold text-uppercase"> Hospital Management System</span>. <span>All rights reserved</span>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
<%
    String patient_username = request.getParameter("username");
    String patient_password = request.getParameter("password");
try{
    if(patient_username!=null && patient_password!=null){
    session.setAttribute("userName",patient_username);  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database","root",""); 
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT * from patients_info WHERE name='"+patient_username+"' AND password='"+patient_password+"' ");
    if(rs.next()){
	response.sendRedirect("welcome_patient.jsp");
        return;

       }
else
{
    response.sendRedirect("error.html");
    return;
}
}
}
catch (Exception e) {
            e.printStackTrace();
}

%>