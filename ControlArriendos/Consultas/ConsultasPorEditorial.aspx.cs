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
    public partial class ConsultasPorEditorial : System.Web.UI.Page
    {

        int Editorial;
        string Filtro;
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
            //DataTable Editorial2 = new DataTable();


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
            else if (FiltraEditorial.Checked)
            {
                Filtro = "EDITORIAL";
            }
            else if (FiltraTitulo.Checked)
            {
                Filtro = "TITULO";
            }

            DataTable BuscarLibro2 = new DataTable();
            if (Filtro == "CODIGO")
            {

                if (int.TryParse(DropEditorial.SelectedValue, out Editorial))
                {
                    //Editorial = 0;

                    Editorial = Convert.ToInt32(DropEditorial.SelectedValue);

                    DataTable BuscarLibroTodos = new DataTable();
                    BuscarLibroTodos = PreparaAcceso.BuscarLibroTodos(Editorial, Filtro, CadenaConexion);
                    GridP.DataSource = BuscarLibroTodos;
                    GridP.DataBind();
                }
                else
                {
                    // Manejar el caso en que la conversión no fue exitosa 
                    Console.WriteLine("El valor seleccionado no es un número válido.");
                }
            }
            else if (Filtro == "EDITORIAL")
            {

                if (int.TryParse(DropEditorial.SelectedValue, out Editorial))
                {
                    //Editorial = 0;

                    Editorial = Convert.ToInt32(DropEditorial.SelectedValue);

                    DataTable BuscarLibroTodos = new DataTable();
                    BuscarLibroTodos = PreparaAcceso.BuscarLibroTodos(Editorial, Filtro, CadenaConexion);
                    GridP.DataSource = BuscarLibroTodos;
                    GridP.DataBind();
                }
                else
                {
                    // Manejar el caso en que la conversión no fue exitosa 
                    Console.WriteLine("El valor seleccionado no es un número válido.");
                }
            }
            else if (Filtro == "TITULO")
            {

                if (int.TryParse(DropEditorial.SelectedValue, out Editorial))
                {
                    //Editorial = 0;

                    Editorial = Convert.ToInt32(DropEditorial.SelectedValue);

                    DataTable BuscarLibroTodos = new DataTable();
                    BuscarLibroTodos = PreparaAcceso.BuscarLibroTodos(Editorial, Filtro, CadenaConexion);
                    GridP.DataSource = BuscarLibroTodos;
                    GridP.DataBind();
                }
                else
                {
                    // Manejar el caso en que la conversión no fue exitosa 
                    Console.WriteLine("El valor seleccionado no es un número válido.");
                }
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

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string Editoriall = DropEditorial.SelectedValue;

            //ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<SCRIPT LANGUAGE='javascript'> alert(' El Libro  se ha visto actualizado con exito, Codigo :  " + Editoriall + "'); document.location = ('/Consultas/ConsultasPorEditorial.aspx');</SCRIPT>");
        
        }


    }


}