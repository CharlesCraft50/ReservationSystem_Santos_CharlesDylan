<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="output.aspx.cs" Inherits="ReservationSystem_Santos_CharlesDylan.output" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reservation Confirmation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <style>
        body {
            background-color: #728370;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="text-center my-4">Reservation Confirmation</h1>
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Guest Information</h5>
                            <p class="card-text">
                                <strong>Full Name:</strong> <asp:Label ID="fullNameValue" runat="server" CssClass="form-control"></asp:Label><br />
                                <strong>Address:</strong> <asp:Label ID="addressValue" runat="server" CssClass="form-control"></asp:Label><br />
                                <strong>ID Type:</strong> <asp:Label ID="idTypeValue" runat="server" CssClass="form-control"></asp:Label><br />
                                <strong>ID Number:</strong> <asp:Label ID="idNumberValue" runat="server" CssClass="form-control"></asp:Label><br />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Reservation Information</h5>
                            <p class="card-text">
                                <strong>Room Number:</strong> <asp:Label ID="roomNumberValue" runat="server" CssClass="form-control"></asp:Label><br />
                                <strong>Date In:</strong> <asp:Label ID="dateInValue" runat="server" CssClass="form-control"></asp:Label><br />
                                <strong>Date Out:</strong> <asp:Label ID="dateOutValue" runat="server" CssClass="form-control"></asp:Label><br />
                                <strong>Rate/Period:</strong> <asp:Label ID="ratePeriodValue" runat="server" CssClass="form-control"></asp:Label><br />
                                <strong>Total Charges:</strong> <asp:Label ID="totalChargesValue" runat="server" CssClass="form-control" Text='<%# String.Format("{0:C}", Eval("totalChargesValue")) %>'></asp:Label><br />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="backToFormButton" runat="server" Text="Back to Form" CssClass="btn btn-primary" OnClick="backToFormButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
