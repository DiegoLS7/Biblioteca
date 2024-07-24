<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="ControlArriendos.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

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

    
   </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    <asp:Panel ID="PanelPrincipal" runat="server" Width="1700px">
     <body > 
<body>

    <div  align="center" style="width: 1700px">
       <br />
        <br />
     <h2 class="Titulos">Mantención Clientes </h2>
  <br />
   
<table  class="Tabla_Estructura" >
    <center>
    <tr align="center">
       <td class="auto-style3" style="width: 97px">               
                           
            <asp:ImageButton ID="BtnNuevoCliente" runat="server" Height="57px" Width="65px" ImageUrl="~/Imagenes/Nuevo.jpg" href="http://localhost:61921/Mantencion/NuevoCliente.aspx" BorderColor="#BFBFBF" PostBackUrl="~/Mantencion/NuevoCliente.aspx" style="margin-left: 0px" OnClick="NuevoCliente_Click" />
        </td>
       <td class="auto-style14" >
           <asp:Label ID="Label5" runat="server" CssClass="Texto" Text="RUT" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtRut" runat="server" MaxLength="18" Height="17px" Width="132px" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20">
           <asp:Label ID="Label6" runat="server" CssClass="Texto" Text="NOMBRE" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29"><asp:TextBox ID="txtNombre" MaxLength="80" runat="server" Height="17px"  Width="133px" onkeypress="return soloLetras(event)" CssClass="textbox"></asp:TextBox>               
                           
        </td>
       <td class="auto-style29">               
                           
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="BotonRojo2" Height="28px" Width="72px" OnClick="BuscarCliente_Click" />
        </td>
       

    <td class="auto-style25">              
            
                    
        
         <asp:Panel ID="PanelMsje" runat="server" Width="165px" Height="36px">
             <div id="loginmensaje">
                 <strong>Debe completar algun campo para buscar</strong>
             </div>
            </asp:Panel></td>
       

    </tr>

    <tr>
       <td class="auto-style3" style="width: 97px">               
                           
            &nbsp;</td>
       <td class="auto-style14" >
            
                    
        
            &nbsp;</td>
       <td class="auto-style12" >
            
                    
        
           &nbsp;</td>
       <td class="auto-style20">
                           
            &nbsp;</td>
       <td class="auto-style29">
            
                    
        
           &nbsp;</td>
       <td class="auto-style29">               
                           
            &nbsp;</td>
    <td class="auto-style29">              
            
                    
        
            &nbsp;</td>
       

    <td class="auto-style25" style="width: 3px">              
            
                    
        
         &nbsp;</td>
       

    </tr>
      <tr>
        <td style="width: 97px">         
            <asp:ImageButton ID="BtnInforme" runat="server" Height="42px" ImageUrl="~/Imagenes/iconos/icoinforme.png" title="Exportar" OnClick="LLenarInforme_Click" Width="54px" />
               
            <br />
            <asp:Panel ID="Panel_mensaje" runat="server" Visible="False" Width="138px">
                <div id="Mensaje_informe" style="width: 133px">
                    <strong style="color: #FF0000">¡EL INFORME<br /> ESTÁ&nbsp; SIN DATOS!</strong>
                </div>
            </asp:Panel>
               
       </td>   
        <td colspan="6">       
            <asp:GridView ID="GridP" runat="server" class="" AutoGenerateColumns="False" HorizontalAlign="Center" AllowPaging="True" CssClass="Tabla_empleados" Width="700px" OnPageIndexChanging="GridP_PageIndexChanging" Height="30px" OnSelectedIndexChanged="GridP_SelectedIndexChanged"> 
                <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Rut" SortExpression="Rut">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Rut") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("cli_rut_cli") +"-"+ Eval("cli_dig_ver")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Nombre") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("cli_nom_cli") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico" SortExpression="cli_cor_ele">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("cli_cor_ele") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("cli_cor_ele") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("par_des_par") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("par_des_par") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Seleccione">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("cli_rut_cli", "~/Mantencion/EditaCliente.aspx?ID={0}") %>' Text="Editar"></asp:HyperLink>
                        </ItemTemplate>
                        <ControlStyle CssClass="BotonAzul" ></ControlStyle>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle HorizontalAlign="Center" Width="100px" Height="30px" />
                    <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="30px"></RowStyle>
                <EmptyDataTemplate>
                    <div class="Tabla_comentario_cabecera">
                        <table cellpadding="4" class="Tabla_comentario_cabecera" gridlines="None">
                            <tr>
                                <center>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Rut</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Nombre</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Correo Electronico</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Estado</td>
                                    <td></td>
                                </center>
                            </tr>
                        </table>
                    </div>
                    <h2>Sin datos de Clientes!!</h2>
                </EmptyDataTemplate>
                <HeaderStyle />
                <RowStyle cssClass="Tabla_contenido" HorizontalAlign="Center" />
                <SelectedRowStyle cssClass="Tabla_contenido" />
            </asp:GridView>
            
            
            
                    
                           
            </td>   
   
  
        <td style="width: 3px">       
            &nbsp;</td>   
   
    </center>
    </table>
       <br />

     </div>
     <br />
     <br />
    
</body>
    </asp:Panel> 
</asp:Content>




