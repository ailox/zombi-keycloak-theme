<#import "template.ftl" as layout>
<@layout.registrationLayout bodyClass="oauth"; section>
    <#if section = "form">
    <div>
        <h3>
            <#if client.name?has_content>
            ${msg("oauthGrantTitle",advancedMsg(client.name))}
            <#else>
            ${msg("oauthGrantTitle",client.clientId)}
            </#if>
        </h3>
        <p><strong>${msg("oauthGrantRequest")}</strong></p>
        <ul>
            <#if oauth.clientScopesRequested??>
                <#list oauth.clientScopesRequested as clientScope>
                    <li>
                        <span>${advancedMsg(clientScope.consentScreenText)}</span>
                    </li>
                </#list>
            </#if>
        </ul>

        <form action="${url.oauthAction}" method="POST">
            <input type="hidden" name="code" value="${oauth.code}">
            <div class="field is-grouped is-grouped-right">
                <p class="control">
                    <input class="button is-primary" name="accept" type="submit" value="${msg("doYes")}"/>
                </p>
                <p class="control">
                    <input class="button is-dark is-outlined" name="cancel" type="submit" value="${msg("doNo")}"/>
                </p>
            </div>
        </form>
    </div>
    </#if>
</@layout.registrationLayout>
