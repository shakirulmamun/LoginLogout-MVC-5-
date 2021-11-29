using LoginLogout.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace LoginLogout.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {
        Login_LogoutEntities db = new Login_LogoutEntities();
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(tbl_User user)
        {
            var userFix = db.tbl_User.Where(x => x.UserName == user.UserName && x.Password == user.Password).Count();

            if (userFix !=0)
            {
                FormsAuthentication.SetAuthCookie(user.UserName,false);
                return RedirectToAction("Index", "tbl_Department");
            }
            else
            {
                TempData["Msg"] = "Username or Password is invalid";
                return View();
            }

        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Account");
        }
    }
}