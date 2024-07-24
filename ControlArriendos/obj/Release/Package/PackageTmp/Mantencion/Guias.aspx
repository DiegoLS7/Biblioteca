<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Guias.aspx.cs" Inherits="ControlArriendos.Guias" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     


<head >
    <title></title>
    	
</head>
<body>

    <div  align="center" style="width: 1700px">
       <br />
        <br />
     <h2 class="Titulos">Mantención de Guías </h2>
        <table class="Tabla_Estructura" style="width: 771px; height: 55px;">
            <tr>
                <td class="auto-style3" style="height: 38px; width: 169px;">
                    <asp:ImageButton ID="imgbtnAgregarGuia" OnClick="IngresarGuia_Click" runat="server" BorderColor="#BFBFBF" Height="57px" ImageUrl="~/Imagenes/Nuevo.jpg"  style="margin-left: 0px" Width="65px" />
                </td>
                <td class="auto-style14" style="height: 38px">
                    <asp:Label ID="lblNumGuia" runat="server" CssClass="Texto" Font-Size="10pt" Text="Num Guia"></asp:Label>
                </td>
                <td class="auto-style12" style="height: 38px">
                    <asp:TextBox ID="tbxNumGuia" runat="server" type="number" CssClass="textbox" Height="17px" onkeypress="return solonumeros(event)" Width="138px"></asp:TextBox>
                </td>
                <td class="auto-style20" style="height: 38px">
                    <asp:Label ID="lblCliente" runat="server" CssClass="Texto" Font-Size="10pt" Text="Cliente"></asp:Label>
                </td>
                <td class="auto-style29" style="height: 38px">
                    <asp:DropDownList ID="DropRutCliente" runat="server" AutoPostBack="True" CssClass="textbox" Height="29px" Width="140px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style29" style="height: 38px">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="BotonRojo2" Height="28px"  Text="Buscar" Width="72px" OnClick="btnBuscar_Click" />
                </td>
                <td class="auto-style25" style="height: 38px; width: 186px;">
                    <asp:Panel ID="pMsjGuia" runat="server" Height="36px" Width="165px">
                        <div id="loginmensaje">
                            <strong>Debe completar algun campo para buscar</strong>
                        </div>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="height: 10px; width: 169px;"></td>
                <td class="auto-style14" style="height: 10px">
                    <asp:Label ID="lblSucursal" runat="server" CssClass="Texto" Text="Sucursal" Font-Size="10pt"></asp:Label>
                </td>
                <td class="auto-style12" style="height: 10px">
                    <asp:DropDownList ID="DropSucursal" runat="server" AutoPostBack="True" CssClass="textbox" Height="29px"  Width="144px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style20" style="height: 10px">
                    <asp:Label ID="lblEstado" runat="server" CssClass="Texto" Text="Estado" Font-Size="10pt"></asp:Label>
                </td>
                <td class="auto-style29" style="height: 10px">
                    <asp:DropDownList ID="DropEstado" runat="server" AutoPostBack="True" CssClass="textbox" Height="29px" Width="140px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style29" style="height: 10px"></td>
                <td class="auto-style29" style="height: 10px; width: 186px"></td>
                <td class="auto-style25" style="height: 10px"></td>
            </tr>
            <tr>
                <td style="height: 24px; width: 169px;"></td>
                <td style="height: 24px">
                </td>
                <td style="height: 24px">
                </td>
                <td style="height: 24px">
                </td>
                <td style="height: 24px">
                </td>
                <td style="height: 24px"></td>
                <td class="auto-style29" style="height: 24px; width: 186px"></td>
                <td style="height: 24px"></td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 169px" >
            <asp:ImageButton ID="imgImforme" runat="server" Height="47px" ImageUrl="~/Imagenes/iconos/icoinforme.png" Width="61px" OnClick="imgImforme_Click" />
                    <br />
                          <asp:Panel ID="Panel_mensaje" runat="server" Visible="False" Width="138px">
                              <div id="Mensaje_informe" style="width: 133px">
                                  <strong style="color: #FF0000">¡EL INFORME<br /> ESTÁ&nbsp; SIN DATOS!</strong>
                              </div>
                          </asp:Panel>
                </td>
                <td class="auto-style14" colspan="6" >
        <asp:GridView ID="GVGuias" runat="server" CellPadding="4"  RowStyle-BackColor="#D8D8D8" AlternatingRowStyle-BackColor="#FA8258" HeaderStyle-BackColor="#6E6E6E" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"  AutoGenerateColumns="False" AllowPaging="True"  Width="757px"  Height="30px"  PageSize="7" OnPageIndexChanging="GVGuias_PageIndexChanging" OnSelectedIndexChanged="GVGuias_SelectedIndexChanged"  > 
                 <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
            <Columns>
            <asp:BoundField DataField="gce_nro_gce" HeaderText="Num Guia" SortExpression="gce_nro_gce" />
            <asp:BoundField DataField="nombreCliente" HeaderText="Cliente" SortExpression="nombreCliente" />
            <asp:BoundField DataField="gce_nom_usu" HeaderText="Nom Usuario" SortExpression="gce_nom_usu"/>
            <asp:BoundField DataField="gce_nom_eqp" HeaderText="Nom equipo" SortExpression="gce_nom_eqp" />
            <asp:BoundField DataField="gce_usr_gce" HeaderText="Usu Responsable" SortExpression="gce_usr_gce"/>
            <asp:BoundField DataField="sucursal" HeaderText="Sucursal" SortExpression="sucursal"/>
            <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado"/>
            

            <asp:HyperLinkField DataNavigateUrlFields="gce_nro_gce"   DataNavigateUrlFormatString="~/Mantencion/Guias_Modi.aspx?ID={0}" Text="Ver Detalle" ControlStyle-CssClass="BotonAzul" >
            
<ControlStyle CssClass="BotonAzul" ></ControlStyle>
                </asp:HyperLinkField>
      
                
           
            </Columns>
            <EditRowStyle HorizontalAlign="Center" Width="100px" />
                          <EditRowStyle HorizontalAlign="Center" Width="100px" />
                    <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="30px"></RowStyle>

                <EmptyDataTemplate>
                    <h2 style="color:blue;text-align:center;margin-top:auto;margin-bottom:auto;padding:5PX" >Sin datos de guias!!</h2>
                    
                  </EmptyDataTemplate>
                
                
            </asp:GridView>
                </td>
                <td class="auto-style25" ></td>
            </tr>
        </table>
         
        <div id="DivGVguias">   
            <br />
&nbsp;</div>
        
            
          
        
       <br />
        <!-- Aqui poner codigo página ingreso Guías-->
         
            
          
        
     </div>
     <br />
     <br />
    
</body>
        
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
