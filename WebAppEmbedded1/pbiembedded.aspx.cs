using Newtonsoft.Json;
using System;
using System.Web.UI;
using WebAppEmbedded1.PowerBIFiles;

namespace WebAppEmbedded1
{
    public partial class pbiembedded : Page
    {
        private readonly IEmbedService m_embedService;

        public pbiembedded()
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