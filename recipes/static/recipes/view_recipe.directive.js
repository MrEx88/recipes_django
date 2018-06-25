(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('viewRecipe', function() {
            return {
                templateUrl: '/static/recipes/view_recipe.html',
                restrict: 'E'
            }
        });
})();