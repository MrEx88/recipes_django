(function(){
    'use strict';
    
    angular.module('recipes').directive('saveScroll', function ($document, $timeout, $location) {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                scope.okSaveScroll = true;

                scope.scrollPos = {};

                $document.bind('scroll', function () {
                    if (scope.okSaveScroll) {
                        scope.scrollPos[$location.path()] = $(window).scrollTop();
                    }
                });

                scope.scrollClear = function (path) {
                    scope.scrollPos[path] = 0;
                };

                scope.$on('$locationChangeSuccess', function (route) {
                    $timeout(function () {
                        $(window).scrollTop(scope.scrollPos[$location.path()] ? scope.scrollPos[$location.path()] : 0);
                        scope.okSaveScroll = true;
                        $(window).scrollTop(400);
                        $(window).scrollY = 400;
                    }, 0);
                });

                scope.$on('$locationChangeStart', function (event) {
                    scope.okSaveScroll = false;
                });
            }
        };
    });
})();