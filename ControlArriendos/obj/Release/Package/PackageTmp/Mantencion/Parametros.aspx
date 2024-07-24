<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Parametros.aspx.cs" Inherits="ControlArriendos.Parametros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 
  

     <script type="text/javascript">

         function Confirma(pMensaje, pOpcion) {
             switch (pOpcion) {


                 case 1: //MODIFICAR

                     if (confirm(pMensaje) == true) {
                         window.parent.document.getElementById("ctl00_ContentPlaceHolder1_Modifica").click();
                     }
                     else {
                         return false;
                     }
                     break;
             }

         }

      </script>
     </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    <asp:Panel ID="PanelPrincipal" runat="server" Width="1000px" Height="474px">
     <body >   
          
   <div  align="center" style="width: 1700px">
       <br />
        <br />
    <h2 class="Titulos">Mantención de Parámetros </h2>
   <br />
  
       <table class="tabla3" >
        <tr>
             <td></td>
             <td></td>
             <td></td>
        </tr>
       <tr>
            <td><asp:Label ID="lblcodigo" runat="server" Text="Código" Font-Size="12pt" ForeColor="#666666" Height="18px" style="margin-bottom: 0px; margin-left: 72px;" Width="55px"></asp:Label></td>
            <td><asp:TextBox ID="txtCodigo" runat="server" BackColor="#E8E8E8" CssClass="Texto" Enabled="False" Height="22px" style="margin-bottom: 8px" Width="25px"></asp:TextBox></td>
            <td><asp:Label ID="lbldescripcion" runat="server" Text="Descripción" Font-Size="12pt" ForeColor="#666666"></asp:Label></td>
             
            <td><asp:DropDownList ID="DpDesParametrosPadre" runat="server" AutoPostBack="True" CssClass="Texto" Height="28px" Width="224px" OnSelectedIndexChanged="DpDesParametrosPadre_SelectedIndexChanged" OnTextChanged="DpDesParametrosPadre_TextChanged"></asp:DropDownList> </td>
            <td><asp:Button ID="BtnNueva" runat="server" CssClass="BotonRojo" Font-Size="10pt" ForeColor="White" Height="27px" OnClick="NuevaDescripcion_Click" Text="Nueva" Width="80px" /></td>   
            <td class="auto-style19"><asp:Button ID="BtnModifica" runat="server" CssClass="BotonRojo" Font-Size="10pt" ForeColor="White" Height="27px" OnClick="ModificarDescripcion_Click" Text="Modificar" Width="80px" /></td>   
       </tr>      
       <tr>
           
       <td colspan="6">
            <asp:GridView ID="GVParametros" runat="server" AutoGenerateColumns="False" RowStyle-BackColor="#D8D8D8" AlternatingRowStyle-BackColor="#FA8258" HeaderStyle-BackColor="#6E6E6E" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" CellPadding="3" ShowFooter="True" OnRowEditing="ActualizarRegistro" OnRowUpdating="Update_Registro" OnRowCancelingEdit="CancelarRegistro"  Width="750px" Style="margin-bottom: 0px" HorizontalAlign="Center" AllowPaging="True" PageSize="7" AllowSorting="True" OnPageIndexChanging="GVParametros_PageIndexChanging" OnSelectedIndexChanged="GVParametros_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
            <Columns>
            <asp:TemplateField HeaderText="Codigo">
            <ItemTemplate>
               <asp:Label ID="lblcodigo" runat="server" Text='<%# Eval("Codigo")%>'></asp:Label>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Descripcion" HeaderStyle-Width="100px">
            <ItemTemplate>
               <asp:Label ID="lbldescrip" runat="server" Text='<%# Eval("Descripcion")%>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox ID="txtdescrip" runat="server" Text='<%# Eval("Descripcion")%>' Width="180px" MaxLength="50" CssClass="textbox" required ></asp:TextBox>
                <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("Descripcion")%>' Visible="false" ></asp:Label>
            </EditItemTemplate>
               <HeaderStyle Width="200px"></HeaderStyle>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Cod_Aux">
            <ItemTemplate>
               <asp:Label ID="lblcodaux" runat="server" Text='<%# Eval("Cod_Auxiliar")%>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox ID="txtcodaux" runat="server" Text='<%# Eval("Cod_Auxiliar")%>' Width="60px" CssClass="textbox" MaxLength="25" required ></asp:TextBox>
            </EditItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Cod_Sistema">
            <ItemTemplate>
               <asp:Label ID="lblsistema" runat="server" Text='<%# Eval("Sistema")%>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox ID="txtsistema" runat="server" Text='<%# Eval("Sistema")%>' Width="60px" type="number"  CssClass="textbox"  required Min="-2147483647" Max="2147483647"></asp:TextBox>
            </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Estado">
            <ItemTemplate>
               <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Estado")%>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropEstado" runat="server" Width="100px" CssClass="textbox"  ></asp:DropDownList>                
                <asp:Label ID="lblEst" runat="server" Text='<%# Eval("COD_ESTADO")%>' Visible="False"></asp:Label>
            </EditItemTemplate>
                
                        </asp:TemplateField>
                        <%--<asp:CommandField HeaderText="Seleccione" CancelImageUrl="~/Imagenes/cancelar.jpg" CancelText="Cancelar" DeleteImageUrl="~/Imagenes/eliminar.jpg" DeleteText="Eliminar" EditImageUrl="~/Imagenes/editar.jpg" EditText="Editar" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="BotonRojo2">
                            <ControlStyle BackColor="#ff3300" CssClass="BotonRojo2" ForeColor="White" Width="60px"></ControlStyle>
                        </asp:CommandField>--%>

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
                    <EditRowStyle HorizontalAlign="Center" Width="100px" />
                    <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="30px"></RowStyle>

                    <EmptyDataTemplate>
                        <center>
                            <h2 style="color:blue;text-align:center;margin-top:auto;margin-bottom:auto;padding:5PX" >Tabla sin parametros!!</h2>
        </center>
                    </EmptyDataTemplate>
                </asp:GridView>
              
        </td>
  

        
           
        </tr>
     


        <tr>
            <td class="auto-style16">
                <br />
                
                
            </td>
            <td class="auto-style14"><asp:Button ID="BtnParametro" runat="server" CssClass="BotonGris" Height="30px" Text="Nuevo parametro" OnClick="NuevoParametro_Click" ForeColor="White" Width="110px" />
            </td>
        <td class="auto-style12">
            &nbsp;</td>
            <td style="text-align: right">
                <asp:ImageButton ID="BtnInforme" runat="server" Height="42px" ImageUrl="~/Imagenes/iconos/icoinforme.png" title="Exportar" OnClick="BtnInforme_Click" Width="54px" />
            </td>
        </tr>


     </table>      
     </div>
        <br />
        <br />
  </body> 
 </asp:Panel> 




    <%--<asp:CommandField HeaderText="Seleccione" CancelImageUrl="~/Imagenes/cancelar.jpg" CancelText="Cancelar" DeleteImageUrl="~/Imagenes/eliminar.jpg" DeleteText="Eliminar" EditImageUrl="~/Imagenes/editar.jpg" EditText="Editar" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="BotonRojo2">
                            <ControlStyle BackColor="#ff3300" CssClass="BotonRojo2" ForeColor="White" Width="60px"></ControlStyle>
                        </asp:CommandField>--%>
        <asp:Panel ID="PanelNuevo" runat="server" style="margin-left:auto;margin-right:auto" Width="839px" >
          <h2 class="Titulos">
              <asp:Label ID="lbltitulomodifica" runat="server" Text="Modificar Tabla"></asp:Label>
              <asp:Label ID="lbltitulo" runat="server" Text="Nueva Tabla Parametros"></asp:Label>
              &nbsp;</h2>
            <br />
        <div class="div">
        <table class="tabla3">
                  <tr>
                          <td></td>
                          <td></td>
                          <td>
                              <asp:Panel ID="Paneltabla" runat="server" Height="16px" Width="220px">
                               <div id="loginError2" style="border-color: #FFFFFF; font-family: Arial; font-size: 12px; color: #FF0000;">
                                <strong id="mensaje">Debe ingresar los campos requeridos!!!</strong>
                                </div>
                              </asp:Panel>
                          </td>
                     </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:Label ID="msjeprocedimiento" runat="server" Text="La descripcion ya existe!!" ForeColor="Red"></asp:Label>
                </td>
            </tr>
               
                        <tr>
                            <td></td>
                            <td>
                           
                                <asp:Label ID="Label5" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Descripcion"></asp:Label>
                            </td>
                            <td>
                            <asp:TextBox ID="txtdescripcion" runat="server" CssClass="textbox" Font-Size="10pt" ForeColor="Gray" Height="19px" Width="216px" MaxLength="50" required  ></asp:TextBox>
                                 </td>
                            <td class="auto-style20">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtdescripcion" ErrorMessage="*Ingrese solo letras" ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Width="200px"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Estado"></asp:Label>
                            </td>
                            <td  style="border-color: #CCCCCC">
                                <asp:DropDownList ID="DropEstado" runat="server" CssClass="textbox" Font-Size="10pt" ForeColor="Gray" Height="30px" Width="154px"  >
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style20"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Codigo Auxiliar"></asp:Label>
                            </td>
                            <td class="auto-style70">
                                <asp:TextBox ID="codAux" runat="server" CssClass="textbox" Font-Size="10pt" ForeColor="Gray" Height="19px" Width="91px" required MaxLength="25"></asp:TextBox>
                           
                             </td>
                            <td class="auto-style20">
                            </td>
                            
                        </tr>
                        <tr>
                            <td rowspan="3" class="auto-style75">
                                <asp:Image ID="Image_editar" runat="server" Height="114px" ImageUrl="~/Imagenes/iconos/Editar.ico" Width="150px" />
                                <asp:Image ID="img_nuevo" runat="server" Height="98px" ImageUrl="~/Imagenes/iconos/nuevo.ico" Width="149px" />
                            </td>
                            <td class="auto-style73">
                                <asp:Label ID="Label11" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Codigo Sistema"></asp:Label>
                            </td>
                            <td class="auto-style77">
                                <asp:TextBox ID="codSis" runat="server" CssClass="textbox" Font-Size="10pt" value="0" ForeColor="Gray" Height="19px" type="number" Width="91px" required Min="-2147483647" Max="2147483647" ></asp:TextBox>
                            </td>
                            <td rowspan="3" class="auto-style20">
                                
                            </td>
                            
                        </tr>
                       
                            <tr>
                             
                            <td class="auto-style73">&nbsp;</td>
                            <td class="auto-style77">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style78">
                                <asp:Button ID="Btnguardar_Tabla" runat="server" CssClass="BotonGris" Height="32px" OnClick="EnviarDatos" Text="Guardar" Width="105px" />
                            </td>
                            <td class="auto-style79">
                                
                                <asp:LinkButton ID="LbtnCancelar_Tabla" runat="server" CssClass="BotonGris" Height="21px" OnClick="BtnCancelar" style="text-align:center;padding-top:9px;text-decoration:none;" Text="Cancelar" Width="97px"></asp:LinkButton>

                            </td>
                            
                        </tr>
                  
             
          </table>
          </div>
    </asp:Panel>



    


      
    <%--<asp:CommandField HeaderText="Seleccione" CancelImageUrl="~/Imagenes/cancelar.jpg" CancelText="Cancelar" DeleteImageUrl="~/Imagenes/eliminar.jpg" DeleteText="Eliminar" EditImageUrl="~/Imagenes/editar.jpg" EditText="Editar" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="BotonRojo2">
                            <ControlStyle BackColor="#ff3300" CssClass="BotonRojo2" ForeColor="White" Width="60px"></ControlStyle>
                        </asp:CommandField>--%>
        <asp:Panel ID="PanelProcedimientos" runat="server" Width="825px" style="margin-left:auto;margin-right:auto" >
          <h2 class="Titulos">
              <asp:Label ID="lblprocedimiento" runat="server" Text="Nuevo Parametro"></asp:Label>
              &nbsp;</h2>
            <br />
        <table class="tabla3">
                   
                    <tr>
                          <td></td>
                          <td></td>
                          <td>
                              <asp:Panel ID="PanelProcedimiento" runat="server" >
                               <div id="Div1">
                                <strong id="Panelmensaje" runat="server" style="color: #FF0000">Debe ingresar los campos requeridos!!!</strong>
                           </div>
                              
                              </asp:Panel>
                          </td>
                     </tr>
            <tr>
                <td class="auto-style21" style="height: 24px"></td>
          
                <td class="auto-style83" style="height: 24px">
                    <asp:Label ID="Label10" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Tabla"></asp:Label>
                </td>
                <td class="auto-style82" style="height: 24px"><asp:TextBox ID="txtabla" runat="server" Height="19px" Width="269px" Font-Size="10pt" CssClass="textbox" ForeColor="Gray" Enabled="False" required ></asp:TextBox></td>
            </tr>

                         <tr>
                             <td class="auto-style20"></td>

                             <td class="auto-style23">
                                 <asp:Label ID="Label4" runat="server" Text="Descripcion" Font-Size="12pt" ForeColor="#666666"></asp:Label>
                             </td>
                             <td class="auto-style81">
                                
                                 <asp:TextBox ID="txtdescrip" runat="server" Height="19px" Width="269px" Font-Size="10pt" CssClass="textbox" ForeColor="Gray" required MaxLength="50" ></asp:TextBox>
                             
                             </td>
                             <td class="auto-style17">
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtdescrip" ErrorMessage="*Ingrese solo letras" ForeColor="Red" Height="22px" ValidationExpression="^[A-Za-z]*$" Width="96px"></asp:RegularExpressionValidator>
                             </td>
                              <td class="auto-style24"><div id="Div2" style="border-color: #FFFFFF; font-family: Arial; font-size: 12px; color: #FF0000; width: 100px;">
                               <asp:Panel ID="panel3" runat="server" Height="16px" Width="136px">
                                   <strong>La descripcion ya existe!!!</strong>
                                   </asp:Panel>
                               </div></td>
                         </tr>
        
                         <tr>
                             <td class="auto-style20">&nbsp;</td>
                             <td class="auto-style23">
                                 <asp:Label ID="Label6" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Estado"></asp:Label>
                             </td>
                             <td class="auto-style81">
                                 <asp:DropDownList ID="dropestado2" runat="server" CssClass="textbox" Font-Size="10pt" ForeColor="Gray" Height="30px" Width="128px">
                                 </asp:DropDownList>
                             </td>
                             <td class="auto-style17">&nbsp;</td>
                             <td class="auto-style24">&nbsp;</td>
                    </tr>
        
                         <tr>
                                <td class="auto-style21"></td>
                                <td class="auto-style83">
                                    <asp:Label ID="Label8" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Codigo Auxiliar"></asp:Label>
                                </td>
                                <td class="auto-style82">
                                    <asp:TextBox ID="codaux2" runat="server" CssClass="textbox" Height="19px" Width="91px" Font-Size="10pt" ForeColor="Gray" required MaxLength="25" ></asp:TextBox>
                                </td>
                                <td class="auto-style18"></td>
                             </tr>
             
                     <tr>
                         <td class="auto-style21">&nbsp;</td>
                         <td class="auto-style83">
                             <asp:Label ID="Label12" runat="server" Font-Size="12pt" ForeColor="#666666" Text="Codigo Sistema"></asp:Label>
                         </td>
                         <td class="auto-style82">
                             <asp:TextBox ID="codSis2" runat="server" CssClass="textbox" Font-Size="10pt" ForeColor="Gray" Height="19px" type="number" Width="91px" required Min="-2147483647" Max="2147483647" ></asp:TextBox>
                         </td>
                         <td class="auto-style18">&nbsp;</td>
                    </tr>
             
                     <tr>
                         <td>
                             <asp:Image ID="Imagen_nuevo" runat="server" Height="100px" ImageUrl="~/Imagenes/iconos/nuevo.ico" Width="182px" />
                         </td>
                         <td>
                             <asp:Button ID="BtnNuevo_param" runat="server" CssClass="BotonGris" Height="36px" OnClick="BtnNuevo_param_Click" Text="Guardar" Width="105px" />
                         </td>
                         <td>
                   
                             <asp:LinkButton ID="LbtnCancelar_param" runat="server" CssClass="BotonGris" Height="24px" OnClick="BtnCancelar" style="text-align:center;padding-top:10px;text-decoration:none;" Text="Cancelar" Width="97px"></asp:LinkButton>
                         </td>
                         <td rowspan="2" class="auto-style18" >
                             &nbsp;</td>
                     </tr>
                    
            <tr>
                <td></td>
                <td></td>
            </tr>
                    
          </table>
    </asp:Panel>

   </asp:Content>   