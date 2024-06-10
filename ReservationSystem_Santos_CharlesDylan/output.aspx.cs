using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReservationSystem_Santos_CharlesDylan
{
    public partial class output : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["fullName"] != null)
            {
                fullNameValue.Text = Session["fullName"].ToString();
                addressValue.Text = Session["address"].ToString();
                idTypeValue.Text = Session["idType"].ToString();
                idNumberValue.Text = Session["idNumber"].ToString();
                roomNumberValue.Text = Session["roomNumber"].ToString();
                dateInValue.Text = ((DateTime)Session["dateIn"]).ToString("yyyy-MM-dd");
                dateOutValue.Text = ((DateTime)Session["dateOut"]).ToString("yyyy-MM-dd");
                ratePeriodValue.Text = Session["ratePeriod"].ToString();
                decimal totalCharge = (decimal)Session["totalCharges"];
                totalChargesValue.Text = totalCharge.ToString("C");
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

        protected void backToFormButton_Click(object sender, EventArgs e)
        {
            // Clear the Session values
            Session.Clear();

            Response.Redirect("default.aspx");
        }
    }
}