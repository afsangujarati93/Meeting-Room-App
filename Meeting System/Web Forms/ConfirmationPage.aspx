<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmationPage.aspx.cs" Inherits="Meeting_System.Web_Forms.ConfirmationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/General.css" rel="stylesheet" />
    <title>Confirmation Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type='text/javascript'>
        $(document).ready(function () {

            var vrUserName = $('#hdnUserName').val();
            $('#lblUserName').val(vrUserName);
            //alert(vrUserName);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">

                <div class="col-md-8">
                    <div class="panel panel-info top-buffer">
                        <div class="panel-heading">
                            <label id="lblUserName" />
                            <asp:HiddenField ID="hdnUserName" runat="server" />
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <div class="col-md-6">
                                            Event Title:<hr>
                                        </div>
                                        <div class="col-md-6" runat="server">
                                            <asp:TextBox ID="txtEventTitle" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            Location:<hr>
                                        </div>
                                        <div class="col-md-6" runat="server" id="idLocation">
                                            <asp:TextBox ID="txtLocation"  class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            Event Start DateTime:<hr>
                                        </div>
                                        <div class="col-md-6" runat="server" id="idStartTime">
                                            <asp:TextBox ID="txtStartTime" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            Event End DateTime:<hr>
                                        </div>
                                        <div class="col-md-6" runat="server" id="idEndTime">
                                            <asp:TextBox ID="txtEndTime" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            Event Description:<hr>
                                        </div>
                                        <div class="col-md-6" runat="server" id="idDescription">
                                            <asp:TextBox ID="txtDescription" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            Event Attendees:<hr>
                                        </div>
                                        <div class="col-md-6" runat="server" id="idAttendees">
                                            <textarea id="txtAttendee" cols="20" rows="2" runat="server" readonly></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </form>
</body>
</html>
