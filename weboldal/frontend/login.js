app.controller('loginCtrl', function($scope, $rootScope, dbFactory) {
    $rootScope.loggedIn=0;

    $scope.login=function () {
        
        if ($scope.nev==null || $scope.jelszo==null) {
            alert('Nem adtad meg a belépési adatokat!');
            
        }
        else
        {
            $http({
                method: "POST",
                url: "./API/getOneRecord.php",
                data: {
                    'table': 'users',
                    'felt': 'Email="' + $scope.email + '" AND jelszo="' + CryptoJS.SHA1($scope.passwd) + '"'
                }
            })
            .then(function (response) {
                $scope.users=response.data;
                if ($scope.users.length==0) {
                    alert("Hibás belépési adatok!");
                } else {
                    $rootScope.loggedIn=1;
                    sessionStorage.setItem('uID',angular.toJson($scope.users.ID));
                    sessionStorage.setItem('uName',angular.toJson($scope.users.Nev));
                    sessionStorage.setItem('uMail',angular.toJson($scope.users.Email));
                    sessionStorage.setItem('uLoggedIn',angular.toJson($rootScope.loggedIn));
                    sessionStorage.setItem('uJog',angular.toJson($scope.users.jogosultsag));
                    
                    $location.path('#!/');

                }    
            })
        }
    }
});