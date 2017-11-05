using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meeting_System.Web_Forms
{
    public partial class ConfirmationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //hdnEvenTitle.Value = Convert.ToString(Session["EventTitle"]);
            txtEventTitle.Text = Convert.ToString(Session["EventTitle"]);
            txtEventTitle.Enabled = false;
            txtStartTime.Text = Convert.ToString(Session["StartDatetime"]);
            txtStartTime.Enabled = false;
            txtEndTime.Text = Convert.ToString(Session["EndDatetime"]);
            txtEndTime.Enabled = false;
            txtLocation.Text = Convert.ToString(Session["Location"]);
            txtLocation.Enabled = false;
            txtDescription.Text = Convert.ToString(Session["Description"]);
            txtDescription.Enabled = false;
            txtAttendee.Value = Convert.ToString(Session["Attendees"]);
        }
    }
}