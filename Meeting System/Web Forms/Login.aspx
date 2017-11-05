<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Meeting_System.Web_Forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>
    <link rel="stylesheet" type="text/css" href="../CSS/Login.css" />
    <link href="../BootStrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../JS/jquery-3.2.1.min.js"></script>
    <script src="../BootStrap/js/bootstrap.min.js"></script>
    <script src="../JS/validate.js"></script>
</head>
<body>
  <div class="container">
        <div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
						</div>
						<hr/>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login" data-toggle="validator" role="form" runat="server" style="display: block;">
									<div class="form-group">
										<%--<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="UserName" value="" required/>--%>
                                        <asp:TextBox ID="txtUserName" runat="server" tabindex="1" class="form-control" placeholder="UserName" required></asp:TextBox>
									</div>
									<div class="form-group">
										<%--<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" required/>--%>
                                        <asp:TextBox ID="txtUserPass" runat="server" tabindex="1" class="form-control" placeholder="Password" required TextMode="Password"></asp:TextBox>
									</div>
									<center><div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<%--<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="btn btn-primary" value="Log In"/>--%>
                                            <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Login" class="btn btn-primary"></asp:Button>
											</div>
										</div>
									</div></center>
                                    </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
