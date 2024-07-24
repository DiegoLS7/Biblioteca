<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevoEnsamble.aspx.cs" Inherits="ControlArriendos.Mantencion.NuevoEnsamble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%--    *************************    Mostrar fecha   *************************************    --%>
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
     <script>
         $(document).ready(function () {
             $('#<%=txt_fecha.ClientID%>').datepicker({
                 dateFormat: 'dd-mm-yy',
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
    <style type="text/css">
 
#tabla{	border: solid 1px #333;	width: 300px; }
.fila-base{ display: none; } /* fila base oculta */
 
        .textbox {}
 
        .auto-style2 {
            width: 84px;
        }
 
    </style>
<head >
    <title></title>
    	
</head>
<body>

    <div  align="center" style="width: 1700px; height: 70px;">
       <br />
        <br />
     <h2 class="Titulos">Nuevo Ensamble</h2>
       <br />
     </div>
     <br />
     <br />
    <asp:Panel ID="PanelCabecera" runat="server" Width="1697px" Height="214px" style="margin-bottom: 0px">
        <div  align="center" style="width: 1700px">
        <asp:Label ID="Label2" runat="server" CssClass="Texto" Text="CABECERA" Font-Size="10pt"></asp:Label>
            <table  class="Tabla_Estructura">
            <center>
                 <tr align="center">
       <td class="auto-style14" >
           <asp:Label ID="Label5" runat="server" CssClass="Texto" Text="NUMERO HOJA ENSAMBLE :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtNhoja" runat="server" required="active" Height="16px" Width="130px" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label6" runat="server" CssClass="Texto" Text="CLIENTE :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29"><asp:DropDownList ID="DropRutCliente" TextDefault="Seleccione" runat="server" CssClass="Texto" Height="25px" Width="140px">
                    </asp:DropDownList></td>             
    </tr>
    <caption>
            &nbsp;
        </caption>
                <tr align="center">
       <td class="auto-style14" >
           <asp:Label ID="Label1" runat="server" CssClass="Texto" Text="TIPO EQUIPO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
         <asp:DropDownList ID="DropTipoEquipo" TextDefault="Seleccione"  runat="server" Height="25px" Width="140px"  CssClass="Texto">
         </asp:DropDownList>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label3" runat="server" CssClass="Texto" Text="TECNICO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29">
                                            
          <asp:DropDownList ID="DropTecnico" TextDefault="Seleccione" runat="server" CssClass="Texto" Height="25px" Width="140px">
                    </asp:DropDownList>
                                            
        </td>             
    </tr>
               
               <tr align="center">
       <td class="auto-style14" >
           <asp:Label ID="Label10" runat="server" CssClass="Texto" Text="VENTA :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtVenta"  runat="server" Height="53px" Width="130px" MaxLength="50" TextMode="MultiLine" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label11" runat="server" CssClass="Texto" Text="FECHA INGRESO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29">
              <asp:TextBox ID="txt_fecha" runat="server"  Height="16px" Width="130px" Enabled="True" CssClass="textbox" style=" text-align: center"></asp:TextBox>    
        </td>             
    </tr>

               <tr align="center">
                     <td class="auto-style12" >
                        <asp:TextBox ID="txtEquipo" runat="server" onkeypress="return solonumeros(event)" Height="16px" Width="130px" CssClass="textbox"></asp:TextBox>
                     </td>
               </tr>

         </center>
         </table>
</div>
    </asp:Panel>
    <asp:Panel ID="PanelDetalle" runat="server" Width="1697px" Height="521px">
        <div  align="center" style="width: 1700px; height: 520px;">
            
           <asp:Label ID="Label4" runat="server" CssClass="Texto" Text="DETALLE" Font-Size="10pt"></asp:Label>
            
            <table id="tabla" style="width: 636px" >
    <center>
    
      <tr align="center">
          <td class="auto-style2">
              <asp:Label ID="Label7" runat="server" CssClass="Texto" Font-Size="10pt" Text="Numero"></asp:Label>
          </td>
          <td class="auto-style12"><asp:Label ID="Label8" runat="server" CssClass="Texto" Font-Size="10pt" Text="Hardware"></asp:Label></td>
          <td class="auto-style20"><asp:Label ID="Label9" runat="server" CssClass="Texto" Font-Size="10pt" Text="Serie"></asp:Label></td>
          <td class="auto-style29"><asp:Label ID="Label12" runat="server" CssClass="Texto" Font-Size="10pt" Text="Marca"></asp:Label></td>
          <td class="auto-style29"><asp:Label ID="Label13" runat="server" CssClass="Texto" Font-Size="10pt" Text="Modelo"></asp:Label></td>
          <td class="auto-style29"><asp:Label ID="Label14" runat="server" CssClass="Texto" Font-Size="10pt" Text="Comentarios"></asp:Label></td>
          <td class="auto-style25"></td>
        </tr>
        <caption>
            &nbsp;
        </caption>
        
      <tr>
               <td class="auto-style2">
              <asp:TextBox ID="txtNumero" name="txtNumero" runat="server"></asp:TextBox>
          </td>
          <td class="auto-style12">
              <asp:DropDownList ID="DropHardware" name="DropHardware" runat="server" Class="ComboBox" Height="17px" Width="133px">
              </asp:DropDownList>
          </td>
          <td class="auto-style20">
              <asp:TextBox ID="txtMarca" name="txtMarca" MaxLength="30" runat="server"></asp:TextBox>
          </td>
          <td class="auto-style29">
              <asp:TextBox ID="txtModelo" name="txtModelo" MaxLength="30" runat="server"></asp:TextBox>
          </td>
          <td class="auto-style29">
              <asp:TextBox ID="txtSerie" name="txtSerie" MaxLength="30" runat="server"></asp:TextBox>
          </td>
            <td class="auto-style29"><asp:TextBox ID="txtObservaciones" name="txtObservaciones" MaxLength="500" TextMode="MultiLine" runat="server"></asp:TextBox></td>  
                <td  ><asp:Button ID="Button2" runat="server" CssClass="BotonAzul" Text="Agregar" OnClick="AgregarDetalle_Click"></asp:Button></td>
        </tr> 
        <caption>
            &nbsp;
        </caption>
       
        <tr >
            <td class="auto-style2"></td>

       <td colspan="6"><asp:GridView ID="dgvDetalle" runat="server" Width="760px"><EditRowStyle HorizontalAlign="Center" Width="100px" Height="30px" />
                    <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="30px"></RowStyle> <HeaderStyle />
                <RowStyle cssClass="Tabla_contenido" HorizontalAlign="Center" />
                <SelectedRowStyle cssClass="Tabla_contenido" /></asp:GridView>
       </td>
          </tr>  
        <tr align="center">
          <td class="auto-style2"></td>
          <td class="auto-style12"></td>
          <td class="auto-style20"></td>
          <td class="auto-style29"><asp:Button ID="BtnGuardar" runat="server" class="BotonAzul" Text="Guardar" OnClick="GuardarEnsamble_Click"></asp:Button></td>
          <td class="auto-style29"><asp:Button ID="BtnVolver" runat="server" class="BotonRojo" Text="Volver" OnClick="Volver_Click"></asp:Button></td>
          <td class="auto-style25"></td>
            <td></td>
        </tr>
 </center>
    </table>
    </div>
    </asp:Panel>



</body>
</asp:Content>
