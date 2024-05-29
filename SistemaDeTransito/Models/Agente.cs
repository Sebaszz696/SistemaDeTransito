using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaDeTransito.Models
{
    public class Agente
    {
        
        public int IdAgente { get; set; }
        public int Cedula { get; set; }
        public string Nombre { get; set; }
        public string Rango { get; set; }
        public string Contraseña { get; set; }

    }
  
}