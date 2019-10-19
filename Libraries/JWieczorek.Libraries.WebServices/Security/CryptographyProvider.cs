using System;
using System.Security.Cryptography;

namespace JWieczorek.Libraries.WebServices.Security
{
    public sealed class CryptographyProvider : ICryptographyProvider
    {
        /// <summary>
        /// Lenth of salt byte array.
        /// </summary>
        Int32 SaltByteLength { get; set; }

        /// <summary>
        /// Lenth of password byte array.
        /// </summary>
        Int32 PasswordByteLength { get; set; }

        /// <summary>
        /// Hash iterations.
        /// </summary>
        Int32 HashIterations { get; set; }


        /// <summary>
        /// Constructor.
        /// Set default byte lengths.
        /// </summary>
        public CryptographyProvider()
        {
            SaltByteLength = 100;
            PasswordByteLength = 100;
            HashIterations = 100000;
        }


        /// <summary>
        /// Create hash string.
        /// </summary>
        /// <param name="plainTextString"></param>
        /// <returns></returns>
        public String CreateHash(String plainTextString)
        {
            try
            {
                Byte[] saltBytes;
                Byte[] hashedTextBytes;
                Byte[] finalHash = new Byte[200];

                new RNGCryptoServiceProvider().GetBytes(saltBytes = new Byte[SaltByteLength]);

                Rfc2898DeriveBytes hashProvider = new Rfc2898DeriveBytes(plainTextString, saltBytes, HashIterations);
                hashedTextBytes = hashProvider.GetBytes(PasswordByteLength);

                Array.Copy(saltBytes, 0, finalHash, 0, SaltByteLength);
                Array.Copy(hashedTextBytes, 0, finalHash, SaltByteLength, PasswordByteLength);

                return Convert.ToBase64String(finalHash);
            }
            catch (Exception exception)
            {
                CryptographyException cryptoException = new CryptographyException("Hasher create exception!", exception);
                cryptoException.Data.Add("PlainTextString", plainTextString);
                throw cryptoException;
            }
        }


        /// <summary>
        /// Verify hash against plain text value.
        /// </summary>
        /// <param name="plainTextString"></param>
        /// <param name="hashedString"></param>
        /// <returns></returns>
        public Boolean VerifyHash(String plainTextString, String hashedString)
        {
            try
            {
                Byte[] saltBytes = new Byte[SaltByteLength];
                Byte[] originalHashBytes = new Byte[PasswordByteLength];
                Byte[] hashedTextBytes = Convert.FromBase64String(hashedString);
                Byte[] compareHash;

                Array.Copy(hashedTextBytes, 0, saltBytes, 0, SaltByteLength);
                Array.Copy(hashedTextBytes, SaltByteLength, originalHashBytes, 0, PasswordByteLength);

                Rfc2898DeriveBytes hashProvider = new Rfc2898DeriveBytes(plainTextString, saltBytes, HashIterations);
                compareHash = hashProvider.GetBytes(PasswordByteLength);

                Boolean isCorrect = true;

                for (Int32 i = 0; i < 20; ++i)
                    if (originalHashBytes[i + 4] != compareHash[i + 4])
                    {
                        isCorrect = false;
                        break;
                    }

                return isCorrect;

            }
            catch (Exception exception)
            {
                CryptographyException cryptoException = new CryptographyException("Hasher verify exception!", exception);
                cryptoException.Data.Add("PlainTextString", plainTextString);
                cryptoException.Data.Add("HashedString", hashedString);
                throw cryptoException;
            }
        }


        /// <summary>
        /// Set byte length of salt byte array. Default value is 100.
        /// </summary>
        /// <param name="saltByteLength"></param>
        public void SetSaltByteLength(Int32 saltByteLength)
        {
            SaltByteLength = saltByteLength;
        }


        /// <summary>
        /// Set byte length of password byte array. Default value is 100.
        /// </summary>
        /// <param name="passwordByteLength"></param>
        public void SetPasswordByteLength(Int32 passwordByteLength)
        {
            PasswordByteLength = passwordByteLength;
        }



        /// <summary>
        /// Set hash iterations. Default value is 100,000.
        /// </summary>
        /// <param name="hashIterations"></param>
        public void SetHashIterations(Int32 hashIterations)
        {
            HashIterations = hashIterations;
        }
    }
}