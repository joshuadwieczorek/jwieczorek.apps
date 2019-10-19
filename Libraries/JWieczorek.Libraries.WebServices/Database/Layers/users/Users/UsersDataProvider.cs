using System;
using System.Linq;
using System.Data;
using System.Collections.Generic;
using JWieczorek.Libraries.WebServices.Database.Common;
using JWieczorek.Libraries.WebServices.Database.Layers.users.EmailAddresses;
using JWieczorek.Libraries.WebServices.Database.Layers.users.Passwords;
using Dapper;

namespace JWieczorek.Libraries.WebServices.Database.Layers.users.Users
{
    public class UsersDataProvider : DataProviderBase, IUsersDataProvider
    {
        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="connectionString"></param>
        public UsersDataProvider(String connectionString) : base(connectionString) { }


        /// <summary>
        /// Read all users.
        /// </summary>
        /// <returns></returns>
        public List<UserEntity> ReadAll()
        {
            lock (Locker)
            {
                Open();
                IEnumerable<UserEntity> users = Connection.Query<UserEntity>("[users].[Users_Read]", commandType: CommandType.StoredProcedure);
                Close();

                return users != null && users.Count() > 0
                    ? users.ToList()
                    : new List<UserEntity>();
            }
        }


        /// <summary>
        /// Find user by username.
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public UserEntity ReadByUsername(String username)
        {
            lock (Locker)
            {
                Object parameters = new
                {
                    @Username = username
                };

                Open();
                UserEntity user = Connection.QuerySingleOrDefault<UserEntity>("[users].[Users_Read]", parameters, commandType: CommandType.StoredProcedure);
                Close();

                return user;
            }
        }


        /// <summary>
        /// Read user's authorization.
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public UserEntity ReadAuthorization(Guid userId)
        {
            lock (Locker)
            {
                Object parameters = new
                {
                    @UserID = userId
                };

                Open();

                UserEntity user = null;

                using (SqlMapper.GridReader results = Connection.QueryMultiple("[users].[Users_Read_Authorization]", parameters, commandType: CommandType.StoredProcedure))
                {
                    user = results.ReadSingleOrDefault<UserEntity>();

                    if (user != null)
                    {
                        user.Email_Address = results.ReadSingleOrDefault<EmailAddressEntity>();
                        user.Password = results.ReadSingleOrDefault<PasswordEntity>();
                        user.Roles = results.Read<UserRoleEntity>().ToList();
                    }
                }

                Close();

                return user;
            }
        }


        /// <summary>
        /// Update user's last login time.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="loginTime"></param>
        public void UpdateLastLoginTime(Guid userId, DateTime loginTime)
        {
            lock (Locker)
            {
                Object parameters = new
                {
                    @UserID = userId,
                    @LastLoginTime = loginTime,
                    @UpdatedBy = userId
                };

                Open();
                Connection.QuerySingleOrDefault<UserEntity>("[users].[Users_Update]", parameters, commandType: CommandType.StoredProcedure);
                Close();
            }
        }


        /// <summary>
        /// Lock user.
        /// </summary>
        /// <param name="userId"></param>
        public void Lock(Guid userId)
        {
            lock (Locker)
            {
                ChangeStatus(userId, UserEnums.eStatusType.Locked);
            }
        }


        /// <summary>
        /// Suspend user.
        /// </summary>
        /// <param name="userId"></param>
        public void Suspend(Guid userId)
        {
            lock (Locker)
            {
                ChangeStatus(userId, UserEnums.eStatusType.Suspended);
            }
        }


        /// <summary>
        /// Chage user's status.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="status"></param>
        void ChangeStatus(Guid userId, UserEnums.eStatusType status)
        {
            lock (Locker)
            {
                Object parameters = new
                {
                    @UserID = userId,
                    @StatusType = (Int16)status
                };

                Open();
                Connection.QuerySingleOrDefault<UserEntity>("[users].[Users_Change_Status]", parameters, commandType: CommandType.StoredProcedure);
                Close();
            }
        }
    }
}