using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Mvc;

namespace SistemaDeTransito.Permisos
{
    public class ValidarAgenteSesionAttribute : ActionFilterAttribute
    {

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Current.Session["agente"] == null)
            {
                filterContext.Result = new RedirectResult("~/AccesoAgente/AgenteLogin");

            }

            base.OnActionExecuting(filterContext);

        }

    }
}