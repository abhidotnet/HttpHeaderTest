<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UILayer._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function callwebapi()
    {
        console.log(document.getElementById("Fname").value);
        console.log(document.getElementById("Lname").value);
        class nemo {
            constructor(Id, FirstName, LastName)
            {
                this.Id = -1;
                this.FirstName = document.getElementById("Fname").value;
                this.LastName = document.getElementById("Lname").value;
            }
        }
        const instanceofnemo = new nemo();
        console.log(JSON.stringify(instanceofnemo));
        const uri = "https://localhost:44396/api/values";
        var myHeaders = new Headers();
        myHeaders.append('Accept', 'application/json');
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('SecretToken', 'MySecretToken');
        myHeaders.append('Authentication', 'Bearer: hellofools');

        fetch(uri, {
            method: 'POST',
            mode: 'no-cors',
            headers: myHeaders,
            body: JSON.stringify(instanceofnemo)
        })
            .then(response => { console.log(response.text()); console.log('help help'); })
            .catch(error => console.error('Some Failure Occurred.', error));
    }
</script>
    <div class="jumbotron">
        <h1>Trying out headers</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>
    <div>
        <div class="table-bordered">
            <div class="row">
                <div class="col-lg-2">First Name</div>
                <div class="col-lg-2"><asp:TextBox runat="server" ClientIDMode="Static" ID="Fname"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-lg-2">Last Name</div>
                <div class="col-lg-2"><asp:TextBox runat="server" ClientIDMode="Static" ID="Lname"></asp:TextBox></div>
            </div>

            <div class="row">
                <div class="col-lg-2">
                    <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" 
                        OnClientClick="javascript:callwebapi();"
                        CssClass="btn-primary active" Text="Click  Me"/>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
