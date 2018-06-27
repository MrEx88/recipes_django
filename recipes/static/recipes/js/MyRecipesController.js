(function(){
    'use strict';
    
    angular.module('recipes')
        .controller('MyRecipesController', ['$scope', '$http', function ($scope, $http) {
            $scope.recipes = [];
            $http.get('/recipes/recipes').then(function(response) {
               $scope.recipes = response.data; 
            });
            
            $scope.getIngredientRowCount = function(ingredients) {
                return (ingredients.match(/\r\n/g) || []).length;
            }
            
            $scope.ingredientsToArray = function(ingredients) {
                return ingredients.split("\n");
            }
        }
    ]);
}());