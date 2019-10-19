using System;
using System.Security.Claims;

namespace JWieczorek.Libraries.WebServices.Identities
{
    public interface IUserIdentityHandler
    {
        ClaimsPrincipal Generate(String username, String password);   
    }
}