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

namespace ControlArriendos.Consultas
{
    public partial class ConsultaPorUbicacion : System.Web.UI.Page
    {

        string Editorial;
        string Filtro;
        string CadenaConexion = MasterPage.CadenaConexion;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GridP.Visible = true;
                PanelMsje.Visible = false;
                //Panel_mensaje.Visible = false;

                BuscarListaLibro();


            }
        }

        public void BuscarListaLibro()
        {
            if (FiltraCodigo.Checked)
            {
                Filtro = "CODIGO";

            }

            else if (FiltraTitulo.Checked)
            {
                Filtro = "TITULO";
            }

            DataTable BuscarLibro2 = new DataTable();
            if (Filtro == "CODIGO")
            {
                Editorial = (!String.IsNullOrEmpty(txtUbicacion.Text)) ? txtUbicacion.Text : "";

                DataTable BuscarLibroTodosUbicacion = new DataTable();
                BuscarLibroTodosUbicacion = PreparaAcceso.BuscarLibroTodosUbicacion(Editorial, Filtro, CadenaConexion);
                GridP.DataSource = BuscarLibroTodosUbicacion;
                GridP.DataBind();
            }

            else if (Filtro == "TITULO")
            {

                Editorial = (!String.IsNullOrEmpty(txtUbicacion.Text)) ? txtUbicacion.Text : "";

                DataTable BuscarLibroTodosUbicacion = new DataTable();
                BuscarLibroTodosUbicacion = PreparaAcceso.BuscarLibroTodosUbicacion(Editorial, Filtro, CadenaConexion);
                GridP.DataSource = BuscarLibroTodosUbicacion;
                GridP.DataBind();

            }



        }

        protected void BuscarLibro_Click(object sender, EventArgs e)
        {
            BuscarListaLibro();



        }

        protected void GridP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridP.PageIndex = e.NewPageIndex;
            BuscarListaLibro();
        }

        protected void GridP_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtTitulo_TextChanged(object sender, EventArgs e)
        {
            //string Editoriall = DropEditorial.SelectedValue;

            //ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<SCRIPT LANGUAGE='javascript'> alert(' El Libro  se ha visto actualizado con exito, Codigo :  " + Editoriall + "'); document.location = ('/Consultas/ConsultasPorEditorial.aspx');</SCRIPT>");

        }
    }
}