<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditaEnsamble.aspx.cs" Inherits="ControlArriendos.Mantencion.EditaEnsamble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <%--    *************************    Mostrar fecha   *************************************    --%>
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
     <script>
         $(document).ready(function () {
             $('#<%=txt_fecha.ClientID%>').datepicker({
                 dateFormat: 'dd-mm-yy',
                 minDate: new Date('2000/01/01'),
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

    <div  align="center" style="width: 1700px; height: 70px;">
       <br />
        <br />
     <h2 class="Titulos">Edita Ensamble</h2>
       <br />
     </div>
     <br />
     <br />
    <asp:Panel ID="PanelCabecera" runat="server" Width="1697px" Height="263px">
        <div  align="center" style="width: 1700px">
        <asp:Label ID="Label2" runat="server" CssClass="Texto" Text="CABECERA :" Font-Size="10pt"></asp:Label>
            <table  class="Tabla_Estructura">
            <center>
                
                 <tr align="center">
       <td class="auto-style14" >
           <asp:Label ID="Label5" runat="server" CssClass="Texto" Text="NUMERO HOJA ENSAMBLE :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtNhoja" required="active" runat="server" Height="16px" Width="130px" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label6" runat="server" CssClass="Texto" Text="CLIENTE :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29">    <asp:TextBox ID="txtNombre" required="active" runat="server" Height="16px" Width="138px"  CssClass="textbox"></asp:TextBox></td>             
    </tr>
<caption>
            &nbsp;</td>
        </caption>
                <tr align="center">
       <td class="auto-style14" >
           <asp:Label ID="Label1" runat="server" CssClass="Texto" Text="TIPO EQUIPO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:DropDownList ID="DropTipoEquipo" runat="server" Height="25px" Width="140px"  CssClass="Texto">
         </asp:DropDownList>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label3" runat="server" CssClass="Texto" Text="TECNICO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29">
                                            
           <asp:DropDownList ID="DropTecnico" TextDefault="Seleccione" runat="server" CssClass="Texto" Height="25px" Width="140px">
                    </asp:DropDownList>
                                            
        </td>             
    </tr>
               
               <tr align="center">
       <td class="auto-style14" >
           <asp:Label ID="Label10" runat="server" CssClass="Texto" Text="VENTA :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
           <asp:TextBox ID="txtVenta" required="active" runat="server" Height="53px" Width="130px" MaxLength="50" TextMode="MultiLine" onkeypress="return solonumeros(event)" CssClass="textbox"></asp:TextBox>
        </td>
       <td class="auto-style20" style="width: 148px">
           <asp:Label ID="Label11" runat="server" CssClass="Texto" Text="FECHA INGRESO :" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style29">
             <asp:TextBox ID="txt_fecha" runat="server"  Enabled="True" CssClass="textbox" style=" text-align: center" Height="16px" Width="139px"></asp:TextBox>                         
        </td>        
       
    </tr>
         <tr align="center">
       <td class="auto-style14" >
        </td>
       <td class="auto-style12" ><asp:Button ID="btnActualizar" runat="server" class="BotonAzul" Text="Actualizar" OnClick="ActualizarCabecera_Click"></asp:Button>
        </td>
       <td class="auto-style20" style="width: 148px"> <asp:HyperLink ID="HyperLink1" runat="server" Text="VOLVER" ControlStyle-CssClass="BotonRojo" NavigateUrl="Ensambles.aspx" /> 
        </td>
       <td class="auto-style29">                                  
        </td>        
       
    </tr>
         </center>
         </table>
            
      
</div>
    </asp:Panel>
    <asp:Panel ID="PanelDetalle" runat="server" Width="1697px" Height="441px">
        <div  align="center" style="width: 1700px; height: 432px;">
            <table  class="Tabla_Estructura" >
    <center>
    <tr align="center">
       
       <td class="auto-style14" >
           <asp:Label ID="Label4" runat="server" CssClass="Texto" Text="DETALLE" Font-Size="10pt"></asp:Label>
        </td>
       <td class="auto-style12" >
        </td>
       <td class="auto-style20">
        </td>
       <td class="auto-style29">               
                           
        </td>
       <td class="auto-style29">               
                           
            
        </td>
       

    <td class="auto-style25">              
            
   </td>
       

    </tr>

        <caption>
            &nbsp;
        </caption>
        
      <tr>
  
        <td colspan="6">       
            <asp:GridView ID="GridP" runat="server" class="" AutoGenerateColumns="False" HorizontalAlign="Center" AllowPaging="True" CssClass="Tabla_empleados" OnRowEditing="ActualizarRegistro" OnRowUpdating="Update_Registro" OnRowCancelingEdit="CancelarRegistro" Width="700px" OnPageIndexChanging="GridP_PageIndexChanging" Height="30px" OnSelectedIndexChanged="GridP_SelectedIndexChanged"> 
                <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Nro. Detalle">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("dhe_cor_dhe") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hardware" SortExpression="hrw" ConvertEmptyStringToNull="False">
                        <ItemTemplate>
               <asp:Label ID="lblhardware" runat="server" Text='<%# Eval("par_des_par")%>'></asp:Label>
            </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropHardware" Class="ComboBox" runat="server" Height="17px" Width="133px"></asp:DropDownList>
                            <asp:Label ID="lblHrw" runat="server" Text='<%# Eval("par_des_par")%>' Visible="False"></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marca" SortExpression="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMarca" runat="server" Text='<%# Eval("dhe_mar_hrw") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("dhe_mar_hrw") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modelo" SortExpression="cli_cor_ele">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtModelo" runat="server" Text='<%# Eval("dhe_mod_hrw") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("dhe_mod_hrw") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Serie">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSerie" runat="server" Text='<%# Eval("dhe_ser_hrw") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("dhe_ser_hrw") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comentarios">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtObservacion" runat="server" Text='<%# Eval("dhe_obs_dhe") %>'>></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("dhe_obs_dhe") %>'>></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False"  HeaderText="Seleccione">
                    <EditItemTemplate>
                        <asp:Button ID="btnupdate" runat="server" CausesValidation="True" CommandName="Update"
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
                        <table cellpadding="4" class="Tabla_comentario_cabecera">
                            <tr>
                                <center>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Hardware</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Marca</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Modelo</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Serie</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Comentarios</td>
                                    <td></td>
                                </center>
                            </tr>
                        </table>
                    </div>
                </EmptyDataTemplate>
                <HeaderStyle />
                <RowStyle cssClass="Tabla_contenido" HorizontalAlign="Center" />
                <SelectedRowStyle cssClass="Tabla_contenido" />

            </asp:GridView>
            
            
            
                    
                           
            </td>   
   
    </center>
    </table>

    </div>
    </asp:Panel>



</body>
</asp:Content>
