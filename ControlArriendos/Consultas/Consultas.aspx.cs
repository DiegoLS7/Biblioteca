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

namespace ControlArriendos.Consultas
{
    public partial class Consultas : System.Web.UI.Page
    {
        string Autor;
        string CadenaConexion = MasterPage.CadenaConexion;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BuscarListaLibro();
                GridP.Visible = true;
                PanelMsje.Visible = false;
                //Panel_mensaje.Visible = false;




            }
        }

        public void BuscarListaLibro()
        {

            Autor = (!String.IsNullOrEmpty(txtAutor.Text)) ? txtAutor.Text : "";
            DataTable BuscarLector = new DataTable();
            BuscarLector = PreparaAcceso.BuscarAutorTodosTit(Autor, CadenaConexion);
            GridP.DataSource = BuscarLector;
            GridP.DataBind();



            if (FiltraCodigo.Checked)
            {
                DataTable BuscarLector2 = new DataTable();
                BuscarLector2 = PreparaAcceso.BuscarAutor(Autor, CadenaConexion);
                GridP.DataSource = BuscarLector2;
                GridP.DataBind();
            }
            else if (FiltraTitulo.Checked)
            {
                DataTable BuscarAutorTit = new DataTable();
                BuscarAutorTit = PreparaAcceso.BuscarAutorTit(Autor, CadenaConexion);
                GridP.DataSource = BuscarAutorTit;
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

        protected void txtRut_TextChanged(object sender, EventArgs e)
        {

        }

    }
}