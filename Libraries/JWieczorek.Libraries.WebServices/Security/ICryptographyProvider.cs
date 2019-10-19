using System;

namespace JWieczorek.Libraries.WebServices.Security
{
    public interface ICryptographyProvider
    {
        /// <summary>
        /// Create hash string.
        /// </summary>
        /// <param name="plainTextString"></param>
        /// <returns></returns>
        String CreateHash(String plainTextString);

        /// <summary>
        /// Set hash iterations. Default value is 100,000.
        /// </summary>
        /// <param name="hashIterations"></param>
        void SetHashIterations(Int32 hashIterations);

        /// <summary>
        /// Set byte length of password byte array. Default value is 100.
        /// </summary>
        /// <param name="passwordByteLength"></param>
        void SetPasswordByteLength(Int32 passwordByteLength);

        /// <summary>
        /// Set byte length of salt byte array. Default value is 100.
        /// </summary>
        /// <param name="saltByteLength"></param>
        void SetSaltByteLength(Int32 saltByteLength);

        /// <summary>
        /// Verify hash against plain text value.
        /// </summary>
        /// <param name="plainTextString"></param>
        /// <param name="hashedString"></param>
        /// <returns></returns>
        Boolean VerifyHash(String plainTextString, String hashedString);
    }
}