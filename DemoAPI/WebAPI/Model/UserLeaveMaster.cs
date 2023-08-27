using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace WebAPI.Model
{
    public class UserLeaveMaster
    {
        [Key]
        [Required]
        public int UserLeaveId { get; set; }
        [Required]
        public int TotalLeave { get; set; }
        [Required]
        public int ApprovedLeave { get; set; }
        [Required]
        public int Year { get; set; }
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
