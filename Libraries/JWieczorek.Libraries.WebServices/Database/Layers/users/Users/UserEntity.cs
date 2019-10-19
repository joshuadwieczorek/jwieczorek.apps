using System;
using System.Collections.Generic;
using JWieczorek.Libraries.WebServices.Database.Common;
using JWieczorek.Libraries.WebServices.Database.Layers.users.EmailAddresses;
using JWieczorek.Libraries.WebServices.Database.Layers.users.Passwords;

namespace JWieczorek.Libraries.WebServices.Database.Layers.users.Users
{
    public class UserEntity : EntityBase<UserEnums.eStatusType>
    {
        public String Username { get; set; }
        public String First_Name { get; set; }
        public String Last_Name { get; set; }
        public DateTime? Time_Last_Login { get; set; }
        public EmailAddressEntity Email_Address { get; set; }
        public PasswordEntity Password { get; set; }
        public List<UserRoleEntity> Roles { get; set; }        
    }
}