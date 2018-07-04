(function() {
    'use strict';
    
    angular.module('recipes')
        .controller('BookmarksController', ['$scope', '$uibModal', 'recipesService', function ($scope, $uibModal, recipesService) {
            $scope.bookmarks = [];

            $scope.add = function() {
                console.log('opening modal');
                var modalInstance = $uibModal.open({
                    templateUrl: '/static/html/add-bookmark.html',
                    controller: 'AddBookmarkController'
                });
            }

            recipesService.getUsersBookmarks().then(function(data) {
               $scope.bookmarks = data;
            });
        }])
        .controller('AddBookmarkController', ['$scope', '$http', '$uibModalInstance', function ($scope, $http, $uibModalInstance) {
            $scope.bookmark = {};

            $scope.save = function(closeAfterSave) {
                $scope.bookmark.user = 1; //todo: figure out how to add user.
                $http.post('/api/bookmarks/', $scope.bookmark)
                    .then(function(response) {
                        if (closeAfterSave) {
                            $scope.close();
                        }
                        else {
                            $scope.bookmark = {};
                        }
                    });
            }

            $scope.close = function () {
                $uibModalInstance.dismiss('cancel');
            };
        }]);
}());