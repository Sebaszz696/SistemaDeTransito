using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;
using SistemaDeTransito.Models;
using SistemaDeTransito.Permisos;

namespace SistemaDeTransito.Controllers
{
    [ValidarAgenteSesion]
    public class AgenteController : Controller
    {
        static string cadena = "Data Source=STEFANY; Initial Catalog=dbUnaulaTransito; Integrated Security=True";

        public ActionResult RegistrarMulta()
        {
            List<Multa> multas = ObtenerMultasRegistradas();
            ViewBag.Multas = multas;
            ViewData["Title"] = "Multas";
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarMulta(Multa multa)
        {
            try
            {
                // Recuperar el agente de la sesión
                Agente agente = Session["agente"] as Agente;

                if (agente == null)
                {
                    ViewBag.Error = "Debe iniciar sesión para registrar una multa.";
                    return View();
                }

                multa.IdAgente = agente.IdAgente; // Asignar el IdAgente de la sesión a la multa
                
                using (SqlConnection cn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_RegistrarMulta", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Placa", multa.Placa);
                    cmd.Parameters.AddWithValue("@Cedula", multa.Cedula);
                    cmd.Parameters.AddWithValue("@IdAgente", multa.IdAgente);
                    cmd.Parameters.AddWithValue("@IdTipoMulta", multa.IdTipoMulta);
                    cmd.Parameters.AddWithValue("@FechaMulta", multa.FechaMulta);
                    cmd.Parameters.AddWithValue("@Estado", multa.Estado);

                    cn.Open();
                    cmd.ExecuteNonQuery();
                }

                ViewBag.Mensaje = "La multa se registró correctamente.";
                var multasRegistradas = ObtenerMultasRegistradas();
                ViewBag.Multas = multasRegistradas;
                ViewData["Title"] = "Multas";
                return View();
            }
            catch (Exception ex)
            {

                ViewBag.Error = "Ocurrió un error al registrar la multa: " + ex.Message;
                return View();
            }
        }

        private List<Multa> ObtenerMultasRegistradas()
        {
            List<Multa> multasRegistradas = new List<Multa>();

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("ObtenerMultas", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Multa multa = new Multa
                    {
                        Id = Convert.ToInt32(reader["IdMulta"]),
                        Placa = reader["Placa"].ToString(),
                        Cedula = Convert.ToInt32(reader["Cedula"]),
                        IdAgente = Convert.ToInt32(reader["IdAgente"]),
                        IdTipoMulta = Convert.ToInt32(reader["IdTipoMulta"]),
                        FechaMulta = Convert.ToDateTime(reader["FechaMulta"]),
                        Estado = reader["Estado"].ToString()
                    };
                    multasRegistradas.Add(multa);
                }
            }

            return multasRegistradas;
        }

        private void EliminarMulta(int id)
        {
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_EliminarMulta", cn);
                cmd.Parameters.AddWithValue("@IdMulta", id);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // POST: Multa/Eliminar/5
        [HttpPost]
        public ActionResult Eliminar(int id)
        {
            try
            {
                // Llamada al método para eliminar la multa en la base de datos
                EliminarMulta(id);

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // Manejo de errores
                return Json(new { success = false, message = ex.Message });
            }
        }

        private Multa ObtenerMultaPorId(int id)
        {
            Multa multa = new Multa();

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_ObtenerMultaPorId", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdMulta", id);

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    multa.Id = Convert.ToInt32(reader["IdMulta"]);
                    multa.Placa = reader["Placa"].ToString();
                    multa.Cedula = Convert.ToInt32(reader["Cedula"]);
                    multa.IdAgente = Convert.ToInt32(reader["IdAgente"]);
                    multa.IdTipoMulta = Convert.ToInt32(reader["IdTipoMulta"]);
                    multa.FechaMulta = Convert.ToDateTime(reader["FechaMulta"]);
                    multa.Estado = reader["Estado"].ToString();
                }
            }

            return multa;
        }


        private void ActualizarMulta(int id, Multa multa)
        {
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_ActualizarMulta", cn);
                cmd.Parameters.AddWithValue("@IdMulta", id);
                cmd.Parameters.AddWithValue("@Placa", multa.Placa);
                cmd.Parameters.AddWithValue("@Cedula", multa.Cedula);
                cmd.Parameters.AddWithValue("@IdAgente", multa.IdAgente);
                cmd.Parameters.AddWithValue("@IdTipoMulta", multa.IdTipoMulta);
                cmd.Parameters.AddWithValue("@FechaMulta", multa.FechaMulta);
                cmd.Parameters.AddWithValue("@Estado", multa.Estado);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }
      
       
        
        [HttpPost]
        public ActionResult EditarMulta(Multa multa)
        {
            try
            {
                // Recuperar el agente de la sesión
                Agente agente = Session["agente"] as Agente;

                if (agente == null)
                {
                    ViewBag.Error = "Debe iniciar sesión para registrar una multa.";
                    return View();
                }
                // Aquí puedes validar los datos de la multa si es necesario
                multa.IdAgente = agente.IdAgente;

                using (SqlConnection cn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_ActualizarMulta", cn);
                    cmd.Parameters.AddWithValue("@IdMulta", multa.Id);
                    cmd.Parameters.AddWithValue("@Placa", multa.Placa);
                    cmd.Parameters.AddWithValue("@Cedula", multa.Cedula);
                    cmd.Parameters.AddWithValue("@IdAgente", multa.IdAgente);
                    cmd.Parameters.AddWithValue("@IdTipoMulta", multa.IdTipoMulta);
                    cmd.Parameters.AddWithValue("@FechaMulta", multa.FechaMulta);
                    cmd.Parameters.AddWithValue("@Estado", multa.Estado);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Redirige a alguna página de éxito o muestra un mensaje de éxito en la misma vista
                ViewBag.Mensaje = "La multa se actualizó correctamente.";
                return RedirectToAction("RegistrarMulta"); // Redirige a la página principal o de lista
            }
            catch (Exception ex)
            {
                // Manejo de errores: puedes mostrar un mensaje de error o redirigir a una página de error
                ViewBag.Error = "Ocurrió un error al actualizar la multa: " + ex.Message;
                return View("Editar", multa); // Vuelve a la vista de edición con los datos actuales
            }
        }
        public ActionResult CerrarSesion()
        {
            Session["usuario"] = null;
            Session["agente"] = null;
            return RedirectToAction("AgenteLogin", "AccesoAgente");
        }
    }
}
