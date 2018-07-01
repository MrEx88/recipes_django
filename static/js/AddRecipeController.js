(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('AddRecipeController', ['$scope', 'recipesService', function ($scope, recipesService) {
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
                recipesService.addRecipe($scope.recipe)
                    .then(function(data) {
                        //redirect to recipes
                    })
                    .catch(function() {
                        alert('error saving recipe');
                    });
            };
        }]);
})();