using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReservationSystem_Santos_CharlesDylan
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private decimal CalculateTotalCharges(DateTime dateInValue, DateTime dateOutValue, Decimal rate)
        {
            int period = (dateOutValue - dateInValue).Days;

            return rate * period;
        }

        protected void checkoutButton_Click(object sender, EventArgs e)
        {
            // Validate input
            if (string.IsNullOrWhiteSpace(fullName.Text) ||
                string.IsNullOrWhiteSpace(address.Text) ||
                string.IsNullOrWhiteSpace(idType.SelectedValue) ||
                string.IsNullOrWhiteSpace(idNumber.Text) ||
                string.IsNullOrWhiteSpace(roomNumber.Text) ||
                string.IsNullOrWhiteSpace(dateIn.Text) ||
                string.IsNullOrWhiteSpace(dateOut.Text) ||
                string.IsNullOrWhiteSpace(ratePeriod.Text))
            {
                errorMessage.Text = "All fields are required.";
                return;
            }

            if (DateTime.Parse(dateIn.Text) >= DateTime.Parse(dateOut.Text))
            {
                errorMessage.Text = "Date In must be before Date Out.";
                return;
            }

            DateTime dateInValue;
            if (DateTime.TryParse(dateIn.Text, out dateInValue))
            {
                DateTime dateOutValue;
                if (DateTime.TryParse(dateOut.Text, out dateOutValue))
                {
                    decimal totalCharges = CalculateTotalCharges(dateInValue, dateOutValue, Decimal.Parse(ratePeriod.Text));

                    // Store the required input values in the Session
                    Session["fullName"] = fullName.Text;
                    Session["address"] = address.Text;
                    Session["idType"] = idType.SelectedValue;
                    Session["idNumber"] = idNumber.Text;
                    Session["roomNumber"] = roomNumber.Text;
                    Session["dateIn"] = dateInValue;
                    Session["dateOut"] = dateOutValue;
                    Session["ratePeriod"] = ratePeriod.Text;
                    Session["totalCharges"] = totalCharges;

                    Response.Redirect("output.aspx");
                }
                else
                {
                    errorMessage.Text = "Invalid Date Out.";
                }
            }
            else
            {
                errorMessage.Text = "Invalid Date In.";
            }
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            // Clear the input fields
            fullName.Text = string.Empty;
            address.Text = string.Empty;
            idType.SelectedIndex = 0;
            idNumber.Text = string.Empty;
            roomNumber.Text = string.Empty;
            dateIn.Text = string.Empty;
            dateOut.Text = string.Empty;
            ratePeriod.Text = string.Empty;
            totalCharges.Text = string.Empty;
            errorMessage.Text = string.Empty;
        }

        protected void dateIn_TextChanged(object sender, EventArgs e)
        {
            CalculateAndDisplayTotalCharges();
        }

        protected void dateOut_TextChanged(object sender, EventArgs e)
        {
            CalculateAndDisplayTotalCharges();
        }

        protected void ratePeriod_TextChanged(object sender, EventArgs e)
        {
            CalculateAndDisplayTotalCharges();
        }

        public void CalculateAndDisplayTotalCharges()
        {
            if (DateTime.TryParse(dateIn.Text, out DateTime dateInValue) &&
                DateTime.TryParse(dateOut.Text, out DateTime dateOutValue) &&
                Decimal.TryParse(ratePeriod.Text, out Decimal rate))
            {
                decimal totalCharge = CalculateTotalCharges(dateInValue, dateOutValue, rate);
                totalCharges.Text = totalCharge.ToString("C");
            }
            else
            {
                totalCharges.Text = string.Empty;
            }
        }
    }
}