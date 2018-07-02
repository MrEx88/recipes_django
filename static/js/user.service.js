(function() {
    angular.module('recipes').factory('userService', ['$http', function($http) {
        loggedInUser = {};
        return {
            login: function(user) {
                return $http.post('/auth_api/login/', user)
                            .then(function(response) {
                                loggedInUser = response.data;
                                return loggedInUser;
                            });
            },
            logout: function() {
                return $http.get('/auth_api/logout/')
                            .then(function(response) {
                                loggedInUser = {};
                                return response.data;
                            });
            },
            isLoggedIn: function() {
                return angular.equals(loggedInUser, {});
            }
        };
    }]);
})();