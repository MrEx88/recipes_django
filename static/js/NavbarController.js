(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('NavbarController', ['$scope', 'userService', '$location', function ($scope, userService, $location) {
            
            $scope.isLoggedIn = function() {
                return false;
                console.log(userService.isLoggedIn());
                //return userService.isLoggedIn();
            }
            
            $scope.logout = function() {
                userService.logout().then(function(data) {
                    $location.url('/login/');
                });
            }
        }]);
}());