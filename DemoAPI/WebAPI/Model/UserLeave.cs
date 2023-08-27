using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Model
{
    public class UserLeave
    {
        [Key]
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

        [DefaultValue(true)]
        public bool IsActive { get; set; }
        [Required]
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }

        public Users Users { get; set; }
    }
}
