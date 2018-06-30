(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('MyBookmarksController', ['$scope', '$http', function ($scope, $http) {
            $scope.bookmarks = [];
            $http.get('/api/bookmarks/').then(function(response) {
               $scope.bookmarks = response.data;
            });
        }]);
}());