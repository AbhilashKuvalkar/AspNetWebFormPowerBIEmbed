using System;
using System.Web.UI;
using WebAppEmbedded1.PowerBIFiles;

namespace WebAppEmbedded1
{
    public partial class _Default : Page
    {
        private readonly IEmbedService m_embedService;

        public _Default()
        {
            m_embedService = new EmbedService();
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var embedResult = await m_embedService.EmbedReport(null, null);

                if (embedResult)
                {
                    accessTokenText.Value = m_embedService.EmbedConfig.EmbedToken.Token;
                    embedUrlText.Value = m_embedService.EmbedConfig.EmbedUrl;
                    embedReportIdText.Value = m_embedService.EmbedConfig.Id;
                }
                else { }
            }
            catch (Exception exp)
            {
                throw exp;
            }
        }
    }
}