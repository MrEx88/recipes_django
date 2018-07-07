(function () {
    'use strict';
    
    angular.module('recipes')
        .directive('recipeTile', function() {
            return {
                templateUrl: '/static/html/recipe-tile.html',
                restrict: 'E'
            }
        });
})();