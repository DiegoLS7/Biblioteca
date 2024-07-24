<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Libros.aspx.cs" Inherits="ControlArriendos.Mantencion.Libros" %>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"  >

    <asp:Panel ID="PanelPrincipal" runat="server" Width="1920px" Style="margin-top: 0px" CssClass="content-container" >

<body>
    <div class="contenedorLibro" align="center" style="width: 1800px; margin-top: 25px;">



       <br />
        <br />
     <h2 class="Titulos" style="color: black; text-shadow: 2px 2px 4px #555;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mantención Libros </h2>
  <br />    
<table  class="Tabla_Estructura"  >
    <center>
    <tr align="center">
       <td class="auto-style3" style="width: 97px">               
                           
            <asp:ImageButton ID="BtnNuevoCliente" runat="server" Height="60px" Width="65px" ImageUrl="~/Imagenes/Nuevo.png" href="#" BorderColor="#BFBFBF" PostBackUrl="#" style="margin-left: 0px; background-color: Transparent;"   OnClick="NuevoLibro_Click" />
        </td>
       <td class="auto-style14" >
           <asp:Label ID="Label5" runat="server"  ForeColor="Black" CssClass="Texto" Text="CODIGO " Font-Size="14pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtCod" runat="server" MaxLength="18" Height="24px" 
             Width="200px" onkeypress="return solonumeros(event)" CssClass="textbox" 
             OnTextChanged="txtRut_TextChanged" BackColor="#e5f4fc"></asp:TextBox>

        </td>
               <td class="auto-style14" >
           <asp:Label ID="Label7" runat="server" ForeColor="Black" CssClass="Texto" Text="TITULO" Font-Size="14pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="TextTitulo" runat="server" MaxLength="18" Height="24px" 
               Width="200px" CssClass="textbox" 
               OnTextChanged="txtRut_TextChanged" BackColor="#e5f4fc"></asp:TextBox>
        </td>
       <td class="auto-style29">               
                           
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar"  Height="32px" Width="100px" OnClick="BuscarLibro_Click"/>
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
                          <asp:GridView ID="GridP" runat="server" class="" AutoGenerateColumns="False"  HeaderStyle-ForeColor="White" CellPadding="3" ShowFooter="True" OnRowEditing="ActualizarRegistro" OnRowUpdating="Update_Registro" OnRowCancelingEdit="CancelarRegistro" HorizontalAlign="Center" AllowPaging="True" CssClass="Tabla_empleados" Width="750px" Style="margin-top: 0px" PageSize="10" AllowSorting="True" OnPageIndexChanging="GridP_PageIndexChanging" Height="80px" OnSelectedIndexChanged="GridP_SelectedIndexChanged"> 

                <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>

                <Columns>
                    <asp:TemplateField HeaderText="Codigo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxCodigo" runat="server" Width="110px" Text='<%# Eval("Codigo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Width="110px" Text='<%# Eval("Codigo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Titulo" >
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Width="110px" Text='<%# Eval("Titulo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Width="110px" Text='<%# Eval("Titulo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Editorial">
                    <ItemTemplate>
                    <asp:Label ID="lblEditorial" runat="server" Width="110px" Text='<%# Eval("Editorial")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <asp:DropDownList ID="DropEditorial" runat="server" Width="110px" CssClass="textbox"  ></asp:DropDownList>                
                    <asp:Label ID="Label3" runat="server" Width="110px" Text='<%# Eval("Editorial")%>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Autor">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4"  runat="server" Width="110px" Text='<%# Eval("Autor") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Width="110px" Text='<%# Eval("Autor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ubicacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Width="110px" Text='<%# Eval("Ubicacion") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Width="110px" Text='<%# Eval("Ubicacion") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ultimo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Width="110px" ReadOnly="true" Text='<%# Eval("Ultimo")  %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Width="110px" Text='<%# Eval("Ultimo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Disponibilidad">
                    <ItemTemplate>
                    <asp:Label ID="lblDisponibilidad" runat="server" Text='<%# Eval("Disponibilidad")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <asp:DropDownList ID="DropDisponibilidad" runat="server" Width="100px" CssClass="textbox"  ></asp:DropDownList>                
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Disponibilidad")%>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fecha Prestamo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Width="110px" ReadOnly="true" Text='<%# Eval("FechaPre") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Width="110px" Text='<%# Eval("FechaPre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fecha Devolucion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Width="110px" ReadOnly="true" Text='<%# Eval("FechaDev") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Width="110px" Text='<%# Eval("FechaDev") %>'></asp:Label>
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
                                <td style="padding-left: 10px;  padding-right: 30px; font-family:Arial; font-size: 12px; font-weight:bold">Codigos</td>
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
                    <h2>No existen datos de ejemplar ingresado!!</h2>
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

