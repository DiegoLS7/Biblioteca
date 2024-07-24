<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="ControlArriendos.Consultas" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

     <script>
         $(document).ready(function () {
             $('#<%=txtFecha.ClientID%>').datepicker({
                 dateFormat: 'dd/mm/yy',
                 minDate: new Date('2014/01/01'),
                 maxDate: "+0m +0d",
                 changeMonth: true,
                 changeYear: true
             }).val();
         });
         $(document).ready(function () {
             $('#<%=txt_fecdev.ClientID%>').datepicker({
                  dateFormat: 'dd-mm-yy',
                  maxDate: "+0m +0d",
                  changeMonth: true,
                  changeYear: true
              }).val();
          });
      </script>
    <asp:Panel ID="PanelPrincipal" runat="server" Width="1143px" Height="157px">
 
          
   <div  align="center" style="width: 1700px">
       <br />
        <br />
    <h2 class="Titulos">Consultas </h2>
   <br />
       <br />

  <table  >
        <tr>
             <td>
                 <asp:Button ID="btnConsulta1" runat="server" Text="Guias" BackColor="#CCFF99" BorderStyle="None" ForeColor="Blue" Height="25px" OnClick="Consulta1_Click" Width="91px" /></td>
            <td style="width: 8px"></td>
             <td>
                 <asp:Button ID="btnConsulta2" runat="server" Text="Devoluciones" BackColor="#CCFF99" BorderStyle="None" ForeColor="Blue" Height="26px" OnClick="Consulta2_Click" Width="111px" /></td>
             <td style="width: 8px"></td>
            <td>
                 <asp:Button ID="btnConsulta3" runat="server" Text="Ensambles" BackColor="#CCFF99" BorderStyle="None" ForeColor="Blue" Height="26px" OnClick="Consulta3_Click" Width="143px" /></td>
        </tr>
     </table> 
            
     </div>
        
        <br />
        
 </asp:Panel> 

        <asp:Panel ID="PanelConsulta1" runat="server"  Width="1406px" Height="429px" >
         
        <div class="div" align="center" style="height: 423px">
            <br />

        <table class="tabla3" >
                  <tr>
                      <td style="width: 139px">
                          <asp:Panel ID="Panel_mensaje" runat="server" Visible="False">
                              <div id="Mensaje_informe" style="width: 141px">
                                  <strong style="color: #FF0000">¡EL INFORME ESTÁ SIN DATOS!</strong>
                              </div>
                          </asp:Panel>
                      </td>
                          <td>
                               <asp:ImageButton ID="BtnInforme" runat="server" Height="43px" ImageUrl="~/Imagenes/iconos/icoinforme.png" title="Exportar"  Width="54px" OnClick="BtnInforme_Click" />
                          </td>
                          <td style="width: 29px">  
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          </td>
                          <td>
                              <table>
                                  <tr>
                                      <td>Fecha Ingreso</td>
                                      <td>
                                           <asp:TextBox ID="txtFecha" runat="server" class="labelClass" Width="121px" CssClass="textbox" Height="16px" type="text" MaxLength="10" ></asp:TextBox>
                                        
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>Estado</td>
                                      <td>
                                         <asp:DropDownList ID="DropEstado" runat="server" Width="132px" CssClass="textbox"></asp:DropDownList>
                                      </td> 
                                  </tr>
                                  <tr>
                                      <td>Tipo de Equipo </td>
                                      <td>
                                          <asp:DropDownList ID="DropEquipo" runat="server" Width="132px" CssClass="textbox"></asp:DropDownList>
                                      </td>
                                  </tr>
                              </table>               
                          </td>
                      <td style="width: 13px">
                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        </td> 
                       <td>
                           <asp:Button ID="btn_limpiar" runat="server" Text="Limpiar"  Height="27px" Width="67px" OnClick="btn_limpiar_Click" CssClass="BotonGris" />
                       </td>
                       <td>
                             <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="BotonRojo" OnClick="BuscarGuias_Click" Height="26px" Width="65px" />
                       </td>                   
                     </tr> 
                     
             </table>
            <table>
                <tr>
                    <td style="width: 420px"></td>
                    <td>
                    <asp:GridView ID="GrillaConsulta" runat="server" AllowPaging="True" AllowSorting="True" AlternatingRowStyle-BackColor="#FA8258" AutoGenerateColumns="False" class="" HeaderStyle-BackColor="#6E6E6E" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" OnPageIndexChanging="GrillaConsulta_PageIndexChanging" OnSelectedIndexChanged="GrillaConsulta_SelectedIndexChanged" PageSize="7" RowStyle-BackColor="#D8D8D8" ShowFooter="True" Style="margin-bottom: 0px; margin-top: 0px;" Width="750px">
                        <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                        <AlternatingRowStyle BackColor="#E2E2E2" />
                        <Columns>
                            <asp:TemplateField HeaderText="Nro Guia">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("gce_nro_gce")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cliente">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("cli_nom_cli")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nom Usuario">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("gce_nom_usu")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nom Equipo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("gce_nom_eqp")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Usu Responsable">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("gce_usr_gce")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sucursal">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Sucursal")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Estado")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha Ingreso">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("gce_fec_gce")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo Equipo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Equipo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle HorizontalAlign="Center" Width="100px" />
                        <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
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
                            <h2 style="color:blue;">¡Sin datos!</h2>
                        </EmptyDataTemplate>
                        <HeaderStyle />
                        <RowStyle cssClass="Tabla_contenido" HorizontalAlign="Center" />
                        <SelectedRowStyle cssClass="Tabla_contenido" />
                    </asp:GridView>
                        </td>
                </tr>
            </table>
            &nbsp;
            
          </div>
    </asp:Panel>

        <asp:Panel ID="PanelConsulta2" runat="server" Width="1406px" Height="402px"  >

      <div class="div2" align="center">
        <table class="tabla4">
                  <tr>
                      <td style="width: 166px">
                          <asp:Panel ID="PanelMsje" runat="server" Visible="False">
                              <div id="mensajeinforme" style="width: 141px">
                                  <strong style="color: #FF0000">¡EL INFORME ESTÁ SIN DATOS!</strong>
                              </div>
                          </asp:Panel>
                      </td>
                          <td style="width: 64px">
                               <asp:ImageButton ID="btn_informedev" runat="server" Height="43px" ImageUrl="~/Imagenes/iconos/icoinforme.png" title="Exportar"  Width="54px" OnClick="btn_informedev_Click" />
                           </td>
                      <td style="width: 10px">
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      </td>
                      <td>
                          <table>
                             <tr>
                                  <td>Fecha Devolución</td>
                                  <td>
                                      <asp:TextBox ID="txt_fecdev" runat="server" class="labelClass" Width="132px" CssClass="textbox" Height="16px" MaxLength="10" ></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                <td>Cliente</td>
                                  <td> 
                                    <asp:DropDownList ID="DropCliente" runat="server" Width="142px" CssClass="textbox"></asp:DropDownList>
                                  </td>
                               </tr>
                              <tr>
                                   <td>Sucursal</td>
                                  <td>
                                      <asp:DropDownList ID="DropSucursal" runat="server" Width="142px" CssClass="textbox"></asp:DropDownList>
                                  </td>
                              </tr>
                          </table>
                          </td>
                          <td>
                               &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          </td>
                          <td>
                                <asp:Button ID="btn_limpiardev" runat="server" Text="Limpiar" CssClass="BotonGris" Height="27px" Width="67px" OnClick="btn_limpiardev_Click" />
                          </td>
                           <td>
                            <asp:Button ID="btn_buscar" runat="server" Text="Buscar" CssClass="BotonRojo" OnClick="btn_buscar_Click" Height="27px" Width="67px" />
                          </td>
               </tr> 
       </table>
      <table>
          <tr>
              <td style="width: 420px"></td>
              <td>
               <asp:GridView ID="GVDevolucion" runat="server" CellPadding="4"  RowStyle-BackColor="#D8D8D8" AlternatingRowStyle-BackColor="#FA8258" HeaderStyle-BackColor="#6E6E6E" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"  AutoGenerateColumns="False" AllowPaging="True"  Width="757px"  Height="30px"  PageSize="7" OnSelectedIndexChanged="GVDevolucion_SelectedIndexChanged" OnPageIndexChanging="GVDevolucion_PageIndexChanging" > 
                 <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Nro Guia">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("gce_nro_gce")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cliente">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("nombreCliente")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nom Usuario">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("gce_nom_usu")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nom Equipo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("gce_nom_eqp")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Usu Responsable">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("gce_usr_gce")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sucursal">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("sucursal")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("estado")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Última Fecha Devolución">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("FechaDevolucion")%>'></asp:Label>
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
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Rut</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Nombre</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px; font-weight:bold">Correo Electronico</td>
                                    <td style="padding-left: 10px; padding-right: 30px;font-family:Arial; font-size: 12px;font-weight:bold">Estado</td>
                                    <td></td>
                                </center>
                            </tr>
                        </table>
                    </div>
                    <h2 style="color:blue;">!Sin datos de Devoluciones!</h2>
                </EmptyDataTemplate>
                <HeaderStyle />
                <RowStyle cssClass="Tabla_contenido" HorizontalAlign="Center" />
                <SelectedRowStyle cssClass="Tabla_contenido" />
                   
            </asp:GridView>
             </td>
          </tr>

      </table>
          </div>
    </asp:Panel>
    <asp:Panel ID="PanelConsulta3" runat="server" Width="1406px" Height="319px" >
        <div class="div2" align="center">
            <table class="tabla4">
                <tr>
                    <td style="width: 193px">
                          <asp:Panel ID="PanelMsje1" runat="server" Visible="False">
                              <div id="Div1" style="width: 141px">
                                  <strong style="color: #FF0000">¡EL INFORME ESTÁ SIN DATOS!</strong>
                              </div>
                          </asp:Panel>
                      </td>
                    <td style="width: 75px">
                               <asp:ImageButton ID="ImageButton1" runat="server" Height="43px" ImageUrl="~/Imagenes/iconos/icoinforme.png" title="Exportar"  Width="54px" OnClick="btn_informe_ens_Click" />
                           </td>
                      <td style="width: 18px">
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      </td>
                      <td>
                          <table>
                              <tr>
                                <td>Cliente</td>
                                  <td> 
                                    <asp:DropDownList ID="DropRutCliente" runat="server" Width="142px" CssClass="textbox"></asp:DropDownList>
                                  </td>
                               </tr>
                          </table>
                          </td>
                          <td>
                               &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          </td>
                          <td>
                                <asp:Button ID="btn_limpiar_en" runat="server" Text="Limpiar" CssClass="BotonGris" Height="27px" Width="67px" OnClick="btn_limpiarens_Click" />
                          </td>
                           <td style="width: 91px">
                            <asp:Button ID="btn_buscar_en" runat="server" Text="Buscar" CssClass="BotonRojo" OnClick="btn_buscar_en_Click" Height="27px" Width="67px" />
                          </td>
               </tr> 
       </table>
        <table>
            <tr>
                <td style="width: 420px"></td>
                <td>
                
      
               <asp:GridView ID="GrillaEnsamble" runat="server" CellPadding="4"  RowStyle-BackColor="#D8D8D8" AlternatingRowStyle-BackColor="#FA8258" HeaderStyle-BackColor="#6E6E6E" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"  AutoGenerateColumns="False" AllowPaging="True"  Width="757px"  Height="30px"  PageSize="7" OnSelectedIndexChanged="GVDevolucion_SelectedIndexChanged" OnPageIndexChanging="GVDevolucion_PageIndexChanging" > 
                 <HeaderStyle CssClass="Tabla_comentario_cabecera" />
                <AlternatingRowStyle BackColor="#E2E2E2"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Nro Hoja Ensamble">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("che_nro_che")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rut">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Rut")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cliente">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("nombre")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tipo Equipo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("descripcion")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tecnico">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("tec_Ide_tec")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hardware">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("item")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marca">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("marca")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modelo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("modelo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EditRowStyle HorizontalAlign="Center" Width="100px" />
                    <HeaderStyle BackColor="#FF3300" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="30px"></RowStyle>
                <EmptyDataTemplate>
                    <div class="Tabla_comentario_cabecera">
                        <table cellpadding="4" class="Tabla_comentario_cabecera" gridlines="None">
                            
                        </table>
                    </div>
                    <h2 style="color:blue;">!Sin datos de Devoluciones!</h2>
                </EmptyDataTemplate>
                <HeaderStyle />
                <RowStyle cssClass="Tabla_contenido" HorizontalAlign="Center" />
                <SelectedRowStyle cssClass="Tabla_contenido" />
                   
            </asp:GridView>
             </td>
            </tr>
        </table>
          </div>
            <br />
   </asp:Panel>
   </asp:Content>





