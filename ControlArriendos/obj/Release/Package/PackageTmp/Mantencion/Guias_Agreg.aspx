<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Guias_Agreg.aspx.cs" Inherits="ControlArriendos.Mantencion.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
     <script>
         $(document).ready(function () {
             $('#<%=txt_fecha.ClientID%>').datepicker({
                 dateFormat: 'dd-mm-yy',
                 minDate: new Date('2014/01/01'),
                 maxDate: "+0m +0d",
                 changeMonth: true,
                 changeYear: true
             }).val();
         });
  
      </script>

    <div id="RegistrarGuia" style="display:block ;text-align:center">
        <br />
        <br />
            <h2 class="Titulos" style="margin-left:auto;margin-right:auto">&nbsp;Ingreso Guías </h2>
              
            <table style="width:100%;text-align:left; height: 473px;">
                 <tr>
                    <td style="width: 313px; height: 28px"></td>
                    <td style="width: 119px; height: 28px">
                        <asp:Label ID="Label3" runat="server" Text="Nro. Guía :  "></asp:Label>
                    </td>
                     <td style="width: 249px; height: 28px">
                         <asp:TextBox ID="txtNro" runat="server" required="active"  title="Debe Ingresar Número DIM para guía de Arriendo" Width="218px" Height="17px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 139px; height: 28px">
                         <asp:Label ID="lblNomUsu" runat="server" Text="Nombre usuario : "></asp:Label>
                    </td>
                    <td style="height: 28px; width: 194px;">
                          <asp:TextBox ID="tbxNomUsuario" title="Se necesita un nombre"  Height="17px"  runat="server" Width="218px"  CssClass="textbox"></asp:TextBox>
                    </td>
                     <td style="height: 28px"></td>
                </tr>
                <tr>
                    <td style="width: 313px; height: 41px"></td>
                    <td style="width: 119px; height: 41px">
                        <asp:Label ID="lblRutCliente" runat="server" Text="Cliente :   "></asp:Label>
                        </td>
                    <td style="width: 249px; height: 41px">
                        <asp:DropDownList ID="DropRutCliente" runat="server" required="active"  Height="32px" Width="227px"  CssClass="textbox" >
                        </asp:DropDownList>
                    </td>
                    <td style="width: 139px; height: 41px">
                      <asp:Label ID="lblSistemaOper" runat="server" Text="Sistema Operativo : "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 41px">
                         <asp:TextBox ID="tbxSistemaOper"  runat="server" Width="218px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 41px"></td>
                </tr>
                <tr>
                    <td style="height: 20px; width: 313px;"></td>
                    <td style="width: 119px; height: 28px">
                        <asp:Label ID="lblCuntServ" runat="server" Text="Cuenta Servidor : "></asp:Label>
                        </td>
                    <td style="width: 249px; height: 28px">
                        <asp:TextBox ID="tbxCuenServidor"  runat="server" Width="217px" Height="18px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 20px; width: 139px;">
                         <asp:Label ID="lblAntivirus" runat="server" Text="Antivirus : "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 28px">
                      <asp:TextBox ID="tbxAntivirus"  runat="server" Width="218px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 28px"></td>
                </tr>
                <tr>
                    <td style="width: 313px">&nbsp;</td>
                    <td style="width: 119px">
                        <asp:Label ID="Label7" runat="server" Text="Pass Servidor : "></asp:Label>
                    </td>
                    <td style="width: 249px; height: 28px">
                        <asp:TextBox ID="tbxPassServidor"   runat="server" Width="217px" Height="16px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 139px; height: 28px">
                        <asp:Label ID="lblOffice" runat="server" Text="Office : "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 28px">
                        <asp:TextBox ID="tbxoffice" runat="server" Width="218px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 28px"></td>
                </tr>
                <tr>
                    <td style="width: 313px; height: 20px;"></td>
                    <td style="width: 119px; height: 28px">
                        <asp:Label ID="lblNumSeri" runat="server" Text="Numero Serie : "></asp:Label>
                    </td>
                    <td style="width: 249px; height: 28px">
                        <asp:TextBox ID="tbxNumSerie" type="number"   runat="server" Width="217px" Height="19px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 139px; height: 28px">
                        <asp:Label ID="lblIdteamviewer" runat="server" Text="Id Teamviewer : "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 28px">
                          <asp:TextBox ID="tbxIdTeamviewer"  runat="server" Width="218px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 28px"></td>
                </tr>
                <tr>
                    <td style="width: 313px">&nbsp;</td>
                    <td style="width: 119px; height: 28px">
                        <asp:Label ID="lblNomSisAsig" runat="server" Text="Sistemas asignados : "></asp:Label>
                        </td>
                    <td style="width: 249px; height: 28px">
                        <asp:TextBox ID="tbxSisAsignados"  runat="server" Width="217px" Height="16px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 139px">
                        <asp:Label ID="lblpassTeamVw" runat="server" Text="Pass Teamviewer : "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 28px">
                      <asp:TextBox ID="tbxPassTeamviewer"   runat="server" Width="218px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 28px"></td>
                </tr>
                <tr>
                    <td style="width: 313px; height: 41px;"></td>
                    <td style="width: 119px; height: 41px">
                        <asp:Label ID="lblSucursal" runat="server" Text="Sucursal : "></asp:Label>
                        </td>
                    <td style="width: 249px; height: 41px">
                        <asp:DropDownList ID="DropSucursal" required="active"  runat="server" Height="32px" Width="223px"  CssClass="textbox">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 139px; height: 31px">
                          <asp:Label ID="lblDirecIp" runat="server" Text="Dirreción IP : "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 31px">
                        <asp:TextBox ID="tbxDirrecionIp"  runat="server" Width="218px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 31px"></td>
                </tr>
                <tr>
                    <td style="width: 313px; height: 41px;"></td>
                    <td style="width: 119px; height: 31px">
                        <asp:Label ID="lblNomequi" runat="server" Text="Nombre equipo : "></asp:Label>
                        </td>
                    <td style="width: 249px; height: 31px">
                        <asp:TextBox ID="tbxNomEquipo" runat="server" Width="214px" Height="19px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 139px; height: 41px">
                      <asp:Label ID="lblestado" runat="server" Text="Estado : "></asp:Label>
                        
                        </td>
                    <td style="width: 194px; height: 41px">
                        <asp:DropDownList ID="DropEstado"  required="active" runat="server" Height="32px" Width="224px"  CssClass="textbox">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 31px"></td>
                </tr>
                <tr>
                    <td style="width: 313px">&nbsp;</td>
                    <td style="width: 119px; height: 28px">
                        <asp:Label ID="lbldescripcion"  runat="server" Text="Descripción : "></asp:Label>
                        <br />
                        </td>
                    <td style="width: 249px; height: 28px">
                        <asp:TextBox ID="tbxDescripcion"  runat="server" Height="66px" MaxLength="200" TextMode="MultiLine" Width="217px"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 139px; height: 28px">
                        <asp:Label ID="lblFecha" runat="server" Text="Fecha : "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 28px">
                           <asp:TextBox ID="txt_fecha" runat="server" Width="218px" Enabled="True"  CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 28px"></td>
                </tr>
                <tr>
                    <td style="width: 313px; height: 27px;"></td>
                    <td style="width: 119px; height: 28px">
                     
                           <asp:Label ID="Label1" runat="server"  Text="Observaciones : "></asp:Label>
                        </td>
                    <td style="width: 249px; height: 28px">
                       
                         <asp:TextBox ID="tbxobservaciones" runat="server" Height="67px" required="active"  MaxLength="200" TextMode="MultiLine" Width="217px"  CssClass="textbox"></asp:TextBox> 
                    </td>
                    <td style="height: 27px; width: 139px;">
                          <asp:Label ID="lblusuarioResp" runat="server" Text="Usuario Responsable : "></asp:Label>
         
                         
                    </td>
                    <td style="width: 194px" >
                       <asp:TextBox ID="tbxUsrResponsable"   runat="server" Height="16px" Width="218px"  CssClass="textbox"></asp:TextBox>
                       
                        
                    </td>
                    <td style="height: 28px"></td>
                </tr>
                
                <tr>
                    <td style="width: 313px; height: 31px;"></td>
                    <td style="width: 119px; height: 31px">
                     
                        </td>
                    <td style="width: 249px; height: 31px">
                       
                        <br />
                        </td>
                    <td style="width: 139px; height: 31px">
                       <asp:Label ID="Label2" runat="server" Text="Tipo de Equipo: "></asp:Label>
                        </td>
                    <td style="width: 194px; height: 41px">
                       <asp:DropDownList ID="DropTipoEquipo" required="active"  runat="server" Height="32px" Width="225px"  CssClass="textbox">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 31px"></td>
                </tr>
             
                <tr>
                    <td style="width: 313px; height: 60px;"></td>
                    <td style="height: 60px; text-align:center" colspan="2">
                    <a href="Guias.aspx" class="BotonRojo" style="float:left">Volver</a>
                   
            
                        
                 <input id="Reset1" type="reset" value="Limpiar" style="float:right; margin-right:20px"  class="BtnGris" />
                    </td>
                    <td style="height: 60px; width: 139px;">
                             <asp:Button ID="ButtoningresarGuia" type="submit" style="float:left" runat="server" Text="Registrar" CssClass="BotonAzul" OnClick="ButtoningresarGuia_Click" />
                    </td>
                     <td style="height: 60px; width: 194px;"></td>
                     <td style="height: 60px"></td>
                </tr>
            </table>
                
            <br />
                 
            </div>
        
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
