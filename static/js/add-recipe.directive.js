(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('addRecipe', function() {
            return {
                templateUrl: '/static/html/add-recipe.html',
                restrict: 'E'
            }
        });
})();