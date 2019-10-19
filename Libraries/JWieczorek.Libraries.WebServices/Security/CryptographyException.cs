using System;

namespace JWieczorek.Libraries.WebServices.Security
{
    public class CryptographyException : Exception 
    {
        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="message"></param>
        /// <param name="innerException"></param>
        public CryptographyException(String message, Exception? innerException) : base(message, innerException) { }
    }
}