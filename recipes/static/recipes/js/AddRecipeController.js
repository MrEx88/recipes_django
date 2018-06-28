(function(){
    'use strict';
    
    angular.module('recipes')
        .controller('AddRecipeController', ['$scope', '$http', function ($scope, $http) {
            $scope.recipe = {};
            
            $scope.image = null;
            $scope.imageFileName = '';
            
            $scope.uploadme = {};
            $scope.uploadme.src = '';
            
            $scope.addRecipe = function() {
                var now = new Date();
                $scope.recipe.created = now;
                $scope.recipe.modified = now;
                $scope.recipe.user = 1; // todo: find out how to get user id
                //$scope.recipe.base64Image = $scope.image; //see if we can send image this way
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