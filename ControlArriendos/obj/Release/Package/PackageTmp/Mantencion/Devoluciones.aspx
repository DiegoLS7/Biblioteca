<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Devoluciones.aspx.cs" Inherits="ControlArriendos.Devoluciones" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
    <div  align="center" style="width: 1700px">
       <br />
        <br />
     <h2 class="Titulos">Ingreso Devoluciones </h2>
       <br />
        <!-- Aqui poner código página ingreso Devoluciones-->
         <table class="tabla3" style="width: 366px" >
               <tr>          
                    <td><asp:Label ID="lbl_cliente" runat="server" CssClass="Texto" Font-Size="10pt" Text="Cliente:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropCliente" runat="server" Width="193px" CssClass="textbox"></asp:DropDownList>
                    </td>    
                    <td style="width: 21px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td> 
                    <td>
                       <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="BotonRojo" OnClick="btnBuscar_Click" />
                    </td> 
                    <td class="auto-style25" style="height: 38px; width: 183px; text-align: center">
                     <asp:Panel ID="pMsjGuia" runat="server" Height="36px" Width="165px">
                        <div id="loginmensaje">
                            <strong>Seleccione un cliente.</strong>
                        </div>
                     </asp:Panel>   
                    </td>             
               </tr>  
         </table>
            &nbsp;
        <table class="Tabla_Estructura" style="width: 743px; height: 100px;">
            <tr>
                <td class="auto-style14" colspan="6" >
                 
                 <asp:GridView ID="GVGuias" runat="server" CellPadding="4"  RowStyle-BackColor="#D8D8D8" AlternatingRowStyle-BackColor="#FA8258" HeaderStyle-BackColor="#6E6E6E" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"   AutoGenerateColumns="False"   Width="757px"  Height="30px"  PageSize="7"   > 
                 <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
                 <Columns>
                  <asp:TemplateField HeaderText="Seleccione"> 
                      <ItemTemplate >
                        <asp:CheckBox ID="chequeaDevolver" runat="server" AutoPostBack="false" />
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="gce_nro_gce" HeaderText="Num Guia" SortExpression="gce_nro_gce" />
                  <asp:BoundField DataField="nombreCliente" HeaderText="Cliente" SortExpression="nombreCliente" />
                  <asp:BoundField DataField="gce_nom_usu" HeaderText="Nom Usuario" SortExpression="gce_nom_usu"/>
                  <asp:BoundField DataField="gce_nom_eqp" HeaderText="Nom equipo" SortExpression="gce_nom_eqp" />
                  <asp:BoundField DataField="gce_usr_gce" HeaderText="Usu Responsable" SortExpression="gce_usr_gce"/>
                  <asp:BoundField DataField="sucursal" HeaderText="Sucursal" SortExpression="sucursal"/>
                  <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado"/>
                  </Columns>
                  <EditRowStyle HorizontalAlign="Center" Width="100px" />
                  <EditRowStyle HorizontalAlign="Center" Width="100px" />
                  <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White"></HeaderStyle>
                  <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="30px"></RowStyle>

                  <EmptyDataTemplate>
                     <h2 style="color:blue;text-align:center;margin-top:auto;margin-bottom:auto;padding:5PX" >¡Sin datos de guias!</h2>
                  </EmptyDataTemplate>
                
                  </asp:GridView>
             </td>
         </tr>
         <tr>    
             <td class="auto-style25" >      
                  <asp:Button ID="Seleccione" runat="server"  CssClass="BotonGris" Height="28px"  Text="Seleccionar Todas" Width="113px" Visible="False" OnClick="Seleccione_Click"/>
                  <asp:Button ID="btnQuitar" runat="server" CssClass="BotonGris" Height="28px"  Text="Quitar Todas" Width="113px" OnClick="btnQuitar_Click" Visible="False"/>
             </td>
             <td class="auto-style25" style="width: 198px" >
                 <asp:Button ID="btn_grabar" runat="server" CssClass="BotonRojo2" Height="28px"  Text="Grabar" Width="108px" OnClick="btn_grabar_Click" Visible="False" />          
             </td>
        </tr>
            
     </table>


   </div>
     <br />
     <br />
    
</body>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
