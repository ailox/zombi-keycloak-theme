<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <h3 class="has-text-centered is-size-3 has-text-weight-light">${msg("pageExpiredTitle")}</h3>
    <#elseif section = "form">
        <p id="instruction1" class="instruction">
            ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> .<br/>
            ${msg("pageExpiredMsg2")} <a id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a> .
        </p>
    </#if>
</@layout.registrationLayout>
