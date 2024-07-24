using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;
using Datos;
using System.Text.RegularExpressions;

namespace Negocios
{
    public class PreparaAcceso
    {
       

        public static DataTable BuscaParametrosPorTabla(int CodTab,string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ObtenerParamentrosPorTabla(CodTab,  CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }
        public static DataTable BuscaParametrosPadre(string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ObtenerParamentrosPadre(CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }
        public static DataTable BuscaListaParmetrosInfCompletaPorCodigo(int CodTab, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ObtenerParamentrosInfComPorCodigo(CodTab,CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable Crear_ParametroNuevo(int codTab, string CodDescrip, int CdoEstado, int cod_sis, string CodAux, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.CrearComParametroNuevo(codTab, CodDescrip, CdoEstado, cod_sis , CodAux, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
            //return AccesoDatos.Crear_NuevoParametro(codTab, CodDescrip,CdoEstado,CodAux,Comentario, usuario,CadenaConexion);
        }
        public static DataTable Crear_DescripPar(string Descrip, int estado, int cod_sis ,string cod_aux, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.CrearComandoTablaPar(Descrip, estado, cod_sis, cod_aux, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
            //return AccesoDatos.Crear_Descripcion_TablaPar(Descrip, estado, cod_aux, comentario, usuario,CadenaConexion);
        }
        public static DataTable Modificar_Descripcion(int codigo, string Descrip, int estado,int cod_sis, string cod_aux, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.CrearComandoModificaTabla(codigo, Descrip, estado, cod_sis, cod_aux, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
            //return AccesoDatos.Modificar_Descripcion_Tabla(codigo, Descrip, estado, cod_aux, comentario, usuario, CadenaConexion);
        }
        public static DataTable Modifica_Parametros(int codPar, int codigo, string CodDescrip, int CdoEstado, int cod_sis, string CodAux, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ActualizarParametros(codPar, codigo, CodDescrip, CdoEstado, cod_sis, CodAux, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
            //return AccesoDatos.Actualizar_Parametros(codPar,codigo,CodDescrip,CdoEstado,CodAux,Comentario,Session,CadenaConexion);
        }


       
        public static DataTable BuscarDatosTabPar_Cod(int codigo, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ObtenerDatosTabPar_Cod(codigo, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }



        //************************* FDiaz*****************************************************
        
        public static DataTable BuscaNombreParametrosPadre(int Codigo, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Busca_Nombre_Parametro_Padre(Codigo, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscaCodigoParametrosPorNombre(string Descripcion, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Busca_Codigo_Parametro_Por_Nombre(Descripcion, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }
        public static DataTable BuscarCabeceraPorNroHoja(Decimal NroHoja, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Cabecera_Por_NroHoja(NroHoja, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }
  


        // *****************    Funcion valida campos Vacios del formularios    ************************
        public static bool funsionValFormVacios(string[] arrayform)
        {
            bool var = true;
            // foreach que reccorre el ArrayForm buscando Campos Vacios o ceros retorna falso si los encuentra
            foreach (string elemento in arrayform)
            {
                if (elemento == string.Empty || elemento == "0")
                {
                    var = false;
                }
            }
            return var;
        }
        //*************************************************************************************************
        public static bool validarEmail(string email)
        {
            string expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";

            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                { return true; }
                else
                { return false; }
            }
            else
            { return false; }
        }
        // ************  Funcion que calcula el digito verificador del rut ingresado
        public static string Dv(string r)
        {
            int suma = 0;
            for (int x = r.Length - 1; x >= 0; x--)
                suma += int.Parse(char.IsDigit(r[x]) ? r[x].ToString() : "0") * (((r.Length - (x + 1)) % 6) + 2);
            int numericDigito = (11 - suma % 11);
            string digito = numericDigito == 11 ? "0" : numericDigito == 10 ? "K" : numericDigito.ToString();
            return digito;
        } 


        //*************************Diego*****************************************************

        public static DataTable LLenarListaLibro(string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.LLenar_Lista_Libro(CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }
        public static DataTable BuscarLibro(Decimal Cod, string Tit, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Libro(Cod, Tit, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable AgregaLibro(string TitLib, Decimal EdiLib, string AutLib, string UbiLib, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Agrega_Libro(TitLib, EdiLib, AutLib, UbiLib, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable ModificaLibro(Decimal Codigo, string Titulo, Decimal Editorial, string Autor, string Ubicacion, int Disponibilidad, string fecpre, string fecdev, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ActualizarLibro(Codigo, Titulo, Editorial, Autor, Ubicacion, Disponibilidad, fecpre, fecdev, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
            //return AccesoDatos.Actualizar_Parametros(codPar,codigo,CodDescrip,CdoEstado,CodAux,Comentario,Session,CadenaConexion);
        }

        public static DataTable BuscarEditorial2(string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ObtenerEditorial( CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarMax(string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_max(CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarLector(Decimal Rut, string Nombre, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Lector(Rut, Nombre, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable AgregaLector(Decimal eje_rut, string eje_nom, string eje_dir, int eje_tel, string eje_esc, string eje_cur, string eje_dig, int eje_com, int eje_ciu, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Agrega_Lector(eje_rut, eje_nom, eje_dir, eje_tel, eje_esc, eje_cur, eje_dig, eje_com, eje_ciu, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarComuna(int CodCiudad, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Comuna(CodCiudad, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable ModificaLector(Decimal eje_rut, string eje_nom, string eje_dir, int eje_tel, string eje_esc, string eje_cur, int eje_lib, string eje_dev, int eje_com, int eje_ciu, int eje_edo, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ActualizarLector(eje_rut, eje_nom, eje_dir, eje_tel, eje_esc, eje_cur, eje_lib, eje_dev, eje_com, eje_ciu, eje_edo, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
            //return AccesoDatos.Actualizar_Parametros(codPar,codigo,CodDescrip,CdoEstado,CodAux,Comentario,Session,CadenaConexion);
        }

        public static DataTable BuscarTitulo(string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Tit(CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static bool BuscaRutLector(decimal rut, string CadenaConexion)
        {
            bool var = false;
            IDataReader lector = AccesoDatos.BuscarRutLec(rut, CadenaConexion);
            while (lector.Read())
            {
                var = true;
            }
            return var;
        }

        public static DataTable BuscarEditorial(Decimal Codigo, string Nombre, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Editorial(Codigo, Nombre, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable AgregaEditorial(Decimal Codigo, string Nombre, string Direccion, int Telefono, int Fax, int Comuna, int Ciudad, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Agrega_Editorial(Codigo, Nombre, Direccion, Telefono, Fax, Comuna, Ciudad, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarMaxEditorial(string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_maxEd(CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable ModificaEditorial(Decimal Codigo, string Nombre, string Direccion, int Telefono, int Fax, int Comuna, int Ciudad, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.ActualizarEditorial(Codigo, Nombre, Direccion, Telefono, Fax, Comuna, Ciudad, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
            //return AccesoDatos.Actualizar_Parametros(codPar,codigo,CodDescrip,CdoEstado,CodAux,Comentario,Session,CadenaConexion);
        }

        public static DataTable BuscarAutor(string Autor, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Aut_Lec(Autor, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarAutorTit(string Autor, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Aut_Tit_Lec(Autor, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarAutorTodosTit(string Autor, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Aut_Todos_Lec(Autor, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarLibroTodos(int Editorial, string Filtro, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_Edi_Todos_Lec(Editorial, Filtro, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable filtroEditorialLib(string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_filtro_editorial_lib(CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarLibroTodosUbicacion(string Ubicacion, string Filtro, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_filtro_ubicacion_lib(Ubicacion, Filtro, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable BuscarLibroTodosPrestados(string Titulo, string Filtro, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_filtro_Prestado_lib(Titulo, Filtro, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }

        public static DataTable Buscar_SuperFiltro_lib(string Titulo, int Editorial, string Autor, string Filtro, int Disponibilidad, string CadenaConexion)
        {
            SqlCommand _comando = AccesoDatos.Buscar_filtro_Super_lib(Titulo, Editorial, Autor, Filtro, Disponibilidad, CadenaConexion);
            _comando.CommandType = CommandType.StoredProcedure;
            return AccesoDatos.EjecutarComando(_comando);
        }        
        
    }
}
