using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Migrations;
using WebAPI.Model;
using WebAPI.Security;
using WebAPI.UIModel;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController, Authorize]
    public class UserLeaveController : ControllerBase
    {
        private readonly ILogger<AuthenticationController> _logger;
        private readonly DbContextClass _context;
        public UserLeaveController(DbContextClass context, ILogger<AuthenticationController> logger = null)
        {
            _context = context; _logger = logger;
        }
        [HttpGet]
        [Route("UserDashboardDetails")]
        public async Task<ActionResult<UserDashboard>> Get(int id)
        {
            UserDashboard userDashboard = new UserDashboard();
            try
            {
                int TotalLeave = 0, AvailedLeave = 0, PendingApprovalLeave = 0;
                var user = await _context.Users.Where(x => x.UserId == id && x.IsActive == true).FirstOrDefaultAsync();
                if (user != null)
                {
                    var userLeaveMasterData = await _context.UserLeaveMaster.Where(x => x.Users.UserId == user.UserId && x.Year == DateTime.Now.Year && x.IsActive == true).FirstOrDefaultAsync();
                    TotalLeave = (userLeaveMasterData != null) ? userLeaveMasterData.TotalLeave : 0;
                    var userLeaveList = await _context.UserLeave.Where(x => x.Users.UserId == user.UserId  && x.FromDate.Year== DateTime.Now.Year && x.ToDate.Year== DateTime.Now.Year).ToListAsync();
                    if (userLeaveList != null)
                    {
                        AvailedLeave = userLeaveList.Where(x => x.IsActive == true).Sum(x => ((x.ToDate.Date - x.FromDate.Date).Days+1));
                        PendingApprovalLeave = userLeaveList.Where(x => x.IsActive == false).Sum((x => (x.ToDate.Date - x.FromDate.Date).Days+1));
                    }
                    userDashboard.UserId = user.UserId;
                    userDashboard.UserName = user.UserName;
                    userDashboard.UserYear = DateTime.Now.Year;
                    userDashboard.TotalLeave = TotalLeave;
                    userDashboard.AvailedLeave = AvailedLeave;
                    userDashboard.RemainingLeave = TotalLeave - AvailedLeave;
                    userDashboard.PendingApprovalLeave = PendingApprovalLeave;

                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
            }
            return userDashboard;
        }
        [HttpGet]
        [Route("List")]
        public async Task<ActionResult<UserLeave>> GetAll(int userId)
        {
            var userLeaveList = new List<UserLeave>();
            try
            {
                userLeaveList = await _context.UserLeave.Where(x => x.Users.UserId == userId && x.FromDate.Year == DateTime.Now.Year && x.ToDate.Year == DateTime.Now.Year).ToListAsync();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
            }
            return Ok(userLeaveList);
        }
        [HttpPost]
        [Route("CreateLeave")]
        public async Task<ActionResult<UserLeaveForm>> POST(UserLeaveForm userLeaveForm)
        {
            try
            {
                var user = await _context.Users.Where(x => x.UserId == userLeaveForm.CreatedBy && x.IsActive == true).FirstOrDefaultAsync();
                if (user != null)
                {
                    UserLeave usrData = new UserLeave();
                    usrData.FromDate = userLeaveForm.FromDate;
                    usrData.ToDate = userLeaveForm.ToDate;
                    usrData.LeaveType = userLeaveForm.LeaveType;
                    usrData.NatureOfLeave = userLeaveForm.NatureOfLeave;
                    usrData.Reason = userLeaveForm.Reason;
                    usrData.CreatedBy = userLeaveForm.CreatedBy;
                    usrData.CreatedDate = DateTime.Now;
                    usrData.Users = user;
                    _context.UserLeave.Add(usrData);

                    await _context.SaveChangesAsync();

                    return CreatedAtAction(nameof(Get), new { id = usrData.UserLeaveId }, usrData);
                }
                return BadRequest($"User does not found {{userLeaveForm.CreatedBy}}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                return BadRequest(ex.Message);
            }
        }

    }
}
