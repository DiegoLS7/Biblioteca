<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Libros.aspx.cs" Inherits="ControlArriendos.Mantencion.Libros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

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

<body>
    <div  align="center" style="width: 1800px">
       <br />
        <br />
     <h2 class="Titulos">Mantención Libros </h2>
  <br />    
<table  class="Tabla_Estructura" >
    <center>
    <tr align="center">
       <td class="auto-style3" style="width: 97px">               
                           
            <asp:ImageButton ID="BtnNuevoCliente" runat="server" Height="57px" Width="65px" ImageUrl="~/Imagenes/Nuevo.png" href="#" BorderColor="#BFBFBF" PostBackUrl="#" style="margin-left: 0px" OnClick="NuevoLibro_Click" />
        </td>
       <td class="auto-style14" >
           <asp:Label ID="Label5" runat="server" CssClass="Texto" Text="RUT" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtCod" runat="server" MaxLength="18" Height="17px" 
               Width="132px" onkeypress="return solonumeros(event)" CssClass="textbox" 
               OnTextChanged="txtRut_TextChanged"></asp:TextBox>
        </td>
       <td class="auto-style29">               
                           
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="BotonRojo2" Height="28px" Width="72px" OnClick="BuscarLibro_Click"/>
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
                         <asp:GridView ID="GridP" runat="server" class="" AutoGenerateColumns="False"  HeaderStyle-ForeColor="White" CellPadding="3" ShowFooter="True" OnRowEditing="ActualizarRegistro" OnRowUpdating="Update_Registro" OnRowCancelingEdit="CancelarRegistro" HorizontalAlign="Center" AllowPaging="True" CssClass="Tabla_empleados" Width="750px" Style="margin-bottom: 0px" PageSize="7" AllowSorting="True" OnPageIndexChanging="GridP_PageIndexChanging" Height="80px" OnSelectedIndexChanged="GridP_SelectedIndexChanged"> 

                <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>

                <Columns>
                    <asp:TemplateField HeaderText="Codigo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxRut" runat="server" Text='<%# Eval("Codigo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Codigo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Titulo" >
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Titulo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editorial" >
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Editorial") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Editorial") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Autor">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Autor") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Autor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ubicacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("Ubicacion") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Ubicacion") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ultimo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("Ultimo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Ultimo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Disponibilidad">
                    <ItemTemplate>
                    <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Disponibilidad")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <asp:DropDownList ID="DropEstado" runat="server" Width="100px" CssClass="textbox"  ></asp:DropDownList>                
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Disponibilidad")%>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="FechaPre">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("FechaPre") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("FechaPre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="FechaDev">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("FechaDev") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("FechaDev") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Seleccione" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="btnactualizar" runat="server" CausesValidation="True" CommandName="Update"
                              Text="Actualizar" CssClass="BotonAzul" style="padding : 3px 3px 3px 3px" ></asp:Button>
                        
                            <asp:LinkButton ID="btncancelar" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancelar"  CssClass="BotonRojo" style="padding : 3px 3px 3px 3px;margin-top:3px" ></asp:LinkButton>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnedit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Editar" CssClass="BotonAzul" style="padding : 3px 3px 3px 3px"  ></asp:LinkButton>
                    
                    </ItemTemplate>
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
                                <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Codigo</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Titulo</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Editorial</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Autor</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Ubicacion</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Ultimo</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Disponibilidad</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">FechaPre</td>   
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">FechaDev</td>
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
</body>
    </asp:Panel> 
</asp:Content>
