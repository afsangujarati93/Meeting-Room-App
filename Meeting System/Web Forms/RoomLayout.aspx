<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomLayout.aspx.cs" Inherits="Meeting_System.Web_Forms.RoomLayout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/General.css" rel="stylesheet" />
    <link href="../BootStrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../JS/jquery-3.2.1.min.js"></script>
    <script src="../BootStrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#dtmpicStartDate').datetimepicker();
        });
    </script>

    <title></title>
</head>
<body>
    <form id="RoomsLayout" runat="server">
        <div class="container">
            <div class="row">
                <div class="form-group">
                    <div class='input-group date' id='dtmpicStartDate'>
                        <input type='text' class="form-control" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row top-buffer">
                <div class="col-sm-12 buttonWrapper">
                    <button type="button" class="btn btn-warning" disabled>
                        <p class="fs18">
                            Deck
                        </p>
                    </button>
                </div>

            </div>
            <!--Section 1 -->
            <div class="row top-buffer" style="height: 100px">
                <div class="col-sm-1 buttonWrapper">
                    <button type="button" class="btn" disabled>
                        <p class="rotate90 txtCenter">
                            Cafeteria
                        </p>
                    </button>
                </div>
                <div class="col-sm-4 buttonWrapper">
                    <button type="button" class="btn " disabled>Engg Team</button>
                </div>
                <div class="col-sm-3 buttonWrapper">
                    <button type="button" class="btn btn-success ">Amphitheatre</button>
                </div>
                <div class="col-sm-4 buttonWrapper">
                    <button type="button" class="btn " disabled>Engg Team</button>
                </div>
            </div>
            <!--Section 2 -->
            <div class="row top-buffer" style="height: 100px">
                <div class="col-sm-1 buttonWrapper">
                    <button type="button" class="btn " disabled>
                        <p class="rotate90 txtCenter">
                            Toilet  
                        </p>
                    </button>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-3 buttonWrapper">
                            <button type="button" class="btn btn-warning" disabled>
                                <p class="fs10 mb0">
                                    Coding
                                    <br>
                                    Room
                                </p>
                            </button>
                        </div>
                        <div class="col-sm-3 buttonWrapper">
                            <div class="row">
                                <button type="button" class="btn btn-success">
                                    <p>
                                        Fish Bowl
                                    </p>
                                </button>
                            </div>
                        </div>
                        <div class="col-sm-6 buttonWrapper">
                            <button type="button" class="btn btn-success">
                                <p>
                                    Garage
                                </p>
                            </button>
                        </div>
                    </div>
                    <div class="row top-buffer pr5p">
                        <div class="col-sm-12 buttonWrapper pr0 pl0">
                            <button type="button" class="btn " disabled>Engg Team</button>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2 buttonWrapper">
                    <button type="button" class="btn" disabled>
                        <p>
                            Lobby
                        </p>
                    </button>
                </div>
                <div class="col-sm-1 buttonWrapper">
                    <div class="row">
                        <button type="button" class="btn btn-success">
                            <p>
                                The Nest
                            </p>
                        </button>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="row">
                        <div class="col-sm-4 buttonWrapper">
                            <div class="row">
                                <button type="button" class="btn btn-success">
                                    <p>
                                        Viraj Patel
                                    </p>
                                </button>
                            </div>

                        </div>
                        <div class="col-sm-5 buttonWrapper">
                            <div class="row">
                                <button type="button" class="btn btn-success">
                                    <p class="">
                                        Nadir Mistry
                                    </p>
                                </button>
                            </div>
                        </div>
                        <div class="col-sm-3 buttonWrapper pl0">
                            <div class="row">
                                <button type="button" class="btn btn-success">
                                    <p>
                                        Star labs
                                    </p>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="row  top-buffer">
                        <div class="col-sm-3 buttonWrapper pl0">
                            <button type="button" class="btn btn-warning" disabled>
                                <p class="fs10 mb0">
                                    Coding
                                    <br>
                                    Room
                                </p>
                            </button>
                        </div>
                        <div class="row col-sm-9 buttonWrapper pr0">
                            <button type="button" class="btn" disabled>
                                <p>
                                    Engg Team 
                                </p>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col-sm-1 buttonWrapper" style="height: 100px">
                    <button type="button" class="btn" disabled>
                        <p class="fs10 rotate90 txtCenter">
                            Engg Team
                        </p>
                    </button>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
