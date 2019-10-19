using System;
using System.Collections.Generic;
using System.Security.Claims;
using JWieczorek.Libraries.WebServices.Security;
using JWieczorek.Libraries.WebServices.Database.Layers.users.Users;

namespace JWieczorek.Libraries.WebServices.Identities
{
    public class UserIdentityHandler : IUserIdentityHandler
    {
        /// <summary>
        /// Crypto provider.
        /// </summary>
        CryptographyProvider Cryptography { get; set; }

        /// <summary>
        /// User database provider.
        /// </summary>
        IUsersDataProvider UsersDataProvider { get; set; }

        /// <summary>
        /// Application identity name.
        /// </summary>
        String ApplicationIdentityName { get; set; }


        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="usersDataProvider"></param>
        public UserIdentityHandler(IUsersDataProvider usersDataProvider)
        {
            Cryptography = new CryptographyProvider();
            UsersDataProvider = usersDataProvider;
            ApplicationIdentityName = "JWieczorek.Apps.Identity";
        }


        /// <summary>
        /// Set application's identity name.
        /// </summary>
        /// <param name="applicationIdentityName"></param>
        public void SetApplicationIdentityName(String applicationIdentityName)
        {
            ApplicationIdentityName = applicationIdentityName;
        }


        /// <summary>
        /// Loguser in.
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public ClaimsPrincipal Generate(String username, String password)
        {
            try
            {
                UserEntity user = GetAuthenticatedIdentity(username, password);

                if (user != null)
                {
                    ClaimsPrincipal identityPrincipal = GenerateIdentity(user);
                    UsersDataProvider.UpdateLastLoginTime(user.ID, DateTime.Now);
                    return identityPrincipal;
                }

                return null;
            }
            catch(Exception exception)
            {
                throw new InvalidAuthenticationException("Invalid login credentials!", exception);
            }
        }


        /// <summary>
        /// Generate the user's identiy principal.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        ClaimsPrincipal GenerateIdentity(UserEntity user)
        {
            if (user != null)
            {
                if (user.Roles != null && user.Roles.Count > 1)
                {
                    List<Claim> userClaims = new List<Claim>();
                    
                    user.Roles.ForEach(role =>
                    {
                        userClaims.Add(new Claim(ClaimTypes.Role, role.Role_Name));
                    });

                    if(user.Email_Address != null && !String.IsNullOrEmpty(user.Email_Address.Email_Address))
                        userClaims.Add(new Claim(ClaimTypes.Email, user.Email_Address.Email_Address));

                    userClaims.Add(new Claim(ClaimTypes.GivenName, user.First_Name));
                    userClaims.Add(new Claim(ClaimTypes.Surname, user.Last_Name));
                    userClaims.Add(new Claim(ClaimTypes.Name, $"{user.First_Name} {user.Last_Name}"));

                    ClaimsIdentity identity = new ClaimsIdentity(userClaims, ApplicationIdentityName);

                    if (identity != null)
                        return new ClaimsPrincipal(new[] { identity });

                    throw new Exception($"There was an error generating the cliams identity for '{user.ID}'!");
                }
                else
                    throw new Exception($"User '{user.ID}' has no roles!");
            }
            else
                throw new Exception("User is null!");
        }


        /// <summary>
        /// Authenticate the user and return the user's database entity.
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        UserEntity GetAuthenticatedIdentity(String username, String password)
        {
            UserEntity user = UsersDataProvider.ReadByUsername(username);
            if (user != null)
            {
                if (user.Status_Type != Database.Layers.users.UserEnums.eStatusType.Active)
                    throw new InvalidAuthenticationException($"User is not active!");

                UserEntity userAuthorization = UsersDataProvider.ReadAuthorization(user.ID);

                if (userAuthorization.Password != null && !String.IsNullOrEmpty(userAuthorization.Password.Password))
                {
                    Boolean passwordIsValid = Cryptography.VerifyHash(password, userAuthorization.Password.Password);

                    if (passwordIsValid)
                        return userAuthorization;

                    throw new InvalidAuthenticationException($"Invalid password!");
                }
                else
                    throw new InvalidAuthenticationException($"User does not have an active password!");
            }
            else
                throw new IdentityNotFoundException("User not found!", username);
        }
    }
}