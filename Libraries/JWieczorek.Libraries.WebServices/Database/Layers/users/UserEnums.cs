namespace JWieczorek.Libraries.WebServices.Database.Layers.users
{
    public class UserEnums
    {
        /// <summary>
        /// User statuses.
        /// </summary>
        public enum eStatusType
        {
            Inactive = 0,
            Active = 1,
            Suspended = 2,
            Locked = 3,
            Deleted = 4
        }


        /// <summary>
        /// User address types.
        /// </summary>
        public enum eAddressType
        {
            None = 0,
            Home = 1,
            Work = 2
        }


        /// <summary>
        /// User email types.
        /// </summary>
        public enum eEmailType
        {
            None = 0,
            Personal = 1,
            Work = 2
        }


        /// <summary>
        /// User phone types.
        /// </summary>
        public enum ePhoneType
        {
            None = 0,
            Home = 1,
            Mobile = 2,
            Work = 3
        }
    }
}