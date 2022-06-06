using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace api_taller.Entidad
{
    [DataContract]
    public class ERespuesta<T>
    {
      


        [DataMember]
        public T Data { get; set; }

        public static ERespuesta<T> Respuesta( T respuesta)
        {
            ERespuesta<T> erespuesta = new ERespuesta<T>();
            erespuesta.Data = respuesta;
            return erespuesta;
        }
      


      
    }
}