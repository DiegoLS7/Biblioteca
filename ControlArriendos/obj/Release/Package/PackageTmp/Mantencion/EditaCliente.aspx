<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditaCliente.aspx.cs" Inherits="ControlArriendos.Mantencion.EditaCliente" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
        <%--    *************************    Mostrar fecha   *************************************    --%>
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
     <script>
         $(document).ready(function () {
             $('#<%=txt_fecha.ClientID%>').datepicker({
                 dateFormat: 'dd-mm-yy',
                 minDate: new Date('2000/01/01'),
                 maxDate: "+0m +0d",
                 changeMonth: true,
                 changeYear: true
             }).val();
         });
      </script>
    <%--    *************************    Funsion solo Letras Jquery    *************************************    --%>
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
    <%--    *************************    Funsion solo Numeros Jquery    *************************************    --%>
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
    
    <asp:Panel ID="PanelPrincipal" runat="server" Width="1700px">
    <div  align="center" style="width: 1700px">
       <br />
        <br />
     <h2 class="Titulos">Modificación Clientes </h2>
        <br />
                <table  class="Tabla_Estructura">
            <center>
                <tr align="center" height:"17px">
       <td class="auto-style20" style="width: 153px" >
           <asp:Label ID="Label5" runat="server" CssClass="Texto" Text="RUT :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 277px" >
           <asp:TextBox ID="txtRut" runat="server" Height="16px" Width="138px" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>
           <asp:Label ID="Label7" runat="server" Height="22px" Text="  -  " Font-Size="10pt"></asp:Label>
           <asp:TextBox ID="txtDigito" runat="server" Height="16px" Width="25px" CssClass="textbox" ></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label6" runat="server" CssClass="Texto" Text="NOMBRE :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 324px"><asp:TextBox ID="txtNombre" MaxLength="80" required="active" runat="server" Height="16px" Width="170px" onkeypress="return soloLetras(event)" CssClass="textbox"></asp:TextBox>                                  
        </td>             
    </tr>
       <tr align="center">
       <td class="auto-style20" style="width: 153px" >
           <asp:Label ID="Label1" runat="server" CssClass="Texto" Text="DIRECCION :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 277px" >
           <asp:TextBox ID="txtDireccion" MaxLength="100" required="active" runat="server" Height="16px" Width="182px" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label3" runat="server" CssClass="Texto" Text="COMUNA :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 324px">
                                            
           <asp:DropDownList ID="DropComuna" TextDefault="Seleccione" runat="server" Height="25px" Width="182px" CssClass="textbox">
           </asp:DropDownList>
                                            
        </td>             
    </tr>
               <tr align="center">
       <td class="auto-style20" style="width: 153px" >
           <asp:Label ID="Label2" runat="server" CssClass="Texto" Text="CORREO ELECTRONICO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 277px" >
           <asp:TextBox ID="txtCorreo" MaxLength="50" required="active" runat="server" Height="16px" Width="182px" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label8" runat="server" CssClass="Texto" Text="CIUDAD :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 324px">
           <asp:DropDownList ID="DropCiudad" TextDefault="Seleccione" runat="server" Height="25px" Width="182px" CssClass="textbox">
           </asp:DropDownList>                         
        </td>             
    </tr>
               <tr align="center">
       <td class="auto-style20" style="width: 153px" >
           <asp:Label ID="Label4" runat="server" CssClass="Texto" Text="TELEFONO FIJO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 277px" >
           <asp:TextBox ID="txtFijo" required="active" MaxLength="20" runat="server" Height="16px" Width="182px" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label9" runat="server" CssClass="Texto" Text="ESTADO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 324px">
           <asp:DropDownList ID="DropEstado" TextDefault="Seleccione" runat="server" Height="25px" Width="180px" CssClass="textbox">
           </asp:DropDownList>                         
        </td>             
    </tr>
               <tr align="center">
       <td class="auto-style20" style="width: 153px" >
           <asp:Label ID="Label10" runat="server" CssClass="Texto" Text="TELEFONO MOVIL :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 277px" >
           <asp:TextBox ID="txtMovil" required="active" MaxLength="20" runat="server" Height="16px" Width="182px" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label11" runat="server" CssClass="Texto" Text="FECHA INGRESO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style20" style="width: 324px">
             <asp:TextBox ID="txt_fecha" runat="server"  Enabled="True" CssClass="textbox" style=" text-align: center" Height="16px" Width="166px"></asp:TextBox>                 
        </td>             
    </tr>
       <tr align="center">
       <td class="auto-style20"  style="width: 153px" >
           
        </td>
       <td class="auto-style20"  style="width: 277px" >
           <asp:Button ID="BtnModificar" runat="server" Text="MODIFICAR" CssClass="BotonAzul" OnClick="ModificarCliente_Click" />
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:HyperLink ID="HyperLink1" runat="server" Text="VOLVER" ControlStyle-CssClass="BotonRojo" NavigateUrl="Clientes.aspx" Width="83px" />
           <ControlStyle CssClass="BotonRojo" ></ControlStyle>
           </asp:HyperLink>
        </td>
       <td class="auto-style20"  style="width: 324px">
                                
        </td>             
    </tr>
         </center>
         </table>

        <br />
        </div>
     <br />
     <br />
    </asp:Panel> 
</asp:Content>
