using System;
using System.ComponentModel.DataAnnotations;

namespace SistemaDeTransito.Models
{
    public class Multa
    {
        public int Id { get; set; }
        public int Cedula { get; set; }
        public string Placa { get; set; }
       
        public string Estado { get; set; }
        public int IdAgente { get; set; }
        public int IdTipoMulta { get; set; }
        public DateTime FechaMulta { get; set; }

        public Multa()
        {
        }

        // Constructor
        public Multa(int id, int cedula, string placa, int idTipoMulta, string estado, int idAgente, DateTime fechaMulta)
        {
            Id = id;
            Cedula = cedula;
            Placa = placa;
            IdTipoMulta = idTipoMulta;
            Estado = estado;
            IdAgente = idAgente;
            FechaMulta = fechaMulta;
        }
    }
}
