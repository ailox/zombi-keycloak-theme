<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
  <#if section = "header">
      <h3 class="has-text-centered is-size-3 has-text-weight-light">${msg("doLogIn")}</h3>
  <#elseif section = "form">
    <#if realm.password>
    <form action="${url.loginAction}" method="post" onsubmit="login.disabled = true; return true;">
     
      <div class="field">
        <label for="username" class="label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
        <div class="control has-icons-left">
          <#if usernameEditDisabled??>
            <input class="input is-primary" tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" disabled />
          <#else>
            <input class="input is-primary" tabindex="1" id="username" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
          </#if>
          <span class="icon is-small is-left">
            <i class="material-icons"><#if realm.registrationEmailAsUsername>mail_outline<#else>person_outline</#if></i>
          </span>
        </div>
      </div>

      <div class="field">
        <label class="label" for="password">${msg("password")}</label>
        <div class="control has-icons-left">
            <input class="input is-primary" tabindex="2" id="password" name="password" type="password" autocomplete="off" />
            <span class="icon is-small is-left">
                <i class="material-icons">lock_outline</i>
            </span>
        </div>
      </div>

      
      <div class="field columns is-mobile">
        <#if realm.rememberMe && !usernameEditDisabled??>
        <div class="column">
          <label>
              <#if login.rememberMe??>
              <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
              <#else>
              <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
              </#if>
          </label>
        </div>
        </#if>
        <#if realm.resetPasswordAllowed>
        <div class="column">
          <p class="has-text-right"><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></p>
        </div>
        </#if>
      </div>


      <div class="field">
        <!-- Submit button -->
        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
        <input class="button is-medium is-fullwidth is-primary" tabindex="4" name="login" type="submit" value="${msg("doLogIn")}"/>
      </div>

      <#if realm.password && social.providers??>
      <div class="seperate-header">
        <p class="has-text-centered">Or via external providers</p>
      </div>

      <div id="external-providers">
        <#list social.providers as p>
        <div class="field">
          <a class="button is-medium is-fullwidth is-dark" href="${p.loginUrl}">${p.displayName}</a>
        </div>
        </#list>
      </div>
      </#if>

    </form>
    </#if>

    <#elseif section = "info">
      <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
      <div class="has-text-light-grey has-text-centered">
        ${msg("noAccount")} <a class="has-text-white has-text-weight-bold" tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
      </div>
      </#if>
    </#if>
</@layout.registrationLayout>
