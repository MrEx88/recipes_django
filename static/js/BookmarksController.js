(function() {
    'use strict';

    angular.module('recipes')
        .service('bookmarksService', ['$http', function($http) {
            var self = this;
            self.shared = [];

            this.addBookmark = function(bookmark) {
                return $http.post('/api/bookmarks/', bookmark)
                    .then(function(response) {
                        self.shared.push(bookmark);
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

            $scope.delete = function(bookmark) {
                if (confirm(`Are you sure you want to delete ${bookmark.name}?`)) {
                    bookmarksService.deleteBookmark(bookmark)
                        .then(function(data) {
                            //todo: add sucess message https://stackoverflow.com/questions/23412880/how-to-show-message-for-a-certain-time-in-angularjs
                        });
                }
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

            $scope.selectAll = function() {
                for (var i = 0; i < $scope.bookmarks.shared.length; i++) {
                    $scope.bookmarks.shared[i].isSelected = $scope.isSelectAll;
                }
            }

            $scope.selectUnselectRows = function(index, event) {
                const LEFT_MOUSE_BTN = 1;
                if (event.which == LEFT_MOUSE_BTN) {
                    var row = $scope.bookmarks.shared[index];
                    row.rowIndex = index;

                    if (!event.ctrlKey && !event.shiftKey) {
                        $scope.clearSelected();
                        $scope.toggleRow(row);
                        $scope.selectionPivot = row;
                    }
                    else if(event.ctrlKey) {
                        $scope.toggleRow(row);
                        $scope.selectionPivot = row;
                    }
                    else if(event.shiftKey) {
                        $scope.clearSelected();
                        $scope.selectRowsBetweenIndexes($scope.selectionPivot.rowIndex, row.rowIndex);
                    }
                }
            }

            $scope.clearSelected = function() {
                for (var i = 0; i < $scope.bookmarks.shared.length; i++) {
                    $scope.bookmarks.shared[i].isSelected = false;
                }
            }

            $scope.toggleRow = function (row) {
                row.isSelected = !(row.isSelected);
            }

            $scope.selectRowsBetweenIndexes = function (index1, index2) {
                var bottom = Math.min(index1, index2);
                var top = Math.max(index1, index2);

                for (var i = bottom; i <= top; i++) {
                    $scope.bookmarks.shared[i].isSelected = true;
                }
            }

            $scope.isRowSelected = function (index) {
                return $scope.bookmarks.shared[index].isSelected;
            }

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
                        bookmarksService.deleteBookmark($scope.bookmarks.shared[i])
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