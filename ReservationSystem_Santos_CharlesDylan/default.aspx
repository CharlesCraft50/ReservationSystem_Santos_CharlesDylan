<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ReservationSystem_Santos_CharlesDylan._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservation Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <style>
        body {
            padding: 2rem;
            background-color: #90b493;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Reservation Form</h1>
        <form runat="server">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <asp:TextBox ID="fullName" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <asp:TextBox ID="address" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="idType">ID Type</label>
                        <asp:DropDownList ID="idType" runat="server" class="form-control">
                            <asp:ListItem Value="Passport">Passport</asp:ListItem>
                            <asp:ListItem Value="Driver's License">Driver's License</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="idNumber">ID Number</label>
                        <asp:TextBox ID="idNumber" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="roomNumber">Room Number</label>
                        <asp:TextBox ID="roomNumber" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="dateIn">Date In</label>
                        <asp:TextBox ID="dateIn" runat="server" AutoPostBack="true" class="form-control datepicker" OnTextChanged="dateIn_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="dateOut">Date Out</label>
                        <asp:TextBox ID="dateOut" runat="server" AutoPostBack="true" class="form-control datepicker" OnTextChanged="dateOut_TextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ratePeriod">Rate/Period</label>
                        <asp:TextBox ID="ratePeriod" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="ratePeriod_TextChanged"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="totalCharges">Total Charges:</label>
                    <asp:TextBox ID="totalCharges" runat="server" class="form-control" ReadOnly="true" Text='<%# String.Format("{0:C}", Eval("totalCharges")) %>'></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="errorMessage" runat="server" class="text-danger"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="checkoutButton" runat="server" Text="Checkout" CssClass="btn btn-success" OnClick="checkoutButton_Click" />
                    </div>
                </div>
                <div class="col-md-6" style="margin-top: 10px;">
                    <div class="form-group">
                        <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="cancelButton_Click" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
