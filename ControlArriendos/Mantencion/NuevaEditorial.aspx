<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevaEditorial.aspx.cs" Inherits="ControlArriendos.Mantencion.NuevaEditorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script>
        function soloLetras(e) {
            key = e.keyCode || e.which;
            tecla = String.fromCharCode(key).toLowerCase();
            letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
            especiales = "8-37-39-46";

            tecla_especial = false
            for (var i in especiales) {
                if (key == especiales[i]) {
                    tecla_especial = true;
                    break;
                }
            }

            if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                return false;
            }
        }
</script>

    <script>
        function solonumeros(e) {
            key = e.keyCode || e.which;
            tecla = String.fromCharCode(key).toLowerCase();
            letras = "1234567890";
            especiales = "8-37-39-46";

            tecla_especial = false
            for (var i in especiales) {
                if (key == especiales[i]) {
                    tecla_especial = true;
                    break;
                }
            }

            if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                return false;
            }
        }
</script>    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:Panel ID="PanelPrincipal" runat="server" Width="1700px" Height="415px" 
        CssClass="content-container" >
        <body>

        <div class="contenedorNuevoLibro" align="center" style="width: 800px; background-color: #eeeeee; color: Black; padding-left: 120px; padding-right: 120px; border: 3.5px solid #999999; " >
            <br />
            <br />
            <h2 class="Titulos">Nueva Editorial</h2>
            <br />
            <table class="Tabla_Estructura">
                <center>
                    <tr align="center">
                        <td class="auto-style14" style="height: 44px; Width: 160px">
                            <asp:Label ID="Label5" runat="server" CssClass="Texto" Font-Size="16pt" 
                                Text="CODIGO "></asp:Label>
                        </td>
                        <td class="auto-style12" style="height: 44px; Width: 160px"">
                            <asp:TextBox ID="txtCodigo" runat="server" ReadOnly="True" CssClass="textbox" Height="24px" 
                                MaxLength="18" required="active" Width="140px" 
                                onclick="eliminarTextoPredefinido()" OnTextChanged="txtCodigo_TextChanged"></asp:TextBox>
                        </td>

                        <td class="auto-style14" style="height: 44px; Width: 200px">
                            <asp:Label ID="Label10" runat="server" CssClass="Texto" Font-Size="16pt" 
                                Text="NOMBRE "></asp:Label>
                        </td>
                        <td class="auto-style12" style="height: 44px">
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="textbox" Height="24px" 
                                MaxLength="18" required="active" Width="140px" ForeColor="Black" ></asp:TextBox>
                        </td>  

                    </tr>
                    <tr align="center">
                        <td class="auto-style14" style="height: 44px; Width: 200px">
                            <asp:Label ID="Label2" runat="server" CssClass="Texto" Font-Size="16pt" 
                                Text="DIRECCION "></asp:Label>
                        </td>
                        <td class="auto-style12" style="height: 44px">
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="textbox" Height="24px" 
                                MaxLength="18" required="active" Width="140px" ForeColor="Black" ></asp:TextBox>
                        </td>     
                            <td>
                                <asp:Label ID="Label1" runat="server" Font-Size="16pt" ForeColor="Black" Text="TELEFONO" style="padding-left: 20px;"></asp:Label>

                            </td>
                                <td class="auto-style12" style="height: 44px">
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="textbox" onkeypress="return solonumeros(event)" Height="24px" 
                                MaxLength="18" required="active" Width="140px" ForeColor="Black" ></asp:TextBox>
                        </td> 
                    </tr>
                   <tr align="center">
                        <td class="auto-style14" style="height: 44px; Width: 200px">
                            <asp:Label ID="Label8" runat="server" CssClass="Texto" Font-Size="16pt" 
                                Text="FAX "></asp:Label>
                        </td>
                        <td class="auto-style12" style="height: 44px">
                            <asp:TextBox ID="txtFax" runat="server" onkeypress="return solonumeros(event)" CssClass="textbox" Height="24px" 
                                MaxLength="18" required="active" Width="140px" ForeColor="Black" ></asp:TextBox>
                        </td>     
                            <td>
                                <asp:Label ID="Label9" runat="server" Font-Size="18pt" ForeColor="Black" Text="CIUDAD" style="padding-left: 20px;"></asp:Label>

                            </td>
                            <td  style="border-color: Black">   
                                <asp:DropDownList ID="DropDownCiudad" AppendDataBoundItems="true" runat="server" CssClass="textbox" Font-Size="13pt" ForeColor="Black" Height="30px" Width="140px" OnSelectedIndexChanged="DropDownCiudad_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="Seleccione" Value="" />
                                </asp:DropDownList>
                    </tr>
                    <tr align="center">
                        <td class="auto-style14" style="height: 44px; Width: 180px" >
                            <asp:Label ID="Label4" runat="server" CssClass="Texto" Font-Size="18pt" 
                                Text="COMUNA "></asp:Label>
                        </td>
                            <td  style="border-color: Black">   
                                <asp:DropDownList ID="DropDownComuna" AppendDataBoundItems="true" runat="server" CssClass="textbox" Font-Size="13pt" ForeColor="Black" Height="30px" Width="140px"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                   <asp:ListItem Text="Seleccione" Value="" />
                                </asp:DropDownList>
                            </td>
                    </tr>
                    </tr>
                    <tr align="center">
                        <td class="auto-style14"></td>
                        <td class="auto-style12">
                            <asp:Button ID="BtnAgregar" runat="server" CssClass="BotonAzul" ControlStyle-CssClass="BotonAzul" 
                                OnClick="AgregarEditorial_Click" Text="AGREGAR" type="submit" style="padding: 6.2px;" />
                        </td>
                        <td class="auto-style20" style="width: 160px">
                            <asp:HyperLink ID="HyperLink1" runat="server" ControlStyle-CssClass="BotonRojo" 
                                NavigateUrl="Editoriales.aspx" Text="VOLVER" style="padding: 6.2px;" />
                            <controlstyle cssclass="BotonRojo"></controlstyle>
                            </asp:hyperlink>
                        </td>
                    <tr>
                        <td class="auto-style29" style="height: 22.5px"></td>
                    </tr>
                    </tr>
                </center>
            </table>
        </div>
        <br />
        </body>

     </asp:Panel> 

</asp:Content>
