using System;
using JWieczorek.Libraries.WebServices.Database.Common;

namespace JWieczorek.Libraries.WebServices.Database.Layers.users.Roles
{
    public class RoleEntity : EntityBase<UserEnums.eStatusType>
    {
        public String Name { get; set; }
    }
}