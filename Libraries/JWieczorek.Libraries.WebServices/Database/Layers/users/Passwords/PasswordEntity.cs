using System;
using JWieczorek.Libraries.WebServices.Database.Common;

namespace JWieczorek.Libraries.WebServices.Database.Layers.users.Passwords
{
    public class PasswordEntity : EntityBase<UserEnums.eStatusType>
    {
        public Guid User_ID { get; set; }
        public String Password { get; set; }
        public Boolean Is_Active { get; set; }
    }
}