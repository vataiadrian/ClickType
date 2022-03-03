    app.controller('loginCtrl', function($scope, $rootScope, $http) {
        $rootScope.loggedIn=0;
        $scope.user = {email: "", passwd: ""};
             $scope.login=function(){
                //console.log($scope);
                if ($scope.user.email == "" || $scope.user.passwd == "") {
                    alert('Nem adtad meg a belépési adatokat!');
                }
                else
                {
                    $http({
                        method: "POST",
                        url: "../backend/API/getOneRecord.php",
                        data: {
                            'table': 'users',
                            'felt': 'Email="' + $scope.user.email + '" AND jelszo="' + CryptoJS.SHA1($scope.user.passwd) + '"'
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
                            console.log("anyadat")
                            //$location.path('#!/');

                        }    
                    })
                }
            }
        });