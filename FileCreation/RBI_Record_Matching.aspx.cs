using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doha_Rec.FileCreation
{
    public partial class RBI_Record_Matching : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MatchButton_Click(object sender, EventArgs e)
        {
            string recordType = RecordTypeList.SelectedValue;
            FinalMessageLB.Text = $"'{recordType}' File Matched.";
        }
    }
}