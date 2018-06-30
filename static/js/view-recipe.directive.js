(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('viewRecipe', function() {
            return {
                templateUrl: '/static/html/view-recipe.html',
                restrict: 'E'
            }
        });
})();