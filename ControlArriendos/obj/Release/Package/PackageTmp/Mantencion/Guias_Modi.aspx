<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Guias_Modi.aspx.cs" Inherits="ControlArriendos.Mantencion.Guias_Modi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
     <script>
         $(document).ready(function () {
             $('#<%=TextBox1.ClientID%>').datepicker({
                 dateFormat: 'dd-mm-yy',
                 minDate: new Date('2014/01/01'),
                 maxDate: "+0m +0d",
                 changeMonth: true,
                 changeYear: true
             }).val();
         });
      </script>

     <div id="Div1" style="display:block">
            <%--<h2 style="margin-left:200px;margin-top:30px" class="Titulos" id="titulo"></h2>--%>
         <br />
         <br />
         <asp:Label ID="lbltitulo" style="margin-left:530px" runat="server" Text="Detalle Guía Nro " CssClass="Titulos"  ></asp:Label> 
                  
            <table style="width:100%;text-align:left">
                <tr>
                    <td style="width: 256px; height: 21px"></td>
                    <td style="width: 106px; height: 21px;">
                        <asp:Label ID="lblRutCliente" runat="server" Text="Cliente :"></asp:Label>
                    </td>
                    <td style="width: 258px; height: 21px;">
                        <asp:TextBox ID="tbxRutCliente" required="active" runat="server" Width="245px" Height="18px" CssClass="textbox" ></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 21px;">
                        <asp:Label ID="lblSisOperativo" runat="server" Text="Sistema Operativo : "></asp:Label>
                    </td>
                    <td style="width: 248px; height: 21px;">
                         <asp:TextBox ID="tbxSisOperativo"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 21px;width: 250px;" ></td>
                </tr>
                <tr>
                    <td style="width: 256px; height: 22px"></td>
                    <td style="width: 106px; height: 22px">
                        <asp:Label ID="lblNomUsuario" runat="server" Text="Nombre usuario : "></asp:Label>  
                    </td>
                    <td  style="width: 258px; height: 22px;">
                        <asp:TextBox ID="tbxNomUsuario"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 22px">
                        <asp:Label ID="lblAntivirus" runat="server" Text="Antivirus : "></asp:Label> 
                    </td>
                    <td style="width: 248px; height: 22px;">
                         <asp:TextBox ID="tbxAntivirus" runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 22px"></td>
                </tr>
                <tr>
                    <td style="width: 256px; height: 21px">&nbsp;</td>
                    <td style="width: 106px">
                        <asp:Label ID="lblCueServidor" runat="server" Text="Cuenta Servidor : "></asp:Label> 
                    </td>
                    <td  style="width: 258px">
                         <asp:TextBox ID="tbxCueServidor" runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 21px">
                        <asp:Label ID="lblOffice" runat="server" Text="Office : "></asp:Label>
                    </td>
                    <td style="width: 248px">
                        <asp:TextBox ID="tbxOffice"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 256px; height: 20px;"></td>
                    <td style="width: 106px; height: 21px">
                        <asp:Label ID="Label8" runat="server" Text="Pass Servidor : "></asp:Label>     
                    </td>
                    <td  style="width: 258px">
                        <asp:TextBox ID="tbxPassServidor"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 21px">
                        <asp:Label ID="lblIdTeamviewer" runat="server" Text="Id Teamviewer : "></asp:Label>
                    </td>
                    <td style="width: 248px">
                         <asp:TextBox ID="tbxIdTeamviewer" runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 20px"></td>
                </tr>
                <tr>
                    <td style="width: 256px">&nbsp;</td>
                    <td style="width: 106px; height: 21px">
                        <asp:Label ID="lblNumSerie" runat="server" Text="Numero Serie : "></asp:Label>                     
                    </td>
                    <td  style="width: 258px">
                        <asp:TextBox ID="tbxNumSerie" type="number"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 21px">
                        <asp:Label ID="Label11" runat="server" Text="Pass Teamviewer : "></asp:Label>
                        
                    </td>
                    <td style="width: 248px">
                        <asp:TextBox ID="tbxPassTeamviewer"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 256px; height: 27px;"></td>
                    <td style="width: 106px; height: 21px">
                        <asp:Label ID="lblSisAsignados" runat="server" Text="Sistemas asignados : "></asp:Label>  
                    </td>
                    <td  style="width: 258px">
                         <asp:TextBox ID="tbxSisAsignados"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 21px">
                        <asp:Label ID="Label20" runat="server" Text="Dirreción IP : "></asp:Label>    
                    </td>
                    <td style="width: 248px">
                        <asp:TextBox ID="tbxDirIp"  runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="height: 27px"> &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 256px; height: 27px;"></td>
                    <td style="width: 106px; height: 21px">
                        <asp:Label ID="lblSucursal" runat="server" Text="Sucursal : "></asp:Label>               
                    </td>
                    <td style="width: 258px">
                        <asp:DropDownList ID="DropSucursal" runat="server" Height="29px" Width="252px" CssClass="textbox">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 111px; height: 21px">
                        <asp:Label ID="lblEstado" runat="server" Text="Estado : "></asp:Label> 
                    </td>
                    <td style="width: 248px">
                         <asp:DropDownList ID="DropEstado" runat="server" Height="29px" Width="254px" CssClass="textbox">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 27px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 256px">&nbsp;</td>
                    <td style="width: 106px; height: 21px">
                        <asp:Label ID="lblNomEquipo" runat="server" Text="Nombre equipo :     "></asp:Label>       
                    </td>
                    <td  style="width: 258px">
                         <asp:TextBox ID="tbxNomEquipo" required="active" runat="server" Width="245px" Height="18px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 21px"> 
                        <asp:Label ID="lblUsuResponsable" runat="server" Text="Usuario Responsable : "></asp:Label>
                    </td>
                    <td style="width: 248px">
                        <asp:TextBox ID="tbxUsuResponsable" required="active" runat="server" Width="242px" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                 </tr>
                <tr>
                    <td style="width: 256px; height: 94px;"></td>
                    <td style="width: 106px; height: 21px">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción : "></asp:Label>
                    </td>
                    <td style="width: 258px">
                        <asp:TextBox ID="tbxDescripcion" required="active" runat="server" Height="61px" MaxLength="200" TextMode="MultiLine" Width="245px" Font-Overline="False" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td style="width: 111px; height: 21px">
                         <asp:Label ID="Label1" runat="server" Text="Tipo de Equipo : "></asp:Label>
                    </td>
                    <td style="width: 248px">
                          <asp:DropDownList ID="DropTipoEquipo" runat="server" Height="29px" Width="252px" CssClass="textbox">
                          </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 256px; height: 21px"></td>
                    <td style="height: 21px; width: 106px">
                         <asp:Label ID="lblObservaciones" runat="server" Text="Observaciones : "></asp:Label>
                    </td> 
                    <td  style="width: 258px; height: 21px;">
                         <asp:TextBox ID="tbxObservaciones" required="active" runat="server" Height="90px" MaxLength="200" TextMode="MultiLine" Width="245px" CssClass="textbox"></asp:TextBox>     
                     </td>
                    <td style="width: 111px; height: 21px">
                        <asp:Label ID="lblFecha" runat="server" Text="Fecha : "></asp:Label>
                    </td>
                    <td style="width: 248px; height: 21px;">
                        <!-- <div id="divTitle" runat="server">-->
                             <asp:TextBox ID="TextBox1" runat="server" Width="237px" type="text" CssClass="textbox"></asp:TextBox>
                             <!--   <input type ="text"  id="datepicker" name="Title" style="width: 239px" runat="server"/>
                          </div> -->
                             
                       <!--  <asp:TextBox ID="txt_fecha" runat="server" Width="180px" style="margin-top: 0px" name="txt_fecha" MaxLength="10"></asp:TextBox>-->
                    </td>
                    <td style="height: 21px"></td>
                </tr>
                </table>
                    <table align="center">
                        <tr>
                            <td style="width: 260px"></td>
                            <td style="width: 102px"></td>
                            <td colspan="2" style="text-align:center;padding-top:20px; width: 724px;">
                               <asp:LinkButton CssClass="BotonRojo" href="Guias.aspx"  ID="btnVolver" style="padding-top:5px" runat="server" Height="19px" Width="54px" >Volver</asp:LinkButton>
                               <asp:Button ID="btnModificar" runat="server" style="margin-left:40px" Text="Modificar" CssClass="BotonAzul" OnClick="btnModificar_Click" Height="30px"  />
                               <br />
                               <asp:LinkButton ID="LbtnCancelar" cssclass="BotonRojo" runat="server" style="padding-top:5px" Text="Cancelar" OnClick="btnCancelar_Click" Height="19px" />
                               <asp:Button ID="btnGuasrdarC" runat="server" cssClass="BotonAzul" style="margin-left:50px;margin-top:10px" Text="Guardar Cambios" OnClick="btnGuasrdarC_Click" Height="30px" />
                           </td>
                           <td style="width: 43px"></td>
                           <td  style="width: 260px">
                               <asp:ImageButton style="float:right" ID="imgEliminar" runat="server"  Width="92px" Height="87px" OnClientClick="return confirm('Desea eliminar el registro?')" ImageUrl="~/Imagenes/iconos/Borrar.png" OnClick="imgEliminar_Click" />
                           </td>
                        </tr>
                    </table>
            <br />
                 &nbsp;</div>
</asp:Content>


