using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_taller.Configuracion
{
    public enum EstadoCita: int
    {
        Solicitud = 0,
        Aceptada = 1,
        Rechazada = 2
    }
}