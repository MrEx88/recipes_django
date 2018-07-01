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
                return $http.post('/auth_api/logout/')
                            .then(function(response) {
                                return response.data;
                            });
            },
            isLoggedIn: function() {
                return loggedInUser.username != undefined && loggedInUser.usernname != "" && loggedInUser.username != null;
            }
        };
    }]);
})();