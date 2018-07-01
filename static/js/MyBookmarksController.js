(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('MyBookmarksController', ['$scope', 'recipesService', function ($scope, recipesService) {
            $scope.bookmarks = [];
            recipesService.getUsersBookmarks().then(function(data) {
               $scope.bookmarks = data;
            });
        }]);
}());