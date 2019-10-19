using System;
using JWieczorek.Libraries.WebServices.Database.Layers.users.Users;
using JWieczorek.Libraries.WebServices.Identities;
using JWieczorek.Libraries.WebServices.Security;

namespace AppTester
{
    class Program
    {
        static void Main(string[] args)
        {
            CryptographyProvider hasher = new CryptographyProvider();

            //String result1 = hasher.CreateHash("Pa$$word1");

            //var isVerified = hasher.VerifyHash("Pa$$word1", result1);

            IUsersDataProvider usersDataProvider = new UsersDataProvider("Server=JOSHUAS-ASUS\\SQLEXPRESS;Database=JWieczorek.Apps;Integrated Security=true;");
            UserIdentityHandler identityHandler = new UserIdentityHandler(usersDataProvider);

            try
            {
                var identity = identityHandler.Generate("SysAdmin", "Pa$$word1");
            }
            catch(Exception exception)
            {
                Console.WriteLine(exception.Message);
            }

            Console.WriteLine();
            Console.Read();
        }
    }
}
