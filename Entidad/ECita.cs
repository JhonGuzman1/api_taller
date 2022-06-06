using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_taller.Entidad
{
    public class ECita
    {
        public long Id { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public string Descripcion { get; set; }
        public long IdCliente { get; set; }
        public long IdTaller { get; set; }
        public int Estado { get; set; }

    }
}