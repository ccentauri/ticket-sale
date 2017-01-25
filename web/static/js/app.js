'use strict';

var app = angular.module('BaseApp',
    ['ngMaterial', 'ngMessages', 'material.svgAssetsCache']);

app.config(function ($mdIconProvider, $mdThemingProvider) {
    $mdIconProvider.defaultIconSet('/resources/mdi.svg');

    $mdThemingProvider.theme('default')
        .primaryPalette('blue')
        .accentPalette('orange');

    $mdThemingProvider.enableBrowserColor({
        palette: 'accent', // Default is 'primary', any basic material palette and extended palettes are available
        hue: '200' // Default is '800'
    });
});

app.controller('ToolbarController', ['$scope', '$window', function ($scope, $window) {
    var originatorEv;

    this.openMenu = function ($mdOpenMenu, ev) {
        originatorEv = ev;
        $mdOpenMenu(ev);
    };

    this.redirect = function (url) {
        window.location.href = url;
    };
}]);