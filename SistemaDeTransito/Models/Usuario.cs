using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaDeTransito.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public int Cedula { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }

        public string ConfirmarClave { get; set; }
    }
}