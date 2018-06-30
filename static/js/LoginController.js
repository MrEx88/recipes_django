(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('LoginController', ['$scope', '$http', function ($scope, $http, $location) {
            $scope.user = {};
            
            //{username: 'admin', password: 'admin1234'}
            $scope.login = function() {
                $http.post('/auth_api/login/', $scope.user)
                    .then(function() {
                        $location.url('/');
                    })
                    .catch(function() {
                        $scope.login_error="Invalid username/password combination.";
                    });
            }
        }]);
}());