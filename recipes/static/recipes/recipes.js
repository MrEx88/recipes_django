(function(){
    'use strict';
    
    angular.module('recipes', [])
        .controller('RecipesController', ['$scope', '$http', RecipesController]);
        
    function RecipesController($scope, $http) {
        $scope.show = {
            add_recipe: false,
            view_recipes: true,
        }
        
        $scope.add = function() {
            $scope.showView('add_recipe');
        };
        
        $scope.cancelAdd = function() {
            $scope.showView('view_recipes');
        };
        
        $scope.showView = function(key) {
            if ($scope.show.hasOwnProperty(key)) {
                for (var k in $scope.show) {
                    $scope.show[k] = (key == k);
                }
            }
        }
        
        $scope.recipes = [];
        $http.get('/recipes/recipes').then(function(response) {
           $scope.recipes = response.data; 
        });
        
        $scope.getIngredientRowCount = function(ingredients) {
            return (ingredients.match(/\r\n/g) || []).length;
        }
    }
}());