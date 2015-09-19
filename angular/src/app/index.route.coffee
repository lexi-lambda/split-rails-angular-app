angular.module 'rstatus'
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'dashboard',
        url: '/dashboard'
        templateUrl: 'app/dashboard/dashboard.html'
        controller: 'DashboardController'
        controllerAs: 'vm'
      .state 'logout',
        url: '/logout'
        controller: 'LogoutController'
      .state 'sign-in',
        url: '/sign-in'
        templateUrl: 'app/sign-in/sign-in.html'
        controller: 'SignInController'
        controllerAs: 'vm'
      .state 'sign-up',
        url: '/sign-up'
        templateUrl: 'app/sign-up/sign-up.html'
        controller: 'SignUpController'
        controllerAs: 'vm'
      .state 'sign-up-confirm',
        url: '/sign-up/confirm/:confirmationToken'
        templateUrl: 'app/sign-up/confirm/confirm.html'
        controller: 'ConfirmController'
        controllerAs: 'vm'
      .state 'sign-up-confirmation-sent',
        url: '/sign-up/confirmation-sent'
        templateUrl: 'app/sign-up/confirmation-sent/confirmation-sent.html'

    $urlRouterProvider.otherwise '/sign-in'
