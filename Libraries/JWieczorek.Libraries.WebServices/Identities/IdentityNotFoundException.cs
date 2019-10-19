using System;

namespace JWieczorek.Libraries.WebServices.Identities
{
    public class IdentityNotFoundException : Exception
    {
        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="message"></param>
        /// <param name="login"></param>
        public IdentityNotFoundException(String message, String login) : base(message) 
        {
            base.Data.Add("Login", login);
        }
    }
}