(function() {
    'use strict';

    angular.module('recipes')
        .service('bookmarksService', ['$http', function($http) {
            var self = this;
            self.shared = [];

            this.addBookmark = function(bookmark) {
                return $http.post('/api/bookmarks/', bookmark)
                    .then(function(response) {
                        shared.push(bookmark);
                        return response.data;
                    });
            }

            this.getBookmarks = function() {
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

            this.updateBookmark = function(bookmark) {
                return $http.put('/api/bookmarks/' + bookmark.id + '/', bookmark)
                        .then(function(response) {
                            for (var i = 0; i < self.shared.length; i++) {
                                if (self.shared[i].id == bookmark.id) {
                                    self.shared[i] = bookmark;
                                    break;
                                }
                            }
                            return response.data;
                        });
            }

            this.deleteBookmark = function(bookmark) {
                return $http.delete('/api/bookmarks/' + bookmark.id + '/')
                    .then(function(response) {
                        var index = self.shared.indexOf(bookmark);
                        self.shared.splice(index, 1);
                        return response.data;
                    });
            }
        }])
        .controller('BookmarksController', ['$scope', '$uibModal', 'bookmarksService', function ($scope, $uibModal, bookmarksService) {
            $scope.bookmarks = bookmarksService;

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

            bookmarksService.getBookmarks();
        }])
        .controller('AddBookmarkController', ['$scope', '$uibModalInstance', 'bookmarksService', function ($scope, $uibModalInstance, bookmarksService) {
            $scope.bookmark = {};

            $scope.save = function(closeAfterSave) {
                $scope.bookmark.user = 1; //todo: figure out how to add user.
                bookmarksService.addBookmark($scope.bookmark)
                    .then(function(data) {
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
        .controller('EditBookmarksController', ['$scope', '$uibModalInstance', 'bookmarksService', function ($scope, $uibModalInstance, bookmarksService) {
            $scope.bookmarks = bookmarksService;

            $scope.saveEdits = function(closeAfterSave) {
                angular.forEach($scope.bookmarks.shared, function(bookmark) {
                    bookmarksService.updateBookmark(bookmark)
                        .then(function(data) {
                            
                        });
                });

                if (closeAfterSave) {
                    $scope.close();
                }
            }

            $scope.deleteSelected = function(closeAfterSave) {
                for (var i = 0; i < $scope.bookmarks.shared.length; i++) {
                    if ($scope.bookmarks.shared[i].isSelected) {
                        bookmarksService.deleteUsersBookmark($scope.bookmarks.shared[i])
                            .then(function(data) {
                                
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