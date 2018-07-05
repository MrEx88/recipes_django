(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('NavbarController', ['$scope', 'userService', '$location', function ($scope, userService, $location) {
            
            $scope.isLoggedIn = userService.isLoggedIn();
            
            $scope.logout = function() {
                userService.logout().then(function(data) {
                    $scope.isLoggedIn = false;
                    $location.url('/login/');
                });
            }
            
            $scope.$on('loggedIn', function(event, data) {
                updateLoggedOnStatus();
            });

            function updateLoggedOnStatus() {
                userService.isLoggedIn().then(function(data) {
                    $scope.isLoggedIn = data;
                });
            }

            updateLoggedOnStatus();
        }]);
}());