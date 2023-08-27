
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using WebAPI.Data;
using WebAPI.Model;
using WebAPI.UIModel;
using WebAPI.Security;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly ILogger<AuthenticationController> _logger;
        private readonly DbContextClass _context;
        public AuthenticationController(DbContextClass context, ILogger<AuthenticationController> logger = null)
        {
            _context = context; _logger = logger;
        }
        [HttpPost("login")]
        public IActionResult Login([FromBody] User user)
        {
            try
            {
                if (user is null)
                {
                    return BadRequest("Invalid user request!!!");
                }
                string sssss = EncryptDecrypt.Encrypt(user.Password);
                var usersData = _context.Users.Where(x => x.UserName == user.UserName && x.Password == EncryptDecrypt.Encrypt(user.Password) && x.IsActive == true).FirstOrDefault();
                if (usersData!=null)
                {
                    return Ok(new JWTTokenResponse { Token =  EncryptDecrypt.GenerateToken(), UserId = usersData.UserId });
                }
                return Unauthorized();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                return Unauthorized();
            }
            
        }
        
    }
}
