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
    public partial class NuevaEditorial : System.Web.UI.Page
    {

        string CadenaConexion = MasterPage.CadenaConexion;
        string Codigo;
        string Nombre;
        string Direccion;
        string Telefono;
        string Fax;
        string Comuna;
        string Ciudad;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //LoadComboArtist();

                DataTable Ciudad1 = new DataTable();

                Ciudad1 = PreparaAcceso.BuscaParametrosPorTabla(Codigo_TablasPadres.CodCiudades, CadenaConexion);
                DropDownCiudad.DataSource = Ciudad1;
                DropDownCiudad.DataValueField = "par_cod_par";
                DropDownCiudad.DataTextField = "par_des_par";
                DropDownCiudad.DataBind();
                DropDownCiudad.SelectedValue = "-1";

                BuscarMaxEditorial();

            }

        }

        protected void DropDownCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownComuna.Items.Clear();

            if (!string.IsNullOrEmpty(DropDownCiudad.SelectedValue))
            {
                int ciudadId = int.Parse(DropDownCiudad.SelectedValue);
                DataTable comunas = PreparaAcceso.BuscarComuna(ciudadId, CadenaConexion);

                if (comunas.Rows.Count > 0)
                {
                    DropDownComuna.DataSource = comunas;
                    DropDownComuna.DataValueField = "par_cod_par";
                    DropDownComuna.DataTextField = "par_des_par"; 
                    DropDownComuna.DataBind();
                }
                else
                {
                    DropDownComuna.Items.Add(new ListItem("No hay comunas para esta Ciudad", ""));
                }
            }
            else
            {
                DropDownComuna.Items.Add(new ListItem("Por favor, escoja una ciudad", ""));
            }
        }

        public void BuscarMaxEditorial()
        {
            string codigoEditorial = txtCodigo.Text;

            DataTable BuscarEditorial = new DataTable();
            BuscarEditorial = PreparaAcceso.BuscarMaxEditorial(CadenaConexion);

            if (BuscarEditorial.Rows.Count > 0)
            {
                // Asignar el resultado al Text del TextBoxCodi
                txtCodigo.Text = BuscarEditorial.Rows[0]["MaximaEditorial"].ToString();

            }

            else
            {
                // Limpiar el TextBoxCodi si no hay resultados
                txtCodigo.Text = string.Empty;
            }

        }

        protected void AgregarEditorial_Click(object sender, EventArgs e)
        {
            if (DropDownCiudad.SelectedValue != "-1" & DropDownComuna.SelectedValue != "-1")
            {
                Codigo = txtCodigo.Text;
                Nombre = txtNombre.Text;
                Direccion = txtDireccion.Text;
                Telefono = txtTelefono.Text;
                Fax = txtFax.Text;
                Comuna = DropDownComuna.SelectedValue;
                Ciudad = DropDownCiudad.SelectedValue;

                string cod = Codigo;

                try
                {

                    {

                        PreparaAcceso.AgregaEditorial(Convert.ToDecimal(Codigo), Nombre, Direccion, Convert.ToInt32(Telefono), Convert.ToInt32(Fax), Convert.ToInt32(Comuna), Convert.ToInt32(Ciudad), CadenaConexion);
                        Response.Write("<script >alert('Editorial ingresada Correctamente, Codigo: " + cod + "');location.href = 'Editoriales.aspx';</script>");
                    }
    

                }

                catch (Exception)
                {
                    Response.Write("<script >alert('Error Editorial no se ha podido ingresar, verifique los campos ingresados ');</script>");
                }
            }

            else if (DropDownComuna.SelectedValue == "-1" & DropDownComuna.SelectedValue != "-1")
            {
                Response.Write("<script >alert('Debe ingresar correctamente el campo de Comuna');</script>");

            }
            else if (DropDownComuna.SelectedValue != "-1" & DropDownComuna.SelectedValue == "-1")
            {
                Response.Write("<script >alert('Debe ingresar correctamente el campos de Ciudad');</script>");
            }
            else
            {
                Response.Write("<script >alert('Debe ingresar correctamente los campos de Ciudad, Comuna');</script>");
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtCodigo_TextChanged(object sender, EventArgs e)
        {

        }
          


    }
}