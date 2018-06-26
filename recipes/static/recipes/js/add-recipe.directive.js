(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('addRecipe', function() {
            return {
                templateUrl: '/static/recipes/angularjsTemplates/add-recipe.html',
                restrict: 'E'
            }
        });
})();