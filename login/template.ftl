<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>${msg("loginTitle",(realm.displayName!''))}</title>
  <link rel="icon" href="${url.resourcesCommonPath}/img/favicon.ico" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.0/css/bulma.min.css"
        integrity="sha256-aPeK/N8IHpHsvPBCf49iVKMdusfobKo2oxF8lRruWJg=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css" integrity="sha512-mRuH7OxetZB1XiSaKZ2fxENKgxVvx3ffpzX0FUcaP6GBqAuqOLc8YiC/3EVTUVt5p5mIRT5D9i4LitZUQKWNCg==" crossorigin="anonymous" />
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css">


</head>

<body>
  <div class="hero is-primary is-fullheight auth-background">
    <div id="particles-js"></div>
    <div class="hero-body">
      <div class="container">
        <div class="columns">
          <div class="column is-one-third-desktop is-offset-one-third-desktop is-half-tablet is-offset-one-quarter-tablet">
            <h3 class="has-text-centered is-size-3 has-text-weight-light mb-4">
              ${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
            </h3>

            <#-- App-initiated actions should not see warning messages about the need to complete the action -->
            <#-- during login.                                                                               -->
            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="notification is-<#if message.type == 'error'>warning<#else>${message.type}</#if>">
                <button class="delete"></button>
                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                <span>${kcSanitize(message.summary)?no_esc}</span>
            </div>
            </#if>

            <div class="content box">
              <#nested "header">
              <#nested "form">
            </div>
            <#nested "info">
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
        (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
            $notification = $delete.parentNode;
            $delete.addEventListener('click', () => {
                $notification.parentNode.removeChild($notification);
            });
        });

        particlesJS.load('particles-js', '${url.resourcesPath}/js/particles.json');
    });
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js" integrity="sha512-Kef5sc7gfTacR7TZKelcrRs15ipf7+t+n7Zh6mKNJbmW+/RRdCW9nwfLn4YX0s2nO6Kv5Y2ChqgIakaC6PW09A==" crossorigin="anonymous"></script>
  
</body>
</html>
</#macro>
