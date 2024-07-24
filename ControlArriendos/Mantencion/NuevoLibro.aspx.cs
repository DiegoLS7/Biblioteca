using Negocios;
using Presentacion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ControlArriendos.Mantencion
{
    public partial class NuevoLibro : System.Web.UI.Page
    {
        string CadenaConexion = MasterPage.CadenaConexion;
        string TitLib;
        string EdiLib;
        string AutLib;
        string UbiLib;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable Editorial1 = new DataTable();
                Editorial1 = PreparaAcceso.BuscarEditorial2(CadenaConexion);

                DropEditorial.DataSource = Editorial1;
                DropEditorial.DataTextField = "NOMEDI";
                DropEditorial.DataValueField = "CODEDI";
                DropEditorial.DataBind();
                DropEditorial.SelectedValue = "-1";

                BuscarMaxLibro();
            }
        }

        public void BuscarMaxLibro()
        {
            string codigoLibro = TextBoxCodi.Text;

            DataTable BuscarLibro = new DataTable();
            BuscarLibro = PreparaAcceso.BuscarMax(CadenaConexion);

            if (BuscarLibro.Rows.Count > 0)
            {
                // Asignar el resultado al Text del TextBoxCodi
                //TextBoxCodi.Text = BuscarLibro.Rows[0]["MaximoLibro"].ToString();

            }

            else
            {
                // Limpiar el TextBoxCodi si no hay resultados
                TextBoxCodi.Text = string.Empty;
            }

        }

        protected void AgregarLibro_Click(object sender, EventArgs e)
        {
            if (DropEditorial.SelectedValue != "-1")
            {
                TitLib = txtTitulo.Text;
                EdiLib = DropEditorial.SelectedValue;
                AutLib = txtAutor.Text;
                UbiLib = txtUbicacion.Text;

                try
                {
                    PreparaAcceso.AgregaLibro(TitLib, Convert.ToDecimal(EdiLib), AutLib, UbiLib, CadenaConexion);
                    Response.Write("<script >alert('Libro ingresado Correctamente');location.href = 'Libros.aspx';</script>");

                }

                catch (Exception)
                {
                    Response.Write("<script >alert('Error Libro no se ha podido ingresar, verifique los campos ingresados ');</script>");
                }
                        }
            else if (DropEditorial.SelectedValue != "-1")
            {
                Response.Write("<script >alert('Verifique Seleccion de Editorial');</script>");

            }
            else
            {
                Response.Write("<script >alert('Verifique los campos agregados');</script>");
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtTitulo_TextChanged(object sender, EventArgs e)
        {

        }


    }
}