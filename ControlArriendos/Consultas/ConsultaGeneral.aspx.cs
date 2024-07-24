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
    public partial class ConsultaGeneral : System.Web.UI.Page
    {
        string Titulo;
        int Editorial;
        string Autor;
        string Filtro;
        string Disponibilidad;

        string CadenaConexion = MasterPage.CadenaConexion;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GridP.Visible = true;
                PanelMsje.Visible = false;
                //Panel_mensaje.Visible = false;
                LlenaDropDownList();
                BuscarListaLibro();
                


            }
        }

        public void LlenaDropDownList()
        {

            DropEditorial.DataSource = PreparaAcceso.filtroEditorialLib(CadenaConexion);
            DropEditorial.DataTextField = "NOMEDI";
            DropEditorial.DataValueField = "CODEDI";
            DropEditorial.DataBind();
            DropEditorial.SelectedValue = "0";

            BuscarListaLibro();

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

            else if (FiltraAutor.Checked)
            {
                Filtro = "AUTOR";
            }

            else if (FiltraEditorial.Checked)
            {
                Filtro = "EDITORIAL";
            }
            else if (FiltraUbicacion.Checked)
            {
                Filtro = "UBICACION";
            }



            if (DisponbilidadTodos.Checked)
            {
                Disponibilidad = "0";
            }

            else if (DisponbilidadSi.Checked)
            {
                Disponibilidad = "1";
            }

            else if (DisponbilidadNo.Checked)
            {
                Disponibilidad = "2";
            }

            DataTable BuscarLibro2 = new DataTable();



                if (int.TryParse(DropEditorial.SelectedValue, out Editorial))
                {

                    Titulo = (!String.IsNullOrEmpty(TxtTitulo.Text)) ? TxtTitulo.Text : "";
                    Autor = (!String.IsNullOrEmpty(TxtAutor.Text)) ? TxtAutor.Text : "";
                    Editorial = Convert.ToInt32(DropEditorial.SelectedValue);

                    DataTable BuscarLibroTodos = new DataTable();
                    BuscarLibroTodos = PreparaAcceso.Buscar_SuperFiltro_lib(Titulo, Editorial, Autor, Filtro, Convert.ToInt32(Disponibilidad), CadenaConexion);
                    GridP.DataSource = BuscarLibroTodos;
                    GridP.DataBind();
                }
                else
                {
                    Console.WriteLine("El valor seleccionado no es un número válido.");
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

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TxtTitulo.Text = string.Empty;
            TxtAutor.Text = string.Empty;

            DropEditorial.SelectedIndex = 0;

            
            FiltraAutor.Checked = false;
            FiltraCodigo.Checked = false;
            FiltraEditorial.Checked = false;
            FiltraUbicacion.Checked = false;
            FiltraTitulo.Checked = true;

            
            DisponbilidadSi.Checked = false;
            DisponbilidadNo.Checked = false; 
            DisponbilidadTodos.Checked = true;
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string Editoriall = DropEditorial.SelectedValue;

            //ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<SCRIPT LANGUAGE='javascript'> alert(' El Libro  se ha visto actualizado con exito, Codigo :  " + Editoriall + "'); document.location = ('/Consultas/ConsultasPorEditorial.aspx');</SCRIPT>");

        }

    }
}