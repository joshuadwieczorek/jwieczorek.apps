using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using JWieczorek.WebApp.Models;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using JWieczorek.Libraries.WebServices.Identities;

namespace JWieczorek.WebApp.Controllers
{
    public class LoginController : Controller
    {
        /// <summary>
        /// User identity provider.
        /// </summary>
        IUserIdentityHandler IdentityHandler { get; set; }


        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="identityHandler"></param>
        public LoginController(IUserIdentityHandler identityHandler)
        {
            IdentityHandler = identityHandler;
        }


        /// <summary>
        /// Show the login view.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// Handle user login.
        /// </summary>
        /// <param name="loginModel"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> Index(LoginModel loginModel)
        {
            if(ModelState.IsValid)
            {
                try
                {
                    ClaimsPrincipal userPrincipal = IdentityHandler.Generate(loginModel.Username, loginModel.Password);

                    await HttpContext.SignInAsync(userPrincipal);

                    return RedirectToAction("Index", "App");
                }
                catch (Exception exception)
                {
                    ModelState.AddModelError("Username", exception.Message);
                    ModelState.AddModelError("Password", exception.Message);
                }
            }

            return View(loginModel);
        }
    }
}