using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;

namespace JWieczorek.Libraries.WebServices.Identities
{
    public interface IUserIdentityHandler
    {
        Boolean SignInBy(String login);
        Boolean SignOut(ClaimsIdentity identity);
        
    }
}
