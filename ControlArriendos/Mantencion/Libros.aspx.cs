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
    public partial class Libros : System.Web.UI.Page
    {
        decimal Cod;
        string Tit;
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

            Cod = (!String.IsNullOrEmpty(txtCod.Text)) ? Convert.ToDecimal(txtCod.Text) : 0;
            Tit = (!String.IsNullOrEmpty(TextTitulo.Text)) ? TextTitulo.Text : "";
            DataTable BuscarLibro = new DataTable();
            BuscarLibro = PreparaAcceso.BuscarLibro(Cod, Tit, CadenaConexion);
            GridP.DataSource = BuscarLibro;
            GridP.DataBind();
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

        protected void NuevoLibro_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Mantencion/NuevoLibro.aspx");
        }

        protected void ActualizarRegistro(object sender, GridViewEditEventArgs e)
        {
            GridP.EditIndex = e.NewEditIndex;
            BuscarListaLibro();

            DropDownList combo = GridP.Rows[e.NewEditIndex].FindControl("DropDisponibilidad") as DropDownList;
            DataTable BuscarDisponibilidad = new DataTable();
            BuscarDisponibilidad = PreparaAcceso.BuscaParametrosPorTabla(Codigo_TablasPadres.codEstados, CadenaConexion);

            combo.DataSource = BuscarDisponibilidad;
            combo.DataTextField = "par_des_par";
            combo.DataValueField = "par_cod_par";
            combo.DataBind();

            Label Label8 = GridP.Rows[e.NewEditIndex].FindControl("Label8") as Label;
            string disponibilidad = Label8.Text;


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

            //DROPLISTA PARA EDITORIAL//

            DropDownList combo2 = GridP.Rows[e.NewEditIndex].FindControl("DropEditorial") as DropDownList;
            DataTable BuscarEditorial = new DataTable();
            BuscarEditorial = PreparaAcceso.BuscarEditorial2(CadenaConexion);

            combo2.DataSource = BuscarEditorial;
            combo2.DataTextField = "NOMEDI";
            combo2.DataValueField = "CODEDI";
            combo2.DataBind();

            Label Label3 = GridP.Rows[e.NewEditIndex].FindControl("Label3") as Label;
            string editorial = Label3.Text;


            int indiceSeleccionado2 = -1;
            for (int i = 0; i < combo2.Items.Count; i++)
            {
                if (combo2.Items[i].Text == editorial)
                {
                    indiceSeleccionado2 = i;
                    break;
                }
            }


            combo2.SelectedIndex = indiceSeleccionado2;



            GridViewRow editRow = GridP.Rows[e.NewEditIndex];
            TextBox TextBoxCodigo = (TextBox)editRow.FindControl("TextBoxCodigo");
            TextBoxCodigo.Enabled = false;
        }

        protected void Update_Registro(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Decimal codigoLibro;

                Tabla_Libro lib = new Tabla_Libro();

                lib.Codigo = Convert.ToDecimal(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[0].Controls[1]).Text);
                lib.Titulo = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[1].Controls[1]).Text);
                lib.Editorial = Convert.ToDecimal(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[2].Controls[1]).SelectedValue);
                lib.Autor = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[3].Controls[1]).Text);
                lib.Ubicacion = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[4].Controls[1]).Text);
                lib.Disponibilidad = Convert.ToInt32(((System.Web.UI.WebControls.DropDownList)GridP.Rows[e.RowIndex].Cells[6].Controls[1]).SelectedValue);
                lib.fecpre = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[7].Controls[1]).Text);
                lib.fecdev = Convert.ToString(((System.Web.UI.WebControls.TextBox)GridP.Rows[e.RowIndex].Cells[8].Controls[1]).Text);


                DataTable ActualizaDetalle = new DataTable();
                ActualizaDetalle = PreparaAcceso.ModificaLibro(lib.Codigo, lib.Titulo, lib.Editorial, lib.Autor, lib.Ubicacion, lib.Disponibilidad, lib.fecpre, lib.fecdev, CadenaConexion);

                codigoLibro = lib.Codigo;

                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<SCRIPT LANGUAGE='javascript'> alert(' El Libro  se ha visto actualizado con exito, Codigo :  " + codigoLibro + "'); document.location = ('/Mantencion/Libros.aspx');</SCRIPT>");
                GridP.EditIndex = -1;
                BuscarListaLibro();
            }
            catch (Exception exp)
            {
                Response.Write(exp.Message);
            }
        }

        protected void CancelarRegistro(object sender, GridViewCancelEditEventArgs e)
        {
            GridP.EditIndex = -1;
            BuscarListaLibro();
        }

        protected void txtRut_TextChanged(object sender, EventArgs e)
        {

        }

    }
}