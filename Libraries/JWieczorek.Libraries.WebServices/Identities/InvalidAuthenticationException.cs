using System;

namespace JWieczorek.Libraries.WebServices.Identities
{
    public class InvalidAuthenticationException : Exception 
    {
        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="message"></param>
        public InvalidAuthenticationException(String message = null, Exception? innerException = null) : base(message, innerException) { }
    }
}