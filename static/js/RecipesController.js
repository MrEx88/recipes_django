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
            
            $scope.ingredientsToArray = function(ingredients) {
                return ingredients.split('\r\n');
            }

            recipesService.getUsersRecipes().then(function(data) {
                $scope.recipes = data;
            });
        }]);
}());