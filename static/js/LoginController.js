(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('LoginController', ['$scope', 'userService', '$location', function ($scope, userService, $location) {
            $scope.user = {};
            
            $scope.login = function() {
                userService.login($scope.user).then(function(data) {
                    $location.url('/');
                })
                .catch(function() {
                    $scope.login_error="Invalid username/password combination.";
                });
            }
        }]);
}());