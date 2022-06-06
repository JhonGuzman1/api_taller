using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using api_taller.Models;
using api_taller.Entidad;
using api_taller.Configuracion;

namespace api_taller.Logica
{
    public class LCita
    {

      

        public string Solicitar(ECita ecita)
        {

            try
            {
                using (var db = new dbTallerEntities())
                {

                    ExisteCliente(ecita.IdCliente);
                    ExisteTaller(ecita.IdTaller);


                    Cita cita = new Cita()
                    {
                        Fecha = ecita.Fecha,
                        Hora = ecita.Hora,
                        Descripcion = ecita.Descripcion,
                        Estado = (int)EstadoCita.Solicitud,
                        IdCliente = ecita.IdCliente,
                        IdTaller = ecita.IdTaller

                    };

                    db.Cita.Add(cita);

                    db.SaveChanges();

                    return "Se registro la cita";
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public string Confirmar(ECita ecita)
        {

            try
            {
                using (var db = new dbTallerEntities())
                {

                    string respuesta = "";

                    var cita = (from x in db.Cita
                                where x.Estado == (int)EstadoCita.Solicitud
                                && x.Id == ecita.Id
                                select x).First();

                    if(ecita.Estado == (int)EstadoCita.Aceptada)
                    {
                        cita.Estado = (int)EstadoCita.Aceptada;
                        db.SaveChanges();
                        respuesta = "Se confirmo la cita";
                    }
                    else if(ecita.Estado == (int)EstadoCita.Rechazada)
                    {
                        cita.Estado = (int)EstadoCita.Rechazada;
                        db.SaveChanges();
                        respuesta = "Se rechazo la cita";
                    }
                    else
                    {
                        respuesta = "El estado no es valido";
                    }

                   

                    return respuesta;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public List<ECliente> ClientesDia()
        {

            try
            {
                using (var db = new dbTallerEntities())
                {
                    List<ECliente> eClientes = new List<ECliente>();

                    DateTime fechaActual = DateTime.Now.Date;

                    var clientes = (from x in db.Cita
                                    where x.Fecha == fechaActual
                                    select x.Cliente).ToList();
                   
                    foreach(var i in clientes)
                    {

                        ECliente eCliente = new ECliente()
                        {
                            Id = i.Id,
                            Nombre = i.Nombre,
                            Apellido = i.Apellido,
                            FechaNacimiento = i.FechaNacimiento,
                            Direccion = i.Direccion
                        };

                        eClientes.Add(eCliente);

                    }

                     return eClientes;

                }
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }



        }


        public void ExisteCliente(long Id)
        {

            try
            {
                using (var db = new dbTallerEntities())
                {
                    var cliente = (from x in db.Cliente
                                   where x.Id == Id
                                   select x).First();
                }
            }
            catch(Exception ex)
            {
                throw new Exception("El cliente no existe");
            }
           
        }

        public void ExisteTaller(long Id)
        {

            try
            {
                using (var db = new dbTallerEntities())
                {
                    var taller = (from x in db.Taller
                                   where x.Id == Id
                                   select x).First();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("El taller no existe");
            }

        }


    }
}