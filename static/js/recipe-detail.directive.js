(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('recipeDetail', function() {
            return {
                templateUrl: '/static/html/recipe-detail.html',
                restrict: 'E'
            }
        });
})();