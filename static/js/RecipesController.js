(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('RecipesController', ['$scope', '$location', 'recipesService', function ($scope, $location, recipesService) {
            $scope.recipes = [];
            $scope.showFilters = false;
            $scope.sortOrder = '-modified';
            var titles = {
                '/myRecipes/': 'My Recipes',
                '/allRecipes/': 'All Recipes'
            }
            $scope.title = titles[$location.path()];
            $scope.tags = [];

            $scope.ingredientsToArray = function(ingredients) {
                return ingredients.split('\r\n');
            }

            $scope.setTagFilter = function(tagName) {
                $scope.tags = [tagName];
            }

            $scope.tagFilter = function(recipe) {
                var show =  $scope.tags.length == 0;
                if (!show) {
                    angular.forEach(recipe.tags, function(tag) {
                        for (var i = 0; i < $scope.tags.length; i++) {
                            if (tag.name == $scope.tags[i]) {
                                show = true;
                                break;
                            }
                        }
                    });
                }
                return show;
            }

            recipesService.getUsersRecipes().then(function(data) {
                $scope.recipes = data;
            });
        }])
        .controller('RecipeDetailController', ['$scope', '$routeParams', 'recipesService', function($scope, $routeParams, recipesService) {
            for (var i = 0; i < recipesService.shared.length; i++) {
                if (recipesService.shared[i].id == $routeParams.id) {
                    $scope.recipe = recipesService.shared[i];
                    break;
                }
            }
        }]);
}());