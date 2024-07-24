using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Presentacion;


namespace ControlArriendos
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        static string cadenaconexion = ConfigurationManager.ConnectionStrings["CadenaConexion"].ConnectionString;

        public static string CadenaConexion
        {
            get { return cadenaconexion; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {

                
            }

        }
    }
}