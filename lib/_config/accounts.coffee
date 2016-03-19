# See https://github.com/meteor-useraccounts/core/blob/master/Guide.md

AccountsTemplates.addField
    _id: 'phone_number'
    type: 'tel'
    displayName: "Vodafone Cash Phone Number"
    required: true

AccountsTemplates.configure
  defaultLayout: 'homeLayoutWithNavbar'

AccountsTemplates.configure
  
  # Behaviour
  confirmPassword: false
  enablePasswordChange: false
  forbidClientAccountCreation: false
  overrideLoginErrors: true
  sendVerificationEmail: false
  lowercaseUsername: false
  
  # Appearance
  showAddRemoveServices: false
  showForgotPasswordLink: false
  showLabels: true
  showPlaceholders: true
  showResendVerificationEmailLink: false
  
  # Client-side Validation
  continuousValidation: false
  negativeFeedback: false
  negativeValidation: true
  positiveValidation: false
  positiveFeedback: true
  showValidating: true
  
  # Privacy Policy and Terms of Use
  # privacyUrl: Config.privacyUrl || null
  # termsUrl: Config.termsUrl || null
  
  # Redirects
  homeRoutePath: Config.dashboardRoute || null
  
  # Hooks
  onLogoutHook: ->
    console.log 'logout'

  onSubmitHook: ->
    console.log 'submitting form'

AccountsTemplates.configureRoute 'signIn',
  name: 'signin'
  path: '/sign-in'
  redirect: ->
    Router.go '/admin'

AccountsTemplates.configureRoute 'signUp',
  name: 'signup'
  path: '/signup'
  redirect: ->
    user = Meteor.user()
    if user
      Router.go '/admin'
    return