using SistemaDeTransito.Models;
using SistemaDeTransito.Permisos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaDeTransito.Controllers
{
    [ValidarSesion]
    public class HomeController : Controller
    {
        static string cadena = "Data Source=STEFANY; Initial Catalog=dbUnaulaTransito; Integrated Security=True";

        public ActionResult Index()
        {
            // Obtenemos el usuario actualmente logueado
            Usuario usuario = (Usuario)Session["usuario"];
            if (usuario != null)
            {
                // Aquí obtienes la cédula del usuario
                int cedulaUsuario = usuario.Cedula;

                // Obtenemos las multas registradas para el usuario logueado
                List<Multa> multas = ObtenerMultasRegistradasPorCedula(cedulaUsuario);

                // Pasamos las multas filtradas a la vista usando ViewBag
                ViewBag.Multas = multas;
                ViewBag.Correo = usuario.Correo; // Añadimos el correo del usuario a ViewBag
                ViewBag.Cedula = cedulaUsuario;
            }
            else
            {
                // Manejo de sesión no válida o usuario no logueado
                return RedirectToAction("Login", "Acceso");
            }

            // Actualizamos las estadísticas globales
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_ObtenerEstadisticasMultas", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    // Obtener la cantidad de multas Tipo 1 2 y 3 de la tabla EstadisticaMultas
                    if (reader["IdTipoMulta"].ToString() == "1")
                    {
                        ViewBag.CantidadTipoA = reader["Cantidad"];
                    }
                    else if (reader["IdTipoMulta"].ToString() == "2")
                    {
                        ViewBag.CantidadTipoB = Convert.ToInt32(reader["Cantidad"]);
                    }
                    else if (reader["IdTipoMulta"].ToString() == "3")
                    {
                        ViewBag.CantidadTipoC = Convert.ToInt32(reader["Cantidad"]);
                    }
                }
            }

            // Si no hay valores para las multas simples o complejas, establecerlos en 0
            if (ViewBag.CantidadTipoA == null)
            {
                ViewBag.CantidadTipoA = 0;
            }

            if (ViewBag.CantidadTipoB == null)
            {
                ViewBag.CantidadTipoB = 0;
            }

            if (ViewBag.CantidadTipoC == null)
            {
                ViewBag.CantidadTipoC = 0;
            }

            return View();
        }

        private List<Multa> ObtenerMultasRegistradasPorCedula(int cedula)
        {
            List<Multa> multasRegistradas = new List<Multa>();

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("ObtenerMultasPorCedula", cn); 
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Cedula", cedula);

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Multa multa = new Multa
                    {
                        Id = Convert.ToInt32(reader["IdMulta"]),
                        Placa = reader["Placa"].ToString(),
                        Cedula = Convert.ToInt32(reader["Cedula"]),
                        IdTipoMulta = Convert.ToInt32(reader["IdTipoMulta"]),
                        FechaMulta = Convert.ToDateTime(reader["FechaMulta"]),
                        Estado = reader["Estado"].ToString()
                    };
                    multasRegistradas.Add(multa);
                }
            }

            return multasRegistradas;
        }

        public ActionResult PagarMulta(int id)
        {
            // Lógica para procesar el pago de la multa con el ID dado
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_PagarMulta", cn); // Procedimiento almacenado para pagar la multa
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdMulta", id);

                cn.Open();
                cmd.ExecuteNonQuery();
            }

            // Redirigir de vuelta al índice después de pagar
            return RedirectToAction("Index");
        }

        public ActionResult CerrarSesion()
        {
            Session["usuario"] = null;
            Session["agente"] = null;
            return RedirectToAction("Login", "Acceso");
        }
    }
}
