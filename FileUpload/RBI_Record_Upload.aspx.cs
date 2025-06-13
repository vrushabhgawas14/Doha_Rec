using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doha_Rec.FileUpload
{
    public partial class RBI_Record_Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (RecordTypeList.SelectedIndex < 0)
            {
                FinalMessageLB.Text = "Please select record type";
                return;
            }

            if (!FileUploadInput.HasFile)
            {
                FinalMessageLB.Text = "Please select a file to Upload.";
                return;
            }

            string recordType = RecordTypeList.SelectedValue;
            string fileName = FileUploadInput.FileName;
            FinalMessageLB.Text = $"File {fileName} uploaded for {recordType}";
        }
    }
}