(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('LoginController', ['$scope', 'userService', '$location', function ($scope, userService, $location) {
            $scope.user = {};
            
            //{username: 'admin', password: 'admin1234'}
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