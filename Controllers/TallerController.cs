using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using api_taller.Entidad;
using api_taller.Logica;
using api_taller.Models;

namespace api_taller.Controllers
{
    public class TallerController : ApiController
    {
        [Route("api/cita/solicitar")]
        [HttpPost]
        public IHttpActionResult SolicitarCita(ECita cita)
        {
            try
            {
                LCita lCita = new LCita();
                var respuesta = lCita.Solicitar(cita);
                return Ok(ERespuesta<string>.Respuesta(respuesta));

            }
            catch (Exception ex)
            {
                return Ok(ERespuesta<string>.Respuesta(ex.Message));
            }
        }


        [Route("api/cita/confirmar")]
        [HttpPost]
        public IHttpActionResult ConfirmarCita(ECita cita)
        {
            try
            {
                LCita lCita = new LCita();
                var respuesta = lCita.Confirmar(cita);
                return Ok(ERespuesta<String>.Respuesta(respuesta));

            }
            catch (Exception ex)
            {
                return Ok(ERespuesta<string>.Respuesta(ex.Message));
            }
        }

        [Route("api/cita/clientesdia")]
        [HttpGet]
        public IHttpActionResult ClientesDia()
        {
            try
            {
                LCita lCita = new LCita();
                var respuesta = lCita.ClientesDia();
                return Ok(ERespuesta<List<ECliente>>.Respuesta(respuesta));

            }
            catch (Exception ex)
            {
                return Ok(ERespuesta<string>.Respuesta(ex.Message));
            }
        }


    }
}
