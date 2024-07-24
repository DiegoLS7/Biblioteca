<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InformeParametros.aspx.cs" Inherits="ControlArriendos.Mantencion.Informes.InformeParametros" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table style="width:100%; height: 405px;">
        <tr>
            <td style="width: 413px">
    <asp:ImageButton ID="ImageButton1" runat="server" style="float:right" ImageUrl="~/Imagenes/iconos/atras.png" Height="63px" OnClick="ImageButton1_Click" Width="86px" />

            </td>
            <td rowspan="3" style="width: 1024px">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="1050px" BackColor="#99FFCC" BorderStyle="Groove" LinkDisabledColor="Red">
                </rsweb:ReportViewer>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 413px; height: 212px;"></td>
            <td style="height: 212px"></td>
        </tr>
        <tr>
            <td style="width: 413px; height: 37px;"></td>
            <td style="height: 37px"></td>
        </tr>
    </table>      
    </asp:Content>
