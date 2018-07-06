(function() {
    'use strict';
    
    angular.module('recipes')
        .service('bookmarksService', ['$http', function($http) {
            var self = this;
            self.shared = [];

            this.getUsersBookmarks = function() {
                //todo: need to add user id some how. Or do I. maybe i can do it in django
                return $http.get('/api/bookmarks/')
                    .then(function(response) {
                        self.shared = response.data;
                        return response.data;
                    })
                    .catch(function(response) {
                        self.shared = [];
                        return [];
                    });
            }
        }])
        .controller('BookmarksController', ['$scope', '$uibModal', 'bookmarksService', function ($scope, $uibModal, bookmarksService) {
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

            bookmarksService.getUsersBookmarks().then(function(data) {
                $scope.bookmarks = bookmarksService.shared;
            });
        }])
        .controller('AddBookmarkController', ['$scope', '$http', '$uibModalInstance', '$rootScope', 'bookmarksService', function ($scope, $http, $uibModalInstance, $rootScope, bookmarksService) {
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

                        bookmarksService.getUsersBookmarks();
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

            $scope.deleteSelected = function(closeAfterSave) {
                for (var i = 0; i < $scope.bookmarks.length; i++) {
                    if ($scope.bookmarks[i].isSelected) {
                        $http.delete('/api/bookmarks/' + $scope.bookmarks[i].id + '/')
                            .then(function(response) {
                                console.log($scope.bookmarks.splice(i, 1));
                                bookmarksService.shared = $scope.bookmarks;
                            });
                    }
                }
                
                if (closeAfterSave) {
                    $scope.close();
                }
            }

            $scope.close = function () {
                $uibModalInstance.dismiss('cancel');
            };
        }]);
}());