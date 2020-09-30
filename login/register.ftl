<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <h3 class="has-text-centered is-size-3 has-text-weight-light">${msg("registerTitle")}</h3>
    <#elseif section = "form">

    <form action="${url.registrationAction}" method="post">

        <div class="field">
            <label for="email" class="label">${msg("email")}</label>
            <div class="control has-icons-left">
                <input type="text" id="email" class="input is-primary" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                <span class="icon is-small is-left">
                    <i class="material-icons">mail_outline</i>
                </span>
            </div>
        </div>

        <#if !realm.registrationEmailAsUsername>
        <div class="field">
            <label for="username" class="label">${msg("username")}</label>
            <div class="control has-icons-left">
                <input type="text" id="username" class="input is-primary" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                <span class="icon is-small is-left">
                    <i class="material-icons">person_outline</i>
                </span>
            </div>
        </div>
        </#if>

        <#if passwordRequired??>
        <div class="field">
            <label for="password" class="label">${msg("password")}</label>
            <div class="control has-icons-left">
                <input type="password" id="password" class="input is-primary" name="password" autocomplete="new-password" />
                <span class="icon is-small is-left">
                    <i class="material-icons">lock_outline</i>
                </span>
            </div>
        </div>

        <div class="field">
            <label for="password-confirm" class="label">${msg("passwordConfirm")}</label>
            <div class="control has-icons-left">
                <input type="password" id="password-confirm" class="input is-primary" name="password-confirm" autocomplete="new-password" />
                <span class="icon is-small is-left">
                    <i class="material-icons">lock_outline</i>
                </span>
            </div>
        </div>
        </#if>

        <#if recaptchaRequired??>
        <div class="field">
            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
        </div>
        </#if>

        <div class="field mt-5">
            <input class="button is-medium is-fullwidth is-primary" type="submit" value="${msg("doRegister")}"/>
        </div>

    </form>
    <#elseif section = "info">
    <div class="has-text-light-grey has-text-centered">
        <a class="has-text-white has-text-weight-bold" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
    </div>
    </#if>
</@layout.registrationLayout>
