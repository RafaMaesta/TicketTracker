angular.module('timetracker', ['ngMaterial', 'ngResource'], function($interpolateProvider) {
    $interpolateProvider.startSymbol('[{');
    $interpolateProvider.endSymbol('}]');
})
.config(function($mdThemingProvider) {
    $mdThemingProvider.theme('default')
      .primaryPalette('blue', {'default': 'A700'})
      .accentPalette('blue');
  });