(function() {
    'use strict';
    
    angular.module('recipes').run(['$http', function($http) {
        $http.defaults.xsrfHeaderName = 'X-CSRFToken';
        $http.defaults.xsrfCookieName = 'csrftoken';
    }]);
})();