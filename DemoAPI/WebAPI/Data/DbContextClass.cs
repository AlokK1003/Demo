using Microsoft.EntityFrameworkCore;
using WebAPI.Model;

namespace WebAPI.Data
{
    public class DbContextClass : DbContext
    {
        protected readonly IConfiguration Configuration;

        public DbContextClass(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection"));
        }
        public DbSet<Users> Users { get; set; }
        public DbSet<UserLeave> UserLeave { get; set; }
        public DbSet<UserLeaveMaster> UserLeaveMaster { get; set; }

    }
}
