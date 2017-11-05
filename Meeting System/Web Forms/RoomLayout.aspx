<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomLayout.aspx.cs" Inherits="Meeting_System.Web_Forms.RoomLayout" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/General.css" rel="stylesheet" />
    <title>Meeting Rooms Layout</title>
    <link href="../BootStrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="../BootStrap/js/jquery-1.8.3.min.js"></script>
    <script src="../JS/bootstrap.min.js"></script>
    <script src="../JS/bootstrap-datetimepicker.min.js"></script>
    <%--http://momentjs.com/downloads/moment.js--%>
    <script src="http://momentjs.com/downloads/moment.js"></script>
    <script type='text/javascript'>
        function disableFunction() {
            var vrAmphi = $('#hdnAmphi').val();
            var vrNest = $('#hdnNest').val();
            var vrGarage = $('#hdnGarage').val();
            var vrFish = $('#hdnFish').val();

            //alert('|' + vrAmphi + '|' + vrNest + '|' + vrGarage + '|' + vrFish);
            if (vrAmphi == "true") {
                $('#btnAmphi').prop('disabled', true);
            }
            if (vrNest == "true") {
                $('#btnNest').prop('disabled', true);
            }
            if (vrGarage == "true") {
                $('#btnGarage').prop('disabled', true);
            }
            if (vrFish == "true") {
                $('#btnFishBowl').prop('disabled', true);
            }
        };

        $(document).ready(function () {
            $('#btnFishBowl').click(function () {
                $('#idStartDateTime').val($('#idStartDate').val()).attr('readonly', 'readonly');
                $('#idEndDateTime').val($('#idEndDate').val()).attr('readonly', 'readonly');
                $('#idCreatedBy').attr('readonly', 'readonly');
                $('#idLocation').val('The FishBowl').attr('readonly', 'readonly');
            });
            $('#btnGarage').click(function () {
                $('#idStartDateTime').val($('#idStartDate').val()).attr('readonly', 'readonly');
                $('#idEndDateTime').val($('#idEndDate').val()).attr('readonly', 'readonly');
                $('#idCreatedBy').attr('readonly', 'readonly');
                $('#idLocation').val('The Garage').attr('readonly', 'readonly');
            });
            $('#btnAmphi').click(function () {
                $('#idStartDateTime').val($('#idStartDate').val()).attr('readonly', 'readonly');
                $('#idEndDateTime').val($('#idEndDate').val()).attr('readonly', 'readonly');
                $('#idCreatedBy').attr('readonly', 'readonly');
                $('#idLocation').val('Amphitheatre').attr('readonly', 'readonly');
            });
            $('#btnNest').click(function () {
                $('#idStartDateTime').val($('#idStartDate').val()).attr('readonly', 'readonly');
                $('#idEndDateTime').val($('#idEndDate').val()).attr('readonly', 'readonly');
                $('#idCreatedBy').attr('readonly', 'readonly');
                $('#idLocation').val('The Nest').attr('readonly', 'readonly');
            });
        });
    </script>
</head>
<body>
    <form id="RoomsLayout" runat="server">
        <div class="container">
            <div class="row">
                <div class="form-group col-md-5">
                    <label for="dtp_input1" class="control-label">Start Date and Time</label>
                    <div class="input-group date form_datetime" data-date-format="dd/MM/yyyy HH:ii p" data-link-field="dtp_input1">
                        <input class="form-control" size="16" type="text" value="" readonly runat="server" id="idStartDate">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                    <input type="hidden" id="dtp_input1" value="" /><br />
                </div>
                <div class="form-group col-md-5">
                    <label for="dtp_input1" class="control-label">End Date and Time</label>
                    <div class="input-group date form_datetime" data-date-format="dd/MM/yyyy HH:ii p" data-link-field="dtp_input2">
                        <input class="form-control" size="16" type="text" value="" runat="server" readonly id="idEndDate">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                    <input type="hidden" id="dtp_input2" value="" /><br />
                </div>
                <div class="form-group col-md-2" style="top: 24px">
                    <%--<button type="button" class="btn btn-info" id="btnShowResult1" runat="server">Show Results</button>--%>
                    <asp:Button ID="ShowResult1" runat="server" class="btn btn-info" Text="Show Results" OnClick="ShowResult1_Click" />
                </div>
            </div>
        </div>
        <div class="container" runat="server" id="divRoomsLayout">
            <div class="row top-buffer">
                <div class="col-sm-12 buttonWrapper">
                    <button type="button" class="btn btn-warning" disabled>
                        <%--<asp:Button ID="btnDeck" runat="server" class="btn btn-warning" OnClick="btnOpenMeetingDetails_Click"/>--%>
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
                        <%--<asp:Button ID="btnCafetria" runat="server" class="btn" Enabled="false"/>--%>
                        <p class="rotate90 txtCenter">
                            Cafeteria
                        </p>
                    </button>
                </div>
                <div class="col-sm-4 buttonWrapper">
                    <button type="button" class="btn " disabled>Engg Team</button>
                    <%--<asp:Button ID="btnEnggTeam1" runat="server" class="btn" Enabled="false" Text="Amphitheatre"/>--%>
                </div>
                <div class="col-sm-3 buttonWrapper">
                    <button type="button" data-toggle="modal" data-target="#idModalMeetingDetails" class="btn btn-success" id="btnAmphi" runat="server">Amphitheatre</button>
                    <%--<asp:Button ID="btnAmphi" runat="server" class="btn btn-success" OnClick="btnOpenMeetingDetails_Click" Text="Amphitheatre"/>--%>
                </div>
                <div class="col-sm-4 buttonWrapper">
                    <button type="button" class="btn" disabled>Engg Team</button>
                    <%--<asp:Button ID="btnEnggTeam2" runat="server" class="btn btn-success" Enabled="false" Text="Engg Team"/>--%>
                </div>
            </div>
            <!--Section 2 -->
            <div class="row top-buffer" style="height: 100px">
                <div class="col-sm-1 buttonWrapper">
                    <button type="button" class="btn " disabled>
                        <%--<asp:Button ID="btnToilet1" runat="server" class="btn" Enabled="false"/>--%>
                        <p class="rotate90 txtCenter">
                            Toilet  
                        </p>
                    </button>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-3 buttonWrapper">
                            <button type="button" class="btn btn-warning" disabled>
                                <%--<asp:Button ID="btnCodingRoom1" runat="server" class="btn btn-warning" OnClick="btnOpenMeetingDetails_Click" Enabled="false"/>--%>
                                <p class="fs10 mb0">
                                    Coding
                                    <br>
                                    Room
                                </p>
                            </button>
                        </div>
                        <div class="col-sm-3 buttonWrapper">
                            <div class="row">
                                <button type="button" data-toggle="modal" data-target="#idModalMeetingDetails" class="btn btn-success" id="btnFishBowl" runat="server">
                                    <%--<asp:Button ID="btnFishBowl" runat="server" class="btn btn-success" OnClick="btnOpenMeetingDetails_Click"/>--%>
                                    <p>
                                        Fish Bowl
                                    </p>
                                </button>
                            </div>
                        </div>
                        <div class="col-sm-6 buttonWrapper">
                            <button type="button" data-toggle="modal" data-target="#idModalMeetingDetails" class="btn btn-success" runat="server" id="btnGarage">
                                <%--<asp:Button ID="btnGarage" runat="server" class="btn btn-success" OnClick="btnOpenMeetingDetails_Click"/>--%>
                                <p>
                                    Garage
                                </p>
                            </button>
                        </div>
                    </div>
                    <div class="row top-buffer pr5p">
                        <div class="col-sm-12 buttonWrapper pr0 pl0">
                            <button type="button" class="btn " disabled>Engg Team</button>
                            <%--<asp:Button ID="btnEnggTeam3" runat="server" class="btn" OnClick="btnOpenMeetingDetails_Click" Text="Engg Team"/>--%>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2 buttonWrapper">
                    <button type="button" class="btn" disabled>
                        <%--<asp:Button ID="btnLobby" runat="server" class="btn" Enabled="false"/>--%>
                        <p>
                            Lobby
                        </p>
                    </button>
                </div>
                <div class="col-sm-1 buttonWrapper">
                    <div class="row">
                        <button type="button" data-toggle="modal" data-target="#idModalMeetingDetails" class="btn btn-success" runat="server" id="btnNest">
                            <%--<asp:Button ID="btnNest" runat="server" class="btn btn-success" OnClick="btnOpenMeetingDetails_Click"/>--%>
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
                                <button type="button" class="btn btn-warning" disabled>
                                    <%--<asp:Button ID="btnVirajPatel" runat="server" class="btn btn-warning" OnClick="btnOpenMeetingDetails_Click" Enabled="false"/>--%>
                                    <p>
                                        Viraj Patel
                                    </p>
                                </button>
                            </div>

                        </div>
                        <div class="col-sm-5 buttonWrapper">
                            <div class="row">
                                <button type="button" class="btn btn-warning" disabled>
                                    <%--<asp:Button ID="btnNadirMistry" runat="server" class="btn btn-warning" OnClick="btnOpenMeetingDetails_Click" Enabled="false"/>--%>
                                    <p class="">
                                        Nadir Mistry
                                    </p>
                                </button>
                            </div>
                        </div>
                        <div class="col-sm-3 buttonWrapper pl0">
                            <div class="row">
                                <button type="button" class="btn btn-warning" disabled>
                                    <%--<asp:Button ID="btnStarLab" runat="server" class="btn btn-success" OnClick="btnOpenMeetingDetails_Click"/>--%>
                                    <p>
                                        Star Lab
                                    </p>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="row  top-buffer">
                        <div class="col-sm-3 buttonWrapper pl0" style="padding-left:0">
                            <button type="button" class="btn btn-warning" disabled>
                                <%--<asp:Button ID="btnCodingRoom2" runat="server" class="btn btn-warning" OnClick="btnOpenMeetingDetails_Click" Enabled="false"/>--%>
                                <p class="fs10 mb0">
                                    Coding
                                    <br>
                                    Room
                                </p>
                            </button>
                        </div>
                        <div class="row col-sm-9 buttonWrapper pr0">
                            <button type="button" class="btn" disabled>
                                <%--<asp:Button ID="btnEnggTeam4" runat="server" class="btn" Enabled="false"/>--%>
                                <p>
                                    Engg Team 
                                </p>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col-sm-1 buttonWrapper" style="height: 100px">
                    <button type="button" class="btn" disabled>
                        <%--<asp:Button ID="btnEnggTeam5" runat="server" class="btn" Enabled="false"/>--%>
                        <p class="fs10 rotate90 txtCenter">
                            Engg Team
                        </p>
                    </button>
                </div>

            </div>
        </div>
        <div class="modal fade" id="idModalMeetingDetails" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Meeting Details</h3>
                    </div>
                    <div class="modal-body">
                        <form id="UserData" novalidate>
                            <div class="form-group">
                                <label for="exampleEventTitle">Event Title</label>
                                <input type="text" class="form-control" id="idEventTitle" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleStartDateTime">Start Date & Time</label>
                                <input type="text" class="form-control" id="idStartDateTime" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleEndDateTime">End Date & Time</label>
                                <input type="text" class="form-control" id="idEndDateTime" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleLocation">Location</label>
                                <input type="text" class="form-control" id="idLocation" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleCreatedBy">CreatedBy</label>
                                <input type="text" class="form-control" id="idCreatedBy" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleDescription">Description</label>
                                <input type="text" class="form-control" id="idDescription" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnEventSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnEventSubmit_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdnAmphi" runat="server" />
        <asp:HiddenField ID="hdnNest" runat="server" />
        <asp:HiddenField ID="hdnGarage" runat="server" />
        <asp:HiddenField ID="hdnFish" runat="server" />
    </form>

    <script type="text/javascript">
        $('.form_datetime').datetimepicker({
            //language:  'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1

        });
        $("#ShowResult1").click(function () {
            try {

                $('#btnAmphi').removeClass('btn-danger');
                $('#btnAmphi').addClass('btn-success');

                $('#btnFishBowl').removeClass('btn-danger');
                $('#btnFishBowl').addClass('btn-success');


                $('#btnGarage').removeClass('btn-danger');
                $('#btnGarage').addClass('btn-success');

                $('#btnNest').removeClass('btn-danger');
                $('#btnNest').addClass('btn-success');

                var fromFilter = $("#idStartDate").val();
                var toFilter = $("#idEndDate").val();

                //Converting 12 hours format to 24 hours format for From Date Time
                var fromFilterArr = fromFilter.split(" ");
                var fromFilterDate = fromFilterArr[0];
                var fromFilterTime = fromFilterArr[1] + ' ' + fromFilterArr[2];

                var hoursFrom = Number(fromFilterTime.match(/^(\d+)/)[1]);
                var minutesFrom = Number(fromFilterTime.match(/:(\d+)/)[1]);
                var AMPMFrom = fromFilterTime.match(/\s(.*)$/)[1].toLowerCase();

                if (AMPMFrom == "pm" && hoursFrom < 12) hoursFrom = hoursFrom + 12;
                if (AMPMFrom == "am" && hoursFrom == 12) hoursFrom = hoursFrom - 12;
                var sHoursFrom = hoursFrom.toString();
                var sMinutesFrom = minutesFrom.toString();
                if (hoursFrom < 10) sHoursFrom = "0" + sHoursFrom;
                if (minutesFrom < 10) sMinutesFrom = "0" + sMinutesFrom;

                fromFilter = fromFilterArr[0] + ' ' + sHoursFrom + ':' + sMinutesFrom;

                //Converting 12 hours format to 24 hours format for TO Date Time
                var toFilterArr = toFilter.split(" ");
                var toFilterDate = toFilterArr[0];
                var toFilterTime = toFilterArr[1] + ' ' + toFilterArr[2];

                var hoursTo = Number(toFilterTime.match(/^(\d+)/)[1]);
                var minutesTo = Number(toFilterTime.match(/:(\d+)/)[1]);
                var AMPMTo = toFilterTime.match(/\s(.*)$/)[1].toLowerCase();

                if (AMPMTo == "pm" && hoursTo < 12) hoursTo = hoursTo + 12;
                if (AMPMTo == "am" && hoursTo == 12) hoursTo = hoursTo - 12;
                var sHoursTo = hoursTo.toString();
                var sMinutesTo = minutesTo.toString();
                if (hoursTo < 10) sHoursTo = "0" + sHoursTo;
                if (minutesTo < 10) sMinutesTo = "0" + sMinutesTo;

                toFilter = toFilterArr[0] + ' ' + sHoursTo + ':' + sMinutesTo;

                if (fromFilter != "" && toFilter != "") {
                    if (fromFilter > toFilter) {
                        alert("To date should be greater than From date.");
                        return false;
                    }
                    else if ((Math.floor((Date.parse(toFilter) - Date.parse(fromFilter)) / 86400000)) > 30) {
                        alert("Date range should be within a month.");
                        return false;
                    }
                    //else {
                    //    FailedCancellation.filterFailedCancellation(fromFilter, toFilter);
                    //}
                }
                else {
                    alert("Please add both Start and End date.");
                    return false;
                }
            }
            catch (err) {
                alert('Error' + err.message);
            }

        });
    </script>
    <script>

    </script>


</body>
</html>
