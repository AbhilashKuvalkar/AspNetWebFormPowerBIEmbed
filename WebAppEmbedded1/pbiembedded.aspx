﻿<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pbiembedded.aspx.cs" Inherits="WebAppEmbedded1.pbiembedded" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/powerbi.min.js"></script>

    <input type="hidden" id="accessTokenText" runat="server" value="" />
    <input type="hidden" id="embedUrlText" runat="server" value="" />
    <input type="hidden" id="embedReportIdText" runat="server" value="" />

    <div id="embedContainer" style="width: 100%; height: 600px;"></div>

    <!-- Js function to assign iframe embedUrl and access token -->
    <script type="text/javascript">

        // Read embed application token from Model
        var accessToken = jQuery("#<% =accessTokenText.ClientID %>").val();

        // Read embed URL from Model
        var embedUrl = jQuery("#<% =embedUrlText.ClientID %>").val();

        // Read report Id from Model
        var embedReportId = jQuery("#<% =embedReportIdText.ClientID %>").val();

        var models = window["powerbi-client"].models;

        const filter = {
            $schema: "http://powerbi.com/product/schema#basic",
            target: {
                table: "Sales",
                column: "Class"
            },
            operator: "In",
            values: ["Deluxe"]
        };

        var config = {
            type: 'report',
            tokenType: models.TokenType.Embed,
            accessToken: accessToken,
            embedUrl: embedUrl,
            id: embedReportId,
            permissions: models.Permissions.All,
            settings: {
                filterPaneEnabled: true,
                navContentPaneEnabled: true
            },
            filters: [filter]
        };

        var reportContainer = $('#embedContainer')[0];
        var report = powerbi.embed(reportContainer, config);

    </script>
</asp:Content>
