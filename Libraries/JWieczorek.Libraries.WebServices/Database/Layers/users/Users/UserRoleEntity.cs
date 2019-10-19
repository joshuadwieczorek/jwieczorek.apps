using System;

namespace JWieczorek.Libraries.WebServices.Database.Layers.users.Users
{
    public class UserRoleEntity
    {
        public Guid User_ID { get; set; }
        public Guid Rold_ID { get; set; }
        public String Role_Name { get; set; }
        public DateTime? Created_By { get; set; }
        public DateTime? Updated_By { get; set; }
        public DateTime Time_Created { get; set; }
        public DateTime Time_Updated { get; set; }
    }
}