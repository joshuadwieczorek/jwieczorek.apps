using System;
using System.Collections.Generic;

namespace JWieczorek.Libraries.WebServices.Database.Layers.users.Users
{
    public interface IUsersDataProvider
    {
        void Lock(Guid userId);
        List<UserEntity> ReadAll();
        UserEntity ReadAuthorization(Guid userId);
        UserEntity ReadByUsername(String username);
        void Suspend(Guid userId);
        void UpdateLastLoginTime(Guid userId, DateTime loginTime);
    }
}