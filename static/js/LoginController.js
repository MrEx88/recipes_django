(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('LoginController', ['$scope', '$rootScope', '$location', 'userService', function ($scope, $rootScope, $location, userService) {
            $scope.user = {};
            
            $scope.login = function() {
                userService.login($scope.user).then(function(data) {
                    $rootScope.$broadcast('loggedIn', data);
                    $location.url('/');
                })
                .catch(function() {
                    $scope.login_error="Invalid username/password combination.";
                });
            }
        }]);
}());