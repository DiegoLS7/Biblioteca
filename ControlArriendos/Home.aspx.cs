
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net; // rescatar IP

namespace ControlArriendos
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

             if (!IsPostBack)
            {
                 Session["IPUsuario"] ="";
                 Session["NomUsuario"] ="";
                    ////******************RESCATA IP DE USUARIO LOCALMENTE *************************//
                    string strHostName = string.Empty;
                    // Getting Ip address of local machine…
                    // First get the host name of local machine.
                    strHostName = Dns.GetHostName();
                    // Then using host name, get the IP address list..
                    IPAddress[] hostIPs = Dns.GetHostAddresses(strHostName);
                    for (int i = 0; i < hostIPs.Length; i++)
                        {
                          Session["IPUsuario"] = hostIPs[i].ToString();
                        }
                    Session["NomUsuario"] = strHostName;
             }
        }
    }
}