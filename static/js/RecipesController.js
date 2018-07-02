(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('RecipesController', ['$scope', '$location', 'recipesService', function ($scope, $location, recipesService) {
            $scope.recipes = [];
            $scope.sortOrder = '-modified';
            var titles = {
                '/myRecipes/': 'My Recipes',
                '/allRecipes/': 'All Recipes'
            }
            $scope.title = titles[$location.path()];
            console.log($location.path());
            recipesService.getUsersRecipes().then(function(data) {
                $scope.recipes = data;
            });
            
            $scope.ingredientsToArray = function(ingredients) {
                return ingredients.split('\r\n');
            }
        }]);
}());