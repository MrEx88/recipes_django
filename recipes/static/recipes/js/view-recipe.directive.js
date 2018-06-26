(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('viewRecipe', function() {
            return {
                templateUrl: '/static/recipes/angularjsTemplates/view-recipe.html',
                restrict: 'E'
            }
        });
})();