using System;
using JWieczorek.Libraries.WebServices.Database.Common;

namespace JWieczorek.Libraries.WebServices.Database.Layers.users.EmailAddresses
{
    public class EmailAddressEntity : EntityBase<UserEnums.eStatusType>
    {
        public Guid User_ID { get; set; }
        public String Email_Address { get; set; }
        public Boolean Is_Primary { get; set; }
        public UserEnums.eEmailType Email_Type { get; set; }
    }
}