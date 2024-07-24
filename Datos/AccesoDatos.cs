using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

namespace Datos
{
    public  class AccesoDatos
    {
        //**************** EejecutarComando es publico y usado por todas las consultas **************
        public static DataTable EjecutarComando(SqlCommand _comando)
        {
            DataTable _tabla = new DataTable();
            try
            {
                _comando.Connection.Open();
                SqlDataAdapter _adaptador = new SqlDataAdapter();
                _adaptador.SelectCommand = _comando;
                _adaptador.Fill(_tabla);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _comando.Connection.Close();
            }
            return _tabla;
        }

        public static IDataReader BuscarGuia(Decimal NroGuia, string CadenaConexion)
        {

            SqlConnection Conexion = new SqlConnection(CadenaConexion);
            SqlCommand cmd = new SqlCommand("CE_Existe_Numero_Guia", Conexion);
            cmd.Parameters.AddWithValue("@NroGuia", NroGuia);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                Conexion.Open();
                IDataReader lector = cmd.ExecuteReader();
                return lector;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static SqlCommand ActualizarParametros(int codPar, int codigo, string CodDescrip, int CdoEstado, int cod_sis, string CodAux, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Modifica_parametros", _conexion);
            _comando.Parameters.AddWithValue("@CodPar", codPar);
            _comando.Parameters.AddWithValue("@codigo", codigo);
            _comando.Parameters.AddWithValue("@CodDescrip", CodDescrip);
            _comando.Parameters.AddWithValue("@CodEstado", CdoEstado);
            _comando.Parameters.AddWithValue("@CodSis", cod_sis);
            _comando.Parameters.AddWithValue("@CodAux", CodAux);
            _comando.Connection.Close();
            return _comando;
        }
        public static SqlCommand CrearComandoTablaPar(string Descripcion, int estado, int cod_sis, string cod_aux, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Agrega_Par", _conexion);
            _comando.Parameters.AddWithValue("@Descripcion", Descripcion);
            _comando.Parameters.AddWithValue("@Estado", estado);
            _comando.Parameters.AddWithValue("@CodSis", cod_sis);
            _comando.Parameters.AddWithValue("@Cod_aux", cod_aux);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand CrearComandoModificaTabla(int codigo, string Descripcion, int estado, int cod_sis, string cod_aux, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Modifica_parametros_tabla", _conexion);
            _comando.Parameters.AddWithValue("@codigo", codigo);
            _comando.Parameters.AddWithValue("@CodDescrip", Descripcion);
            _comando.Parameters.AddWithValue("@CdoEstado", estado);
            _comando.Parameters.AddWithValue("@CodSis", cod_sis);
            _comando.Parameters.AddWithValue("@CodAux", cod_aux);
            _comando.Connection.Close();
            return _comando;
        }


        public static SqlCommand CrearComParametroNuevo(int codTab, string CodDescrip, int CdoEstado, int cod_sis, string CodAux, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Nuevo_parametro", _conexion);
            _comando.Parameters.AddWithValue("@CodTab", codTab);
            _comando.Parameters.AddWithValue("@CodDescrip", CodDescrip);
            _comando.Parameters.AddWithValue("@CodEstado", CdoEstado);
            _comando.Parameters.AddWithValue("@CodSis", cod_sis);
            _comando.Parameters.AddWithValue("@CodAux", CodAux);
            
            _comando.Connection.Close();
            return _comando;
        }
        public static SqlCommand GenerarNumGuia(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Genera_Numero_GCE", _conexion);
            _comando.Connection.Close();
            return _comando;
        }

      
        public static SqlCommand ObtenerDatosTabPar_Cod(int codigo, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Busca_DatosTabPar_Cod ", _conexion);
            _comando.Parameters.AddWithValue("@cod", codigo);
            _comando.Connection.Close();
            return _comando;
        }       
        
        public static SqlCommand Busca_Nombre_Parametro_Padre(int Codigo, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Busca_Nombre_Parametro_padre", _conexion);
            _comando.Parameters.AddWithValue("@Codigo", Codigo);
            _comando.Connection.Close();
            return _comando;
        }
       
        public static SqlCommand Busca_Codigo_Parametro_Por_Nombre(string Descripcion, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Busca_Codigo_Parametro_Por_Nombre", _conexion);
            _comando.Parameters.AddWithValue("@Descripcion", Descripcion);
            _comando.Connection.Close();
            return _comando;
        }
        public static SqlCommand Buscar_Cabecera_Por_NroHoja(Decimal NroHoja, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Buscar_Cabecera_Por_NroHoja", _conexion);
            _comando.Parameters.AddWithValue("@NroHoja", NroHoja);
            _comando.Connection.Close();
            return _comando;
        }


        //************************* Jvasquez **************************************************
        public static SqlCommand ObtenerParamentrosPorTabla(int CodTab, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Busca_Parametro_Por_Tabla_DL", _conexion);
            _comando.Parameters.AddWithValue("@PCODTAB", CodTab);
        
            _comando.Connection.Close();
            return _comando;
        }
        public static SqlCommand ObtenerParamentrosPadre(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_Busca_Parametro_Padre", _conexion);
            _comando.Connection.Close();
            return _comando;
        }
        public static SqlCommand ObtenerParamentrosInfComPorCodigo(int CodTab, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("CE_ListaParametroCompletos_PorCodigo", _conexion);
            _comando.Parameters.AddWithValue("@PCODTAB", CodTab);
            _comando.Connection.Close();
            return _comando;
        }

 
        //*************************DIEGO*****************************************************

        public static SqlCommand LLenar_Lista_Libro(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Mostrar_Libros_DL", _conexion);
            _comando.Connection.Close();
            return _comando;
        }
        public static SqlCommand Buscar_Libro(Decimal Cod, string Tit, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Buscar_Libros_DL", _conexion);
            _comando.Parameters.AddWithValue("@Cod", Cod);
            _comando.Parameters.AddWithValue("@Tit", Tit);
            _comando.Connection.Close();
            return _comando;
        }


        public static SqlCommand Agrega_Libro(string TitLib, Decimal EdiLib, string AutLib, string UbiLib, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Agregar_Libro_DL", _conexion);
            _comando.Parameters.AddWithValue("@TitLib", TitLib);
            _comando.Parameters.AddWithValue("@EdiLib", EdiLib);
            _comando.Parameters.AddWithValue("@AutLib", AutLib);
            _comando.Parameters.AddWithValue("@UbiLib", UbiLib);

            _comando.Connection.Close();
            return _comando;
        }


        public static SqlCommand ActualizarLibro(Decimal Codigo, string Titulo, Decimal Editorial, string Autor, string Ubicacion, int Disponibilidad, string fecpre, string fecdev, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Actualiza_Ejemplar_DL", _conexion);
            _comando.Parameters.AddWithValue("@Codigo", Codigo);
            _comando.Parameters.AddWithValue("@Titulo", Titulo);
            _comando.Parameters.AddWithValue("@Editorial", Editorial);
            _comando.Parameters.AddWithValue("@Autor", Autor);
            _comando.Parameters.AddWithValue("@Ubicacion", Ubicacion);
            _comando.Parameters.AddWithValue("@Disponibilidad", Disponibilidad);
            _comando.Parameters.AddWithValue("@fecpre", fecpre);
            _comando.Parameters.AddWithValue("@fecdev", fecdev);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand ObtenerEditorial(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Buscar_Editorial_DL", _conexion);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_max(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Buscar_Max_DL", _conexion);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_Lector(Decimal Rut, string Nombre, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Buscar_Lectores_DL", _conexion);
            _comando.Parameters.AddWithValue("@Rut", Rut);
            _comando.Parameters.AddWithValue("@Nombre", Nombre);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Agrega_Lector(Decimal eje_rut, string eje_nom, string eje_dir, int eje_tel, string eje_esc, string eje_cur, string eje_dig, int eje_com, int eje_ciu, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Agr_Lec_DL", _conexion);
            _comando.Parameters.AddWithValue("@eje_rut", eje_rut);
            _comando.Parameters.AddWithValue("@eje_nom", eje_nom);
            _comando.Parameters.AddWithValue("@eje_dir", eje_dir);
            _comando.Parameters.AddWithValue("@eje_tel", eje_tel);
            _comando.Parameters.AddWithValue("@eje_esc", eje_esc);
            _comando.Parameters.AddWithValue("@eje_cur", eje_cur);
            _comando.Parameters.AddWithValue("@eje_dig", eje_dig);
            _comando.Parameters.AddWithValue("@eje_com", eje_com);
            _comando.Parameters.AddWithValue("@eje_ciu", eje_ciu);

            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_Comuna(int CodCiudad, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Busca_Comuna_por_Ciudad_DL", _conexion);
            _comando.Parameters.AddWithValue("@CodCiudad", CodCiudad);
            _comando.Connection.Close();
            return _comando;
        }


        public static SqlCommand ActualizarLector(Decimal eje_rut, string eje_nom, string eje_dir, int eje_tel, string eje_esc, string eje_cur, int eje_lib, string eje_dev, int eje_com, int eje_ciu, int eje_edo, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Act_Lec_DL", _conexion);
            _comando.Parameters.AddWithValue("@eje_rut", eje_rut);
            _comando.Parameters.AddWithValue("@eje_nom", eje_nom);
            _comando.Parameters.AddWithValue("@eje_dir", eje_dir);
            _comando.Parameters.AddWithValue("@eje_tel", eje_tel);
            _comando.Parameters.AddWithValue("@eje_esc", eje_esc);
            _comando.Parameters.AddWithValue("@eje_cur", eje_cur);
            _comando.Parameters.AddWithValue("@eje_lib", eje_lib);
            _comando.Parameters.AddWithValue("@eje_dev", eje_dev);
            _comando.Parameters.AddWithValue("@eje_com", eje_com);
            _comando.Parameters.AddWithValue("@eje_ciu", eje_ciu);
            _comando.Parameters.AddWithValue("@eje_edo", eje_edo);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_Tit(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Cod_por_Tit_DL", _conexion);
            _comando.Connection.Close();
            return _comando;
        }

        public static IDataReader BuscarRutLec(Decimal rut, string CadenaConexion)
        {

            SqlConnection Conexion = new SqlConnection(CadenaConexion);
            SqlCommand cmd = new SqlCommand("LI_ver_rut_lec_DL", Conexion);
            cmd.Parameters.AddWithValue("@rut", rut);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                Conexion.Open();
                IDataReader lector = cmd.ExecuteReader();
                return lector;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static SqlCommand Buscar_Editorial(Decimal Codigo, string Nombre, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Bus_Edi_DL", _conexion);
            _comando.Parameters.AddWithValue("@Codigo", Codigo);
            _comando.Parameters.AddWithValue("@Nombre", Nombre);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Agrega_Editorial(Decimal Codigo, string Nombre, string Direccion, int Telefono, int Fax, int Comuna, int Ciudad, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Agr_Edi_DL", _conexion);
            _comando.Parameters.AddWithValue("@Codigo", Codigo);
            _comando.Parameters.AddWithValue("@Nombre", Nombre);
            _comando.Parameters.AddWithValue("@Direccion", Direccion);
            _comando.Parameters.AddWithValue("@Telefono", Telefono);
            _comando.Parameters.AddWithValue("@Fax", Fax);
            _comando.Parameters.AddWithValue("@Comuna", Comuna);
            _comando.Parameters.AddWithValue("@Ciudad", Ciudad);

            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_maxEd(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Buscar_Max_DL", _conexion);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand ActualizarEditorial(Decimal Codigo, string Nombre, string Direccion, int Telefono, int Fax, int Comuna, int Ciudad, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Act_Edi_DL", _conexion);
            _comando.Parameters.AddWithValue("@Codigo", Codigo);
            _comando.Parameters.AddWithValue("@Nombre", Nombre);
            _comando.Parameters.AddWithValue("@Direccion", Direccion);
            _comando.Parameters.AddWithValue("@Telefono", Telefono);
            _comando.Parameters.AddWithValue("@Fax", Fax);
            _comando.Parameters.AddWithValue("@Comuna", Comuna);
            _comando.Parameters.AddWithValue("@Ciudad", Ciudad);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_Aut_Lec(string Autor, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Bus_Aut_Eje_DL", _conexion);
            _comando.Parameters.AddWithValue("@Autor", Autor);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_Aut_Tit_Lec(string Autor, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Bus_Aut_Eje_Tit_DL", _conexion);
            _comando.Parameters.AddWithValue("@Autor", Autor);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_Aut_Todos_Lec(string Autor, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Bus_Aut_Eje_DL", _conexion);
            _comando.Parameters.AddWithValue("@Autor", Autor);
            _comando.Connection.Close();
            return _comando;
        }


        public static SqlCommand Buscar_Edi_Todos_Lec(int Editorial, string Filtro, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_fil_lec_todo_DL", _conexion);
            _comando.Parameters.AddWithValue("@Editorial", Editorial);
            _comando.Parameters.AddWithValue("@Filtro", Filtro);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_filtro_editorial_lib(string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_Filtro_EDI_DL", _conexion);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_filtro_ubicacion_lib(string Ubicacion, string Filtro, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_fil_ubic_todo_DL", _conexion);
            _comando.Parameters.AddWithValue("@Ubicacion", Ubicacion);
            _comando.Parameters.AddWithValue("@Filtro", Filtro);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_filtro_Prestado_lib(string Titulo, string Filtro, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_fil_Pre_todo_DL", _conexion);
            _comando.Parameters.AddWithValue("@Titulo", Titulo);
            _comando.Parameters.AddWithValue("@Filtro", Filtro);
            _comando.Connection.Close();
            return _comando;
        }

        public static SqlCommand Buscar_filtro_Super_lib(string Titulo, int Editorial, string Autor, string Filtro, int Disponibilidad, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);
            SqlCommand _comando = new SqlCommand("LI_fil_Super_todo_DL", _conexion);
            _comando.Parameters.AddWithValue("@Titulo", Titulo);
            _comando.Parameters.AddWithValue("@Editorial", Editorial);
            _comando.Parameters.AddWithValue("@Autor", Autor);
            _comando.Parameters.AddWithValue("@Filtro", Filtro);
            _comando.Parameters.AddWithValue("@Disponibilidad", Disponibilidad);
            _comando.Connection.Close();
            return _comando;
        }

    }
}
