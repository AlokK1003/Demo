using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace WebAPI.UIModel
{
    public class UserLeaveForm
    {
        [Required]
        public int UserLeaveId { get; set; }
        [Required]
        public DateTime FromDate { get; set; }
        [Required]
        public DateTime ToDate { get; set; }
        [Required]
        public int LeaveType { get; set; }
        [Required]
        public int NatureOfLeave { get; set; }
        public string Reason { get; set; }
        [Required]
        public int CreatedBy { get; set; }
    }
}
