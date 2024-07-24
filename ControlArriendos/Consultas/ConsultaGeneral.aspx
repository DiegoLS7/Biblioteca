<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ConsultaGeneral.aspx.cs" Inherits="ControlArriendos.Consultas.ConsultaGeneral" %>
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

<script>



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
     <h2 class="Titulos" style="color: black; text-shadow: 2px 2px 4px #555;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super Consulta </h2>
  <br />    
<table  class="Tabla_Estructura"  >
    <center>

    <tr align="center">
       <td class="auto-style14" >
           
<tr align="center">
        <td class="auto-style14">
            <asp:Label ID="Label3" runat="server" ForeColor="Black" CssClass="Texto" Text="Titulo" Font-Size="14pt" style="margin-right: -280px;" ></asp:Label>
        </td>
        <td class="auto-style12" style="height: 44px; width: 160px">
            <asp:TextBox ID="TxtTitulo" runat="server" CssClass="textbox" Height="24px" 
                MaxLength="18" Width="140px" 
                OnTextChanged="txtTitulo_TextChanged" BackColor="#e5f4fc" style="margin-right: -810px;" ></asp:TextBox>
        </td>
    </tr>

    <tr align="center">
        <td class="auto-style14">
            <asp:Label ID="Label5" runat="server" ForeColor="Black" CssClass="Texto" Text="Editorial" Font-Size="14pt" style="margin-right: -280px;" ></asp:Label>
        </td>
        <td class="auto-style12">
            <asp:DropDownList ID="DropEditorial" runat="server" Height="26px" Width="140px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" class="Combobox" CssClass="textbox" Font-Size="13pt" style="margin-right: -810px;" ></asp:DropDownList> 
        </td>
    </tr>

    <tr align="center">
        <td class="auto-style14">
            <asp:Label ID="Label7" runat="server" ForeColor="Black" CssClass="Texto" Text="Autor" Font-Size="14pt" style="margin-right: -280px;" ></asp:Label>
        </td>
        <td class="auto-style12" style="height: 44px; width: 160px">
            <asp:TextBox ID="TxtAutor" runat="server" CssClass="textbox" Height="24px" 
                MaxLength="18" Width="140px" 
                OnTextChanged="txtTitulo_TextChanged" BackColor="#e5f4fc" style="margin-right: -810px;" ></asp:TextBox>
        </td>
    </tr>



<tr align="center">
    <td class="auto-style14">
        <asp:Label ID="Label8" runat="server"  ForeColor="Black" CssClass="Texto" Text="Orden" Font-Size="14pt"></asp:Label>
    </td>
    <td class="auto-style14" colspan="2"> 
        <asp:RadioButton ID="FiltraTitulo" runat="server" Text="Filtra Titulo" GroupName="filtroGroup" Checked="true" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
        <asp:RadioButton ID="FiltraAutor" runat="server" Text="Filtra Autor" GroupName="filtroGroup" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
        <asp:RadioButton ID="FiltraCodigo" runat="server" Text="Filtra Codigo" GroupName="filtroGroup" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
        <asp:RadioButton ID="FiltraEditorial" runat="server" Text="Filtra Editorial" GroupName="filtroGroup" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
        <asp:RadioButton ID="FiltraUbicacion" runat="server" Text="Filtra Ubicacion" GroupName="filtroGroup" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
    </td>
</tr>

<tr align="center">
    <td class="auto-style14">
        <asp:Label ID="Label11" runat="server"  ForeColor="Black" CssClass="Texto" Text="Disponibilidad" Font-Size="14pt"></asp:Label>
    </td>
    <td class="auto-style14" colspan="3"> 
        <asp:RadioButton ID="DisponbilidadTodos" runat="server" Text="Todos" GroupName="filtroGroup1" Checked="true" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
        <asp:RadioButton ID="DisponbilidadSi" runat="server" Text="Si" GroupName="filtroGroup1" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
        <asp:RadioButton ID="DisponbilidadNo" runat="server" Text="No" GroupName="filtroGroup1" BackColor="#e5f4fc" style="border: 1px solid #000; color: #000;" />
        <div style="text-align: right;">
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" Height="32px" Width="100px" OnClick="BuscarLibro_Click" style="margin-left: 0px;"/>
            <asp:Button ID="BtnClear" runat="server" Text="Clear"  Height="32px" Width="100px" OnClick="BtnClear_Click" style="margin-left: 0px;"/>
        </div>
    </td>
</tr>

    <tr >
      <td class="auto-style29" >               
            <asp:Button ID="BtnBuscarss" runat="server" Text="Buscar" Height="32px" Width="100px" OnClick="BuscarLibro_Click" style="display: none;" />

        </td>      
    </tr>
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
                         <asp:GridView ID="GridP" runat="server" EnableViewState="true" class="" AutoGenerateColumns="False"  HeaderStyle-ForeColor="White" CellPadding="3" ShowFooter="True" HorizontalAlign="Center" AllowPaging="True" CssClass="Tabla_empleados" Width="750px" Style="margin-top: 15px; margin-left: 190px;" PageSize="8" AllowSorting="True" OnPageIndexChanging="GridP_PageIndexChanging" Height="100px" OnSelectedIndexChanged="GridP_SelectedIndexChanged"> 

                <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>

                <Columns>
                    <asp:TemplateField HeaderText="Codigo">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Width="150px" Text='<%# Eval("Codigo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Titulo" >
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Width="150px" Text='<%# Eval("Titulo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Autor">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Width="150px" Text='<%# Eval("Autor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Editorial">
                    <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Width="110px" Text='<%# Eval("Editorial")%>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ubicacion">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Width="150px" Text='<%# Eval("Ubicacion") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>

                   <asp:TemplateField HeaderText="Disponibilidad">
                    <ItemTemplate>
                    <asp:Label ID="lblDisponibilidad" runat="server" Text='<%# Eval("estado")%>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ultimo">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Width="150px" Text='<%# Eval("Ultimo Lector") %>'></asp:Label>
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

