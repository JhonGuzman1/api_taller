using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_taller.Entidad
{
    public class ECliente
    {
        public long Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
    }
}