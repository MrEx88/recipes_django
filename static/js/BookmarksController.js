(function() {
    'use strict';
    
    angular.module('recipes')
        .service('bookmarksService', function() {
            this.shared = [];
        })
        .controller('BookmarksController', ['$scope', '$uibModal', 'recipesService', 'bookmarksService', function ($scope, $uibModal, recipesService, bookmarksService) {
            $scope.bookmarks = [];

            $scope.add = function() {
                var modalInstance = $uibModal.open({
                    templateUrl: '/static/html/add-bookmark.html',
                    controller: 'AddBookmarkController'
                });
            }

            $scope.editAll = function() {
                var modalInstance = $uibModal.open({
                    templateUrl: '/static/html/edit-bookmarks.html',
                    controller: 'EditBookmarksController'
                });
            }

            $scope.$on('bookmarkAdded', function(event, data) {
                $scope.bookmarks.push(data);
            });

            recipesService.getUsersBookmarks().then(function(data) {
                $scope.bookmarks = data;
                bookmarksService.shared = data;
            });
        }])
        .controller('AddBookmarkController', ['$scope', '$http', '$uibModalInstance', '$rootScope', function ($scope, $http, $uibModalInstance, $rootScope) {
            $scope.bookmark = {};

            $scope.save = function(closeAfterSave) {
                $scope.bookmark.user = 1; //todo: figure out how to add user.
                $http.post('/api/bookmarks/', $scope.bookmark)
                    .then(function(response) {
                        $rootScope.$broadcast('bookmarkAdded', $scope.bookmark);
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
        }])
        .controller('EditBookmarksController', ['$scope', '$http', '$uibModalInstance', '$rootScope', 'bookmarksService', function ($scope, $http, $uibModalInstance, $rootScope, bookmarksService) {
            $scope.bookmarks = bookmarksService.shared;

            $scope.saveEdits = function(closeAfterSave) {
                angular.forEach($scope.bookmarks, function(bookmark) {
                    $http.put('/api/bookmarks/' + bookmark.id + '/', bookmark)
                        .then(function(response) {
                            
                        });
                });
                bookmarksService.shared = $scope.bookmarks;
                if (closeAfterSave) {
                    $scope.close();
                }
            }

            $scope.close = function () {
                $uibModalInstance.dismiss('cancel');
            };
        }]);
}());