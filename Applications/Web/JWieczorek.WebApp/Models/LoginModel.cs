using System;
using System.ComponentModel.DataAnnotations;

namespace JWieczorek.WebApp.Models
{
    public class LoginModel
    {
        [Required]
        public String Username { get; set; }

        [Required]
        public String Password { get; set; }
    }
}