(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('MyRecipesController', ['$scope', '$http', function ($scope, $http) {
            $scope.recipes = [];
            //$http.post('/auth_api/login/', {username: 'admin', password: 'admin1234'});
            
            $http.get('/api/recipes/').then(function(response) {
               $scope.recipes = response.data;
            });
            
            $scope.getIngredientRowCount = function(ingredients) {
                return (ingredients.match(/\r\n/g) || []).length;
            }
            
            $scope.ingredientsToArray = function(ingredients) {
                return ingredients.split("\n");
            }
        }]);
}());