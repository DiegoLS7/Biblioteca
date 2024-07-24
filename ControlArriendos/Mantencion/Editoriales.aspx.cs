using Negocios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.SessionState;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Diagnostics;
using Microsoft.Win32;
using System.ComponentModel;
using Presentacion;

namespace ControlArriendos.Mantencion
{
    public partial class Editoriales : System.Web.UI.Page
    {

        decimal Codigo;
        string Nombre;
        string CadenaConexion = MasterPage.CadenaConexion;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BuscarListaEditorial();
                GridP.Visible = true;
                PanelMsje.Visible = false;
                //Panel_mensaje.Visible = false;
                //CargarComunasDefault();

            }
        }

        public void BuscarListaEditorial()
        {

            Codigo = (!String.IsNullOrEmpty(txtCodigo.Text)) ? Convert.ToDecimal(txtCodigo.Text) : 0;
            Nombre = (!String.IsNullOrEmpty(TextNombre.Text)) ? TextNombre.Text : "";
            DataTable BuscarLector = new DataTable();
            BuscarLector = PreparaAcceso.BuscarEditorial(Codigo, Nombre, CadenaConexion);
            GridP.DataSource = BuscarLector;
            GridP.DataBind();
        }

        protected void BuscarEditorial_Click(object sender, EventArgs e)
        {
            BuscarListaEditorial();
        }

        protected void GridP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridP.PageIndex = e.NewPageIndex;
            BuscarListaEditorial();
        }

        protected void GridP_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void NuevaEditorial_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Mantencion/NuevaEditorial.aspx");
        }

        protected void ActualizarRegistro(object sender, GridViewEditEventArgs e)
        {
            GridP.EditIndex = e.NewEditIndex;
            BuscarListaEditorial();

            DropDownList combo2 = GridP.Rows[e.NewEditIndex].FindControl("DropDownCiudad") as DropDownList;
            DataTable BuscarCiudad = new DataTable();
            BuscarCiudad = PreparaAcceso.BuscaParametrosPorTabla(Codigo_TablasPadres.CodCiudades, CadenaConexion);

            combo2.DataSource = BuscarCiudad;
            combo2.DataTextField = "par_des_par";
            combo2.DataValueField = "par_cod_par";
            combo2.DataBind();

            Label Label8 = GridP.Rows[e.NewEditIndex].FindControl("Label8") as Label;
            string ciudad = Label8.Text;


            int indiceSeleccionado2 = -1;
            for (int i = 0; i < combo2.Items.Count; i++)
            {
                if (combo2.Items[i].Text == ciudad)
                {
                    indiceSeleccionado2 = i;
                    break;
                }
            }

            combo2.SelectedIndex = indiceSeleccionado2;

            int ciudadId = Convert.ToInt32(combo2.SelectedValue);

            CargarComunas(ciudadId);

        }

        protected void DropDownCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList combo2 = (DropDownList)sender;
            GridViewRow row = (GridViewRow)combo2.NamingContainer;
            DropDownList combo3 = row.FindControl("DropDownComuna") as DropDownList;

            int ciudadId = Convert.ToInt32(combo2.SelectedValue);

            CargarComunas(ciudadId);
        }

        private void CargarComunas(int ciudadId)
        {
            DataTable comunas = PreparaAcceso.BuscarComuna(ciudadId, CadenaConexion);

            DropDownList combo3 = GridP.Rows[GridP.EditIndex].FindControl("DropDownComuna") as DropDownList;

            combo3.DataSource = comunas;
            combo3.DataTextField = "par_des_par";
            combo3.DataValueField = "par_cod_par";
            combo3.DataBind();

            combo3.Enabled = true;
        }

        protected void Update_Registro(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Decimal cod;

                Tabla_Editorial edi = new Tabla_Editorial();

                edi.Codigo = Convert.ToDecimal(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[0].Controls[1]).Text);
                edi.Nombre = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[1].Controls[1]).Text);
                edi.Direccion = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[2].Controls[1]).Text);
                edi.Telefono = Convert.ToInt32(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[3].Controls[1]).Text);
                edi.Fax = Convert.ToInt32(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[4].Controls[1]).Text);
                edi.Ciudad = Convert.ToInt32(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[5].Controls[1]).SelectedValue);
                edi.Comuna = Convert.ToInt32(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[6].Controls[1]).SelectedValue);

                DataTable ActualizaDetalle = new DataTable();
                ActualizaDetalle = PreparaAcceso.ModificaEditorial(edi.Codigo, edi.Nombre, edi.Direccion, edi.Telefono, edi.Fax, edi.Comuna, edi.Ciudad, CadenaConexion);

                cod = edi.Codigo;

                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<SCRIPT LANGUAGE='javascript'> alert(' La editorial  se ha visto actualizado con exito, Codigo :  " + cod + "'); document.location = ('/Mantencion/Editoriales.aspx');</SCRIPT>");
                GridP.EditIndex = -1;
                BuscarListaEditorial();
            }
            catch (Exception exp)
            {
                Response.Write(exp.Message);
            }
        }

        protected void CancelarRegistro(object sender, GridViewCancelEditEventArgs e)
        {
            GridP.EditIndex = -1;
            BuscarListaEditorial();
        }

        protected void txtRut_TextChanged(object sender, EventArgs e)
        {

        }


        protected void txtTitulo_TextChanged(object sender, EventArgs e)
        {

        }

    }
}