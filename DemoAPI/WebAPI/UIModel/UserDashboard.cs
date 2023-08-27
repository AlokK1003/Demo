namespace WebAPI.UIModel
{
    public class UserDashboard
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public int UserYear { get; set; }
        public int TotalLeave { get; set; }

        public int AvailedLeave { get; set; }

        public int RemainingLeave { get; set; }
        public int PendingApprovalLeave { get; set; }
    }
}
