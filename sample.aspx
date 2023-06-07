<%@ Register TagPrefix="Acme" TagName="Address" Src="address.ascx" %>

<html>

  <script language="C#" runat="server">

      void Page_Load(Object Src, EventArgs E ) {

         if (!IsPostBack)
           ViewState["PanelIndex"] = 0;
      }

      void Next_Click(Object Src, EventArgs E ) {

         String PrevPanelId = "Panel" + ViewState["PanelIndex"].ToString();
         ViewState["PanelIndex"] = (int)ViewState["PanelIndex"] + 1;
         String PanelId = "Panel" + ViewState["PanelIndex"].ToString();

         System.Web.UI.WebControls.Panel p = 
             (System.Web.UI.WebControls.Panel)FindControl(PanelId);
         p.Visible=true;

         p = (System.Web.UI.WebControls.Panel)FindControl(PrevPanelId);
         p.Visible=false;
      }

      void Prev_Click(Object Src, EventArgs E ) {

         String PanelId = "Panel" + ViewState["PanelIndex"].ToString();
         ViewState["PanelIndex"] = (int)ViewState["PanelIndex"] - 1;
         String PrevPanelId = "Panel" + ViewState["PanelIndex"].ToString();

         System.Web.UI.WebControls.Panel p = 
             (System.Web.UI.WebControls.Panel)FindControl(PanelId);
         p.Visible=false;

         p = (System.Web.UI.WebControls.Panel)FindControl(PrevPanelId);
         p.Visible=true;
      }

      void Finish_Click(Object Src, EventArgs E ) {

         String PanelId = "Panel" + ViewState["PanelIndex"].ToString();
         System.Web.UI.WebControls.Panel p = 
             (System.Web.UI.WebControls.Panel)FindControl(PanelId);
         p.Visible=false;

         MyLabel.Text += "<b>Thank You!  We received the following information: </b><p>";
         MyLabel.Text += "First Name: " + FirstName.Value + "<br>";
         MyLabel.Text += "Last Name: " + LastName.Value + "<br>";
         MyLabel.Text += "Address: " + Address.Address + "<br>";
         MyLabel.Text += "City: " + Address.City + "<br>";
         MyLabel.Text += "State: " + Address.State + "<br>";
         MyLabel.Text += "Zip: " + Address.Zip + "<br>";
         MyLabel.Text += "Card Number: " + CardNum.Value + "<br>";
         MyLabel.Text += "Card Type: " + CardType.SelectedItem.Value + "<br>";
         MyLabel.Text += "Expires: " + Expires.Value + "<br>";
      }

  </script>

  <body style="font: 10pt verdana">

    <h3><font face="Verdana">Using PageState</font></h3>

    <form runat="server">

    <ASP:Panel id="Panel0" Visible="true" runat="server">
      <table width="500" height="200" style="font:10pt verdana;background-color:cccccc;border-width:1;border-style:solid;border-color:black">
        <tr>
          <td style="padding:10,10,10,10" valign="top">
            <table height="100%" style="font:10pt verdana;">
              <tr>
                <td colspan="2"><b>Complete the following fields, then choose Next to continue:</b></td>
              </tr>
              <tr height="20"/>
              <tr>
                <td>First Name:</td>
                <td><input id="FirstName" type="text" size="45" runat="server"></td>
              </tr>
              <tr>
                <td>Last Name:</td>
                <td><input id="LastName" type="text" size="45" runat="server"></td>
              </tr>
              <tr>
                <td colspan="2" align="right" height="100%" valign="bottom">
                  <input type="submit" Value=" Next >> " OnServerClick="Next_Click" runat="server">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </ASP:Panel>

    <ASP:Panel id="Panel1" Visible="false" runat="server">
      <table width="500" height="200" style="font:10pt verdana;background-color:cccccc;border-width:1;border-style:solid;border-color:black">
        <tr>
          <td style="padding:10,10,10,10" valign="top">
            <table height="100%" style="font:10pt verdana;">
              <tr>
                <td colspan="2"><b>Complete the following fields, then choose Next to continue:</b></td>
              </tr>
              <tr height="20"/>
              <tr>
                <td colspan="2">
                  <Acme:Address id="Address" ShowCaption="false" runat="server"/>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="right" valign="bottom" height="100%">
                  <input type="submit" Value=" << Back " OnServerClick="Prev_Click" runat="server">
                  <input type="submit" Value=" Next >> " OnServerClick="Next_Click" runat="server">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </ASP:Panel>

    <ASP:Panel id="Panel2" Visible="false" runat="server">
      <table width="500" height="200" style="font:10pt verdana;background-color:cccccc;border-width:1;border-style:solid;border-color:black">
        <tr>
          <td style="padding:10,10,10,10" valign="top">
            <table height="100%" style="font:10pt verdana;">
              <tr>
                <td colspan="2"><b>Complete the following fields, then choose Next to continue:</b></td>
              </tr>
              <tr height="20"/>
              <tr>
                <td>Card Number: </td>
                <td><input id="CardNum" size="45" type="text" runat="server"/></td>
              </tr>
              <tr>
                <td>Card Type: </td>
                <td>
                  <asp:DropDownList id="CardType" runat="server">
                    <asp:ListItem>Visa</asp:ListItem>
                    <asp:ListItem>Mastercard</asp:ListItem>
                    <asp:ListItem>Discover</asp:ListItem>
                  </asp:DropDownList>
                </td>
              </tr>
              <tr>
                <td>Expires: </td>
                <td><input id="Expires" type="text" runat="server"/></td>
              </tr>
              <tr>
                <td colspan="2" align="right" valign="bottom" height="100%">
                  <input type="submit" Value=" << Back " OnServerClick="Prev_Click" runat="server">
                  <input type="submit" Value="   Finish   " OnServerClick="Finish_Click" runat="server">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </ASP:Panel>
    </form>

    <asp:Label id="MyLabel" EnableViewState="false" runat="server"/>

  </body>
</html>
