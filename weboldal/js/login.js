app.controller('loginCtrl', function($scope, $rootScope, dbFactory) {
    $rootScope.loggedIn=0;

    $scope.login=function () {
        
        if ($scope.nev==null || $scope.jelszo==null) {
            console.log("asd "+$scope.nev);
            console.log("asdf "+$scope.jelszo);
            alert('Nem adtad meg a belépési adatokat!');
            
        }
        else
        {
            dbFactory.select('felhasznalok', 'nev="'+$scope.nev+'" AND jelszo="'+CryptoJS.SHA1($scope.jelszo)+'"')
            .then(function (response) {
                $scope.users=response.data;
                if ($scope.users.length==0) {
                    alert("Hibás belépési adatok!");
                } else {
                    $rootScope.loggedIn=1;
                    sessionStorage.setItem('uID',angular.toJson($scope.users.ID));
                    sessionStorage.setItem('uName',angular.toJson($scope.users.nev));
                    sessionStorage.setItem('uLoggedIn',angular.toJson($rootScope.loggedIn));
                    
                    $rootScope.userName=$scope.users.nev;
                    console.log("Belépés sikerült!");
                    alert("Belépés sikerült!");
                }    
            })
        }
    }

    $scope.logout=function () {
        sessionStorage.removeItem('uID');
        sessionStorage.removeItem('uName');
        sessionStorage.removeItem('uLoggedIn');
        $rootScope.loggedIn=0;
        $rootScope.userName="";
    }
});