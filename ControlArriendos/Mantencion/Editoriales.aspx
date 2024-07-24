<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Editoriales.aspx.cs" Inherits="ControlArriendos.Mantencion.Editoriales" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="PanelPrincipal" runat="server" Width="1920px" Style="margin-top: 0px" CssClass="content-container" >

<body>
    <div class="contenedorLibro" align="center" style="width: 1800px; margin-top: 25px;">



       <br />
        <br />
     <h2 class="Titulos" style="color: black; text-shadow: 2px 2px 4px #555;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mantención Editoriales </h2>
  <br />    
<table  class="Tabla_Estructura"  >
    <center>
    <tr align="center">
       <td class="auto-style3" style="width: 97px">               
                           
            <asp:ImageButton ID="BtnNuevoCliente" runat="server" Height="60px" Width="65px" ImageUrl="~/Imagenes/Nuevo.png" href="#" BorderColor="#BFBFBF" PostBackUrl="#" style="margin-left: 0px; background-color: Transparent;"   OnClick="NuevaEditorial_Click" />
        </td>
       <td class="auto-style14" >
           <asp:Label ID="Label5" runat="server"  ForeColor="Black" CssClass="Texto" Text="CODIGO" Font-Size="14pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtCodigo" runat="server" MaxLength="18" Height="24px" 
             Width="200px" onkeypress="return solonumeros(event)" CssClass="textbox" 
             OnTextChanged="txtRut_TextChanged" BackColor="#e5f4fc"></asp:TextBox>

        </td>
               <td class="auto-style14" >
           <asp:Label ID="Label7" runat="server" ForeColor="Black" CssClass="Texto" Text="NOMBRE" Font-Size="14pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="TextNombre" runat="server" MaxLength="18" Height="24px" 
               Width="200px" CssClass="textbox" 
               OnTextChanged="txtRut_TextChanged" BackColor="#e5f4fc"></asp:TextBox>
        </td>
       <td class="auto-style29">               
                           
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar"  Height="32px" Width="100px" OnClick="BuscarEditorial_Click"/>
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
        <td colspan="6">       
                         <asp:GridView ID="GridP" runat="server" class="" AutoGenerateColumns="False"  HeaderStyle-ForeColor="White" CellPadding="3" ShowFooter="True" OnRowEditing="ActualizarRegistro" OnRowUpdating="Update_Registro" OnRowCancelingEdit="CancelarRegistro" HorizontalAlign="Center" AllowPaging="True" CssClass="Tabla_empleados" Width="750px" Style="margin-top: 0px" PageSize="12" AllowSorting="True" OnPageIndexChanging="GridP_PageIndexChanging" Height="80px" OnSelectedIndexChanged="GridP_SelectedIndexChanged"> 

                <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>

                <Columns>
                    <asp:TemplateField HeaderText="Codigo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxCodigo" runat="server" ReadOnly="true" Width="110px" Text='<%# Eval("Codigo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Width="110px" Text='<%# Eval("Codigo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" >
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Width="110px" Text='<%# Eval("Nombre") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Width="110px" Text='<%# Eval("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Direccion" >
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Width="110px" Text='<%# Eval("Direccion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Width="110px" Text='<%# Eval("Direccion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Numero de Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4"  runat="server" Width="110px" Text='<%# Eval("Numero") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Width="110px" Text='<%# Eval("Numero") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fax">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Width="110px" Text='<%# Eval("Fax") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Width="110px" Text='<%# Eval("Fax") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>

                   <asp:TemplateField HeaderText="Ciudad">
                    <ItemTemplate>
                    <asp:Label ID="lblDisponibilidad" runat="server" Text='<%# Eval("Ciudad")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <asp:DropDownList ID="DropDownCiudad" runat="server" Width="100px" CssClass="textbox"  OnSelectedIndexChanged="DropDownCiudad_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>                
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Ciudad")%>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="Comuna">
                    <ItemTemplate>
                    <asp:Label ID="lblComuna" runat="server" Text='<%# Eval("Comuna")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <asp:DropDownList ID="DropDownComuna" runat="server" Width="100px" CssClass="textbox">
                    <asp:ListItem Text="Seleccione" Value=" " />
                     </asp:DropDownList>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Comuna")%>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Seleccione"  ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="btnactualizar" runat="server" CausesValidation="True" CommandName="Update"
                              Text="Actualizar" CssClass="BotonVerde" style="padding : 5px 5px 5px 5px" ></asp:Button>
                        
                            <asp:LinkButton ID="btncancelar" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancelar"  CssClass="BotonRojo" style="padding : 5px 5px 5px 5px;margin-top:2.5px" ></asp:LinkButton>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnedit" runat="server" CausesValidation="False" CommandName="Edit" Width="80px"
                        Text="Editar" CssClass="BotonAzul" Style="padding: 5.5px;"></asp:LinkButton>

                    
                    </ItemTemplate>
                   </asp:TemplateField>                 
                </Columns>
                <EditRowStyle HorizontalAlign="Center" Width="100px" Height="30px" />
                    <HeaderStyle BackColor="#2cace7" Font-Bold="True" ForeColor="Black"></HeaderStyle>
                    <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="Black" VerticalAlign="Middle" Width="110px" Height="40px"></RowStyle>
                <EmptyDataTemplate>
                    <div class="Tabla_comentario_cabecera">
                        <table cellpadding="3" class="Tabla_comentario_cabecera" gridlines="None">
                            <tr>
                                <center>
                                <td style="padding-left: 10px;  padding-right: 30px; font-family:Arial; font-size: 12px; font-weight:bold">Codigo</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Nombre</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Direccion</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Numero</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Fax</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Comuna</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Ciudad</td>


                                    <td></td>
                                </center>
                            </tr>
                        </table>
                    </div>
                    <h2>!!!No existen datos de la Editorial buscada!!!</h2>
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
    </div>
       <br />
</body>

    </asp:Panel> 
</asp:Content>

