﻿using CapaDatos;
using CapaDatos.Interfaces;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class EmpleadoLG
    {
        public Empleado BuscarEmpleado(int id)
        {
            IEmpleadoAD empleadoAD = null;

            return empleadoAD.BuscarPorID(id);
        }

        public Empleado BuscarPorUsuario(string usuario)
        {
            IEmpleadoAD empleadoAD = null;

            return empleadoAD.BuscarPorUsuario(usuario);

        }

        public bool EsUsuarioValido(string usuario, string clave)
        {
            IEmpleadoAD empleado = null;

            return empleado.EsUsuarioValido(usuario, clave);
        }

        public int GuardarEmpleado(Empleado empleado)
        {
            //IEmpleadoAD empleadoAD = null;
            EmpleadoAD empleadoAD = new EmpleadoAD();

            return empleadoAD.Guardar(empleado);
        }

        public static int ObtenerSecuencia()
        {
            ISecuencia obtenerSecuencia = new EmpleadoAD();

            return obtenerSecuencia.ObtenerSecuencia();
        }
    }
}
