using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Presentacion
{
    public class DetalleParametros
    {

    }

    public class variables
    {
        public string nom_archivo { get; set; }
        public int cargos { get; set; }
    }

    public class Correo
    {
        public string mail { get; set; }
        public string host { get; set; }
        public string port { get; set; }
        public string username { get; set; }
    }

    public class Parametros
    {
        public int codigo { get; set; }
        public int cod_orden { get; set; }
        public string descripcion { get; set; }
        public int estado { get; set; }
    }

    public class Tabla_parametros {

        public int CodPar { get; set; }
        public int codigo { get; set; }
        public string CodDescrip { get; set; }
        public string CodAux { get; set; }
        public int CodSis { get; set; }
        public int CdoEstado { get; set; }
        
     
    }

    public class Codigo_TablasPadres
    {
        public static int codEstados = 1 ;
        public static int CodComunas = 2 ;
        public static int CodCiudades = 4 ;
        public static int CodEstadoEdo = 7;
  
    }

    public class Tabla_Detalle
    {

        public Decimal NroHoja { get; set; }
        public int Cor { get; set; }
        public int CodigoHrw { get; set; }
        public string Serie { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string Observacion { get; set; }

    }

    public class Tabla_Libro
    {

        public Decimal Codigo { get; set; }
        public string Titulo { get; set; }
        public Decimal Editorial { get; set; }
        public string Autor { get; set; }
        public string Ubicacion { get; set; }
        public int Disponibilidad { get; set; }
        public string fecpre { get; set; }
        public string fecdev { get; set; }
        public string CodigoLibro { get; set; }

    }

        public class Tabla_Lector
    {

        public Decimal eje_rut { get; set; }
        public string eje_nom { get; set; }
        public string eje_dir { get; set; }
        public int eje_tel { get; set; }
        public string eje_esc { get; set; }
        public string eje_cur { get; set; }
        public int eje_lib { get; set; }
        public string eje_dev { get; set; }
        public int eje_com { get; set; }
        public int eje_ciu { get; set; }
        public int eje_edo { get; set; }
    }


    public class Tabla_Editorial
    {

        public Decimal Codigo { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public int Telefono { get; set; }
        public int Fax { get; set; }
        public int Comuna { get; set; }
        public int Ciudad { get; set; }

    }

}
     
