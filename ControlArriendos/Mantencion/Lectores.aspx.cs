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
    public partial class Lectores : System.Web.UI.Page
    {
        decimal Rut;
        string Nombre;
        string CadenaConexion = MasterPage.CadenaConexion;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BuscarListaLector();
                GridP.Visible = true;
                PanelMsje.Visible = false;
                //Panel_mensaje.Visible = false;
                //CargarComunasDefault();

            }

        }

        public void BuscarListaLector()
        {

            Rut = (!String.IsNullOrEmpty(txtRut.Text)) ? Convert.ToDecimal(txtRut.Text) : 0;
            Nombre = (!String.IsNullOrEmpty(TextNombre.Text)) ? TextNombre.Text : "";
            DataTable BuscarLector = new DataTable();
            BuscarLector = PreparaAcceso.BuscarLector(Rut, Nombre, CadenaConexion);
            GridP.DataSource = BuscarLector;
            GridP.DataBind();
        }

        protected void BuscarLector_Click(object sender, EventArgs e)
        {
            BuscarListaLector();
        }


        protected void GridP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridP.PageIndex = e.NewPageIndex;
            BuscarListaLector();
        }

        protected void GridP_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void NuevoLector_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Mantencion/NuevoLector.aspx");
        }

        protected void ActualizarRegistro(object sender, GridViewEditEventArgs e)
        {
            GridP.EditIndex = e.NewEditIndex;
            BuscarListaLector();

            DropDownList combo = GridP.Rows[e.NewEditIndex].FindControl("DropDownDisponible") as DropDownList;
            DataTable BuscarDisponibilidad = new DataTable();
            BuscarDisponibilidad = PreparaAcceso.BuscaParametrosPorTabla(Codigo_TablasPadres.CodEstadoEdo, CadenaConexion);

            combo.DataSource = BuscarDisponibilidad;
            combo.DataTextField = "par_des_par";
            combo.DataValueField = "par_cod_par";
            combo.DataBind();

            Label Label10 = GridP.Rows[e.NewEditIndex].FindControl("Label10") as Label;
            string disponibilidad = Label10.Text;


            int indiceSeleccionado = -1;
            for (int i = 0; i < combo.Items.Count; i++)
            {
                if (combo.Items[i].Text == disponibilidad)
                {
                    indiceSeleccionado = i;
                    break;
                }
            }


            combo.SelectedIndex = indiceSeleccionado;

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



            //TextBox textBoxUltimo = GridP.Rows[e.NewEditIndex].FindControl("TextBoxUltimo") as TextBox;



            //string ultimo = textBoxUltimo.Text;


            DropDownList combo4 = GridP.Rows[e.NewEditIndex].FindControl("DropDownUltimo") as DropDownList;
            DataTable BuscarTit = new DataTable();
            BuscarTit = PreparaAcceso.BuscarTitulo(CadenaConexion);

            combo4.DataSource = BuscarTit;
            combo4.DataTextField = "TITLIB";
            combo4.DataValueField = "CODLIB";
            combo4.DataBind();

            ListItem listItemSeleccionar = new ListItem(" ", "0");

            combo4.Items.Insert(0, listItemSeleccionar);
            combo4.SelectedIndex = 0;

            Label LabelUltimo = GridP.Rows[e.NewEditIndex].FindControl("LabelUltimo") as Label;

            string ultimo = LabelUltimo.Text;

            int indiceSeleccionado4 = -1;
            for (int i = 0; i < combo.Items.Count; i++)
            {
                if (combo4.Items[i].Text == ultimo)
                {
                    indiceSeleccionado4 = i;
                    break;
                }
            }

            combo4.SelectedIndex = indiceSeleccionado4;


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
                Decimal Rut;

                Tabla_Lector lec = new Tabla_Lector();

                lec.eje_rut = Convert.ToDecimal(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[0].Controls[1]).Text);
                lec.eje_nom = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[1].Controls[1]).Text);
                lec.eje_dir = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[2].Controls[1]).Text);
                lec.eje_tel = Convert.ToInt32(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[3].Controls[1]).Text);
                lec.eje_esc = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[4].Controls[1]).Text);
                lec.eje_cur = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[5].Controls[1]).Text);
                lec.eje_lib = Convert.ToInt32(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[6].Controls[1]).SelectedValue);
                //lec.eje_lib = Convert.ToInt32(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].FindControl("TextBoxUltimo")).Text);
                lec.eje_dev = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[7].Controls[1]).Text);
                lec.eje_ciu = Convert.ToInt32(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[8].Controls[1]).SelectedValue);
                lec.eje_com = Convert.ToInt32(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[9].Controls[1]).SelectedValue);
                lec.eje_edo = Convert.ToInt32(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[10].Controls[1]).SelectedValue);


                DataTable ActualizaDetalle = new DataTable();
                ActualizaDetalle = PreparaAcceso.ModificaLector(lec.eje_rut, lec.eje_nom, lec.eje_dir, lec.eje_tel, lec.eje_esc, lec.eje_cur, lec.eje_lib, lec.eje_dev, lec.eje_com, lec.eje_ciu, lec.eje_edo, CadenaConexion);

                Rut = lec.eje_rut;

                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<SCRIPT LANGUAGE='javascript'> alert(' El Lector  se ha visto actualizado con exito, Codigo :  " + Rut + "'); document.location = ('/Mantencion/Lectores.aspx');</SCRIPT>");
                GridP.EditIndex = -1;
                BuscarListaLector();
            }
            catch (Exception exp)
            {
                Response.Write(exp.Message);
            }
        }


        protected void CancelarRegistro(object sender, GridViewCancelEditEventArgs e)
        {
            GridP.EditIndex = -1;
            BuscarListaLector();
        }

        protected void txtRut_TextChanged(object sender, EventArgs e)
        {

        }


        protected void txtTitulo_TextChanged(object sender, EventArgs e)
        {

        }


    }
}