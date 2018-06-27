(function(){
    'use strict';
    
    angular.module('recipes')
        .controller('AddRecipeController', ['$scope', '$http', function ($scope, $http) {
            $scope.recipe = {};
            
            $scope.addRecipe = function() {
                var now = new Date();
                $scope.recipe.created = now;
                $scope.recipe.modified = now;
                $scope.recipe.user = 1; // todo: find out how to get user id
                $http.post('/recipes/recipes/', $scope.recipe)
                    .then(function(response) {
                        //redirect to recipes
                    })
                    .catch(function() {
                        alert('error saving recipe');
                    });
            };
        }
    ]);
})();