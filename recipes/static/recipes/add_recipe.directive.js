(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('addRecipe', function() {
            return {
                templateUrl: '/static/recipes/add_recipe.html',
                restrict: 'E'
            }
        });
})();