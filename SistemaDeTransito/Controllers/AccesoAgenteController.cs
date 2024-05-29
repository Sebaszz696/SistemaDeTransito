using SistemaDeTransito.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace SistemaDeTransito.Controllers
{
    public class AccesoAgenteController : Controller
    {
        static string cadena = "Data source=STEFANY; Initial Catalog=dbUnaulaTransito;Integrated Security=true";

        public ActionResult AgenteLogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AgenteLogin(Agente oAgente)
        {
           
            try
            {
                oAgente.Contraseña = ConvertirSha256(oAgente.Contraseña);
                using (SqlConnection cn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_ValidarAgente", cn);
                    cmd.Parameters.AddWithValue("Cedula", oAgente.Cedula);
                    cmd.Parameters.AddWithValue("Contraseña", oAgente.Contraseña);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            oAgente.Cedula = Convert.ToInt32(reader["Cedula"]);
                            oAgente.IdAgente = Convert.ToInt32(reader["IdAgente"]);
                        }
                    }
                }

                if (oAgente.IdAgente != 0)
                {
                    Session["agente"] = oAgente;
                    return RedirectToAction("RegistrarMulta", "Agente");
                }
                else
                {
                    ViewData["Mensaje"] = "Usuario o contraseña incorrecto";
                    return View();
                }
            }
            catch (Exception)
            {
                if (oAgente.IdAgente != 0)
                {
                    Session["agente"] = oAgente;
                    return RedirectToAction("RegistrarMulta", "Agente");
                }
                else
                {
                    ViewData["Mensaje"] = "Usuario o contraseña incorrecto";
                    return View();
                }
            }
           

        }

        public static string ConvertirSha256(string texto)
        {
            StringBuilder Sb = new StringBuilder();
            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                byte[] result = hash.ComputeHash(enc.GetBytes(texto));

                foreach (byte b in result)
                    Sb.Append(b.ToString("x2"));
            }

            return Sb.ToString();
        }
    }
}
