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
    public partial class NuevoLector : System.Web.UI.Page
    {
        string CadenaConexion = MasterPage.CadenaConexion;
        string eje_rut;
        string eje_nom;
        string eje_dir;
        string eje_tel;
        string eje_esc;
        string eje_cur;
        string eje_dig;
        string eje_com;
        string eje_ciu;
        

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




        protected void AgregarLector_Click(object sender, EventArgs e)
        {
            if (DropDownCiudad.SelectedValue != "-1" & DropDownComuna.SelectedValue != "-1")
            {
                eje_rut = txtRut.Text;
                eje_nom = txtNombre.Text;
                eje_dir = txtDireccion.Text;
                eje_tel = txtTelefono.Text;
                eje_esc = txtEscuela.Text;
                eje_cur = txtCurso.Text;
                eje_dig = PreparaAcceso.Dv(eje_rut);
                eje_com = DropDownComuna.SelectedValue;
                eje_ciu = DropDownCiudad.SelectedValue;

                string rut = eje_rut;

                try
                {

                    if (PreparaAcceso.BuscaRutLector(Convert.ToDecimal(rut), CadenaConexion) == false)
                    {

                        PreparaAcceso.AgregaLector(Convert.ToDecimal(eje_rut), eje_nom, eje_dir, Convert.ToInt32(eje_tel), eje_esc, eje_cur, eje_dig, Convert.ToInt32(eje_com), Convert.ToInt32(eje_ciu), CadenaConexion);
                        Response.Write("<script >alert('Lector ingresado Correctamente, Rut: " + rut + "');location.href = 'Lectores.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script >alert('Rut " + rut + " de Lector ya Existe');</script>");
                    }

                }

                catch (Exception)
                {
                    Response.Write("<script >alert('Error Lector no se ha podido ingresar, verifique los campos ingresados ');</script>");
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



    }
}