app.factory('dbFactory', function($http, $q) {
    return {
        // SELECT ALL RECORDS
        selectAll: function(tablename) {
            let deferred = $q.defer();
            let data = {
                table: tablename
            }
            $http.post('../Backend/getAllRecords.php', data).then(function(response) {
                    deferred.resolve(response);
                },
                function(err) {
                    deferred.reject(err);
                }
            )
            return deferred.promise;
        },

        // SELECT ONE RECORD
        select: function(tablename, condition) {
            let deferred = $q.defer();
            let data = {
                table: tablename,
                condition: condition
            }
            $http.post('../Backend/getOneRecord.php', data).then(function(response) {
                    deferred.resolve(response);
                },
                function(err) {
                    deferred.reject(err);
                }
            )
            return deferred.promise;
        },

        // INSERT ONE RECORD
        insert: function(tablename, values) {
            let deferred = $q.defer();
            let data = {
                table: tablename,
                values: values
            }
            $http.post('../Backend/insertRecord.php', data).then(function(response) {
                    deferred.resolve(response);
                },
                function(err) {
                    deferred.reject(err);
                }
            )
            return deferred.promise;
        },

        // UPDATE ONE RECORD
        update: function(tablename, id, values) {
            let deferred = $q.defer();
            let data = {
                id: id,
                table: tablename,
                values: values
            }
            console.log(data);
            $http.post('../Backend/updateRecord.php', data).then(function(response) {
                    deferred.resolve(response);
                },
                function(err) {
                    deferred.reject(err);
                }
            )
            return deferred.promise;
        },

        // DELETE ONE RECORD
        delete: function(tablename, id) {
            let deferred = $q.defer();
            let data = {
                table: tablename,
                id: id
            }
            $http.post('../Backend/deleteRecord.php', data).then(function(response) {
                    deferred.resolve(response);
                },
                function(err) {
                    deferred.reject(err);
                }
            )
            return deferred.promise;
        },

        // DELETE ALL RECORDS
        deleteAll: function(tablename) {
            let deferred = $q.defer();
            let data = {
                table: tablename
            }
            $http.post('../Backend/deleteAllRecords.php', data).then(function(response) {
                    deferred.resolve(response);
                },
                function(err) {
                    deferred.reject(err);
                }
            )
            return deferred.promise;
        }
    }
});