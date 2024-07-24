<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ensambles.aspx.cs" Inherits="ControlArriendos.Ensambles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

     <script>
         $(document).ready(function () {
             $('#<%=txtFecha.ClientID%>').datepicker({
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

<head >
    <title></title>
    	
</head>
<body>

    <div  align="center" style="width: 1700px">
       <br />
        <br />
     <h2 class="Titulos">Ingreso Ensambles </h2>
       <br />
        
       <table class="tabla3" > 
       <td class="auto-style14" >
           <asp:Label ID="Label5" runat="server" CssClass="Texto" Text="CLIENTE" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <%--<asp:TextBox ID="txtRut" runat="server" MaxLength="18" Height="17px" Width="132px" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>--%>
           <asp:DropDownList ID="DropRutCliente" runat="server" Height="29px" Width="132px" AutoPostBack="false" CssClass="textbox" ></asp:DropDownList>
        </td>
       <td class="auto-style20">
           <asp:Label ID="Label6" runat="server" CssClass="Texto" Text="FECHA" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29">
           <asp:TextBox ID="txtFecha" runat="server" Height="17px"  Width="133px" CssClass="textbox" ></asp:TextBox>                                  
        </td>
       <td>               
                           
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="BotonRojo2" Height="28px" Width="72px" OnClick="BuscarEnsamble_Click" />
        </td>
       

    <td class="auto-style25" style="width: 196px">              
            
                    
        
         <asp:Panel ID="PanelMsje" runat="server" Width="165px" Height="36px">
             <div id="loginmensaje">
                 <strong>Debe completar algun campo para buscar</strong>
             </div>
            </asp:Panel></td>
       <tr>
           
       <td colspan="6">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" RowStyle-BackColor="#D8D8D8" AlternatingRowStyle-BackColor="#FA8258" HeaderStyle-BackColor="#6E6E6E" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" CellPadding="3" ShowFooter="True" Width="750px" Style="margin-bottom: 0px" HorizontalAlign="Center" AllowPaging="True" PageSize="7" AllowSorting="True" OnPageIndexChanging="GVEnsambles_PageIndexChanging" Height="30px" OnSelectedIndexChanged="GVEnsambles_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
            <Columns>
            <asp:TemplateField HeaderText="Nro. Hoja Ensamble">
            <ItemTemplate>
               <asp:Label ID="lblNhoja" runat="server" Text='<%# Eval("Che_nro_che")%>'></asp:Label>
            </ItemTemplate>
                <EditItemTemplate>
               <asp:TextBox ID="txtNhoja" runat="server" Text='<%# Eval("che_nro_che")%>' Width="180px" CssClass="textbox"></asp:TextBox>
            </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-Width="100px">
            <ItemTemplate>
               <asp:Label ID="lblRutCli" runat="server" Text='<%# Eval("che_rut_cli") +"-"+ Eval("cli_dig_ver")%>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox ID="txtRutCli" runat="server" Text='<%# Eval("che_rut_cli") +"-"+ Eval("cli_dig_ver")%>' Width="180px" CssClass="textbox"></asp:TextBox>
            </EditItemTemplate>
               <HeaderStyle Width="200px"></HeaderStyle>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Nombre Cliente">
            <ItemTemplate>
               <asp:Label ID="lblNomCli" runat="server" Text='<%# Eval("cli_nom_cli")%>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox ID="txtNomCli" runat="server" Text='<%# Eval("cli_nom_cli")%>' Width="15px" CssClass="textbox"></asp:TextBox>
            </EditItemTemplate>
            </asp:TemplateField>
                        <%--<asp:CommandField HeaderText="Seleccione" CancelImageUrl="~/Imagenes/cancelar.jpg" CancelText="Cancelar" DeleteImageUrl="~/Imagenes/eliminar.jpg" DeleteText="Eliminar" EditImageUrl="~/Imagenes/editar.jpg" EditText="Editar" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="BotonRojo2">
                            <ControlStyle BackColor="#ff3300" CssClass="BotonRojo2" ForeColor="White" Width="60px"></ControlStyle>
                        </asp:CommandField>--%>

                    <asp:BoundField DataField="che_fec_ing" HeaderText="Fecha Ingreso" />

                    <asp:TemplateField ShowHeader="False"  HeaderText="Seleccione">
                    <ItemTemplate>
                        <asp:Hyperlink ID="Hyperlink" runat="server" CausesValidation="False" CommandName="Edit" NavigateUrl='<%# Eval("che_nro_che", "EditaEnsamble.aspx?ID={0}") %>'
                            Text="Editar" CssClass="BotonAzul" style="padding : 3px 3px 3px 3px"  ></asp:Hyperlink>
                    
                    </ItemTemplate>
                </asp:TemplateField>

                    

                    </Columns>
                    <EditRowStyle HorizontalAlign="Center" Width="100px" />
                    <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="30px"></RowStyle>

                    <EmptyDataTemplate>
                        <div class="Tabla_comentario_cabecera">
                        <table cellpadding="4" class="Tabla_comentario_cabecera" gridlines="None">
                            <tr>
                                <center>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Nro. Hoja Ensamble</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Rut Cliente</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Nombre Cliente</td>
                                    <td></td>
                                </center>
                            </tr>
                        </table>
                    </div>
                    <h2>Tabla sin Ensambles!!</h2>
                    </EmptyDataTemplate>
                <RowStyle cssClass="Tabla_contenido" HorizontalAlign="Center" />
                <SelectedRowStyle cssClass="Tabla_contenido" />
                </asp:GridView>
              
        </td>
  

        
           
        </tr>
     


        <tr>
            <td class="auto-style16">
                <br />
                
                
            </td>
            <td class="auto-style14"><asp:Button ID="BtnEnsamble" runat="server" CssClass="BotonGris" Height="30px" Text="Nuevo Ensamble" OnClick="NuevoEnsamble_Click" ForeColor="White" Width="110px" />
            </td>
        <td class="auto-style12">
            &nbsp;</td>
            <td style="text-align: right">
                <asp:ImageButton ID="BtnInforme" runat="server" Height="43px" ImageUrl="~/Imagenes/iconos/icoinforme.png" title="Exportar" OnClick="InformeEnsamble_Click" Width="54px" />
            </td>
            <td>
                </td>
            <td style="width: 196px">
                <asp:Panel ID="Panelinforme" runat="server" Width="165px" Height="36px">
                    <div id="mensajeinforme" style="width: 167px">
                        <strong style="color: #FF0000">EL INFORME ESTÁ SIN ENSAMBLES</strong>
                    </div>
                </asp:Panel>
            </td>
        </tr>


     </table>   
     </div>
     <br />
     <br />
    
</body>
</asp:Content>


