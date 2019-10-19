using System;

namespace JWieczorek.Libraries.WebServices.Database.Common
{
    public abstract class EntityBase<T> where T : Enum
    {
        public Guid ID { get; set; }
        public Guid? Created_By { get; set; }
        public Guid? Updated_By { get; set; }
        public DateTime Time_Created { get; set; }
        public DateTime Time_Updated { get; set; }
        public T Status_Type { get; set; }
    }
}