(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('MyRecipesController', ['$scope', 'recipesService', function ($scope, recipesService) {
            $scope.recipes = [];
            $scope.sortOrder = '-modified';
            
            recipesService.getUsersRecipes().then(function(data) {
                $scope.recipes = data;
            });
            
            $scope.ingredientsToArray = function(ingredients) {
                return ingredients.split('\r\n');
            }
        }]);
}());