var app= angular.module('ClickApp',["ngRoute"]);

app.run(function($rootScope, $http, $location){
    $rootScope.title = "ClickType";
    if (sessionStorage.getItem('uLoggedIn')) {
        $rootScope.loggedIn=true;
        $location.path('#!/')
    }
    else{
        $rootScope.loggedIn=false;
        $rootScope.userName="";
        $rootScope.email="";
        $rootScope.jog="";
    }
});

app.controller('reglogCtrl', function($scope, $rootScope, $http, $location){
    $scope.regist = function() {
        $scope.users = [];
        console.log("anyadat");
        if ($scope.user.name == null || $scope.user.emailreg == null || $scope.passwd1 == null || $scope.passwd2 == null) {
            alert("Nem adtál meg minden adatot!");
        } else {
            if ($scope.passwd1 != $scope.passwd2) {
                alert("A megadott jelszavak nem egyeznek!");
            } else {
                let pattern = /^[a-zA-Z0-9]{8,}$/;
                if (!$scope.passwd1.match(pattern)) {
                    alert("A jelszó nem felel meg a minimális biztonsági kritériumoknak!");
                } else {
                    $http({
                            method: "POST",
                            url: "../backend/API/getOneRecord.php",
                            data: {
                                'table': 'users',
                                'felt': 'email="' + $scope.user.emailreg + '"'
                            }
                        })
                        .then(function(response) {
                            $scope.users = response.data;

                            if ($scope.users.length != 0) {
                                alert("Ez az e-mail cím már regisztrált!");
                            } else {
                                $http({
                                        method: "POST",
                                        url: "../backend/API/insertRecord.php",
                                        data: {
                                            "table": "users",
                                            "values": {
                                                "Email": "'" + $scope.user.emailreg + "'",
                                                "Nev": "'" + $scope.user.name + "'",
                                                "ido": "'0'",
                                                "jelszo": "'" + CryptoJS.SHA1($scope.passwd1) + "'",
                                                "jogosultsag": "'1'"
                                            }
                                        }
                                    })
                                    .then(function(response) {
                                        alert(response.data.message);
                                        $scope.name = "";
                                        $scope.email = "";
                                        $scope.pass1 = "";
                                        $scope.pass2 = "";
                                        $location.path('#!/');
                                    });
                            }
                        });
                }
            }
        }
    }

    $rootScope.loggedIn= false;
        $scope.user = {emaillog: "", passwd: ""};
             $scope.login=function(){
                //console.log($scope);
                if ($scope.user.emaillog == "" || $scope.user.passwd == "") {
                    alert('Nem adtad meg a belépési adatokat!');
                }
                else
                {
                    $http({
                        method: "POST",
                        url: "../backend/API/getOneRecord.php",
                        data: {
                            'table': 'users',
                            'felt': 'Email="' + $scope.user.emaillog + '" AND jelszo="' + CryptoJS.SHA1($scope.user.passwd) + '"'
                        }
                    })
                    .then(function (response) {
                        $scope.users=response.data;
                        if ($scope.users.length==0) {
                            alert("Hibás belépési adatok!");
                        } else {
                            $rootScope.loggedIn=true;
                            $rootScope.loggedUser = $scope.users[0].Nev;
                            $rootScope.jogosultsag = $scope.users[0].jogosultsag;
                            $rootScope.userName = $scope.users[0].Nev;
                            $rootScope.email = $scope.users[0].Email;
                            sessionStorage.setItem('uID',angular.toJson($scope.users[0].ID));
                            sessionStorage.setItem('uName',angular.toJson($scope.users[0].Nev));
                            sessionStorage.setItem('uMail',angular.toJson($scope.users[0].Email));
                            sessionStorage.setItem('uLoggedIn',angular.toJson($rootScope.loggedIn));
                            sessionStorage.setItem('uJog',angular.toJson($rootScope.jogosultsag));
                            $location.path('#!/');

                        }    
                    })
                }
            }

            $scope.logout = function() {
                sessionStorage.removeItem('uName');
                sessionStorage.removeItem('uJog');
                sessionStorage.removeItem('uLoggedIn');
                sessionStorage.removeItem('uMail');
                $rootScope.userName = "";
                $rootScope.email = "";
                $rootScope.loggedUser = "";
                $rootScope.loggedIn = false;
                $location.path('#!/');
            }
        });

app.config(function($routeProvider) {
$routeProvider
    .when('/', {
        templateUrl: 'fooldal.html',
    })
    .when('/reglog', {
        templateUrl: 'belepes.html',
        controller: 'reglogCtrl',
        ID:'belep',
    })
    .when('/forum', {
        resolve: {
            function($location, $rootScope) {
                if (!$rootScope.loggedIn) {
                    $location.path('/');
                }
            }
        },
        templateUrl: 'forum.html',
    })
    .when('/gyik', {
        templateUrl: 'GYIK.html',
    })
    .when('/news', {
        resolve: {
            function($location, $rootScope) {
                if (!$rootScope.loggedIn) {
                    $location.path('/');
                }
            }
        },
        templateUrl: 'hirek.html',
    })
    .when('/aboutus', {
        templateUrl: 'rolunk.html',
    })
    .when('/stats', {
        resolve: {
            function($location, $rootScope) {
                if (!$rootScope.loggedIn) {
                    $location.path('/');
                }
            }
        },
        templateUrl: 'statisztika.html',
        controller: 'statCtrl'
    })
    .when('/download', {
        resolve: {
            function($location, $rootScope) {
                if (!$rootScope.loggedIn) {
                    $location.path('/');
                }
            }
        },
        templateUrl: 'letoltes.html',
    })
    .when('/profilemod', {
        resolve: {
            function($location, $rootScope) {
                if(!$rootScope.loggedIn) {
                    $location.path('/');
                }
            }
        },
        templateUrl: 'profilemod.html',
    })
    .when('/felhadmin', {
        resolve: {
            function($location, $rootScope) {
                if($rootScope.jogosultsag == 1) {
                    $location.path('/');
                }
            }
        },
        templateUrl: 'felhasznalok.html',
        controller: 'felhadminCtrl'
    })
    .when('/profilemod', {

        templateUrl: 'profilemod.html',
    })
});

app.controller('statCtrl', function($scope, $http){
    $scope.user = [];
    $http({
        method: "POST",
        url: "../backend/API/getAllRecords.php",
        data: {
            'whatineed': '',
            'table': 'users',
            'condition': ''
        }
    })
    .then(function (res) {
        $scope.user = res.data;
    })
});
app.controller('felhadminCtrl', function($scope,$http){
    $scope.user = [];
    $http({
        method: "POST",
        url: "../backend/API/getAllRecords.php",
        data: {
            'whatineed': '',
            'table': 'users',
            'condition': ''
        }
    })
    .then(function(res){
        $scope.user = res.data;
    })

    $scope.felhasznalok = [];
    $scope.deleteFelh = function(Id) {
        $http({
            method: "POST",
            url: "../backend/API/deleteRecord.php",
            data: {
                "table": "users",
                "id": Id,
            }
        })
        .then(function(response) {
            let index = $scope.felhasznalok.findIndex(item => item.Id === Id);
            $scope.felhasznalok.splice(index, 1);
            alert(response.data.message);
            $http({
                method: "POST",
                url: "../backend/API/getAllRecords.php",
                data: {
                    'whatineed': '',
                    'table': 'users',
                    'condition': ''                
                }
            })
            .then(function(res){
                $scope.user = res.data;
            })
        });
    }
});

app.controller('profilemodCtrl', function($scope, $http, $rootScope, $location){
    $scope.ujemail = {Email: $rootScope.email};
    $scope.ujnev = {Nev: $rootScope.userName};

    $http({
        method: "POST",
        url: "../backend/API/getOneRecord.php",
        data: {
            'table': 'users',
            'felt': 'Email="' + $rootScope.email + '"'
        }
    })
    .then(function(response) {
        $scope.Nev = response.data[0].Nev;
        $scope.Email = response.data[0].Email;
        $scope.Id = response.data[0].Id;
        $scope.jogosultsag = response.data[0].jogosultsag;
    });

    $scope.profilmod = function() {
        if ($scope.ujnev == "" || $scope.ujemail == "") {
            alert("Nem adtál meg minden adatot!");
        } else {
            $http({
                    method: "POST",
                    url: "../backend/API/getOneRecord.php",
                    data: {
                        'table': 'users',
                        'felt': 'Email="' + $scope.Email + '" AND Id<>' + $scope.Id
                    }
                })
                .then(function(response) {
                    if (response.data != "") {
                        alert("Ez az e-mail cím már foglalt!");
                    } else {
                        console.log($scope.ujemail)
                        $http({
                                method: "POST",
                                url: "../backend/API/updateRecord.php",
                                data: {
                                    'table': 'users',
                                    'id': $scope.Id,
                                    'values': {
                                        'Nev': "'" + $scope.ujnev.Nev + "'",
                                        'Email': "'" + $scope.ujemail.Email + "'"
                                    }
                                }
                            })
                            .then(function(response) {
                                alert("Rekord módosítva!");
                                sessionStorage.setItem('uName', $scope.Nev);
                                sessionStorage.setItem('uMail', $scope.Email);
                                $rootScope.userName = $scope.Nev;
                                $rootScope.email = $scope.Email;
                            });
                    }
                });
        }
    }
});

app.controller('passmodCtrl', function($scope, $http, $rootScope) {

    $scope.passmod = function() {
        if ($scope.regijelszo == null || $scope.ujjelszo == null || $scope.ujjelszo2 == null) {
            alert("Nem adtad meg az adatokat!");
        } else {
            if ($scope.ujjelszo != $scope.ujjelszo2) {
                alert("A megadott új jleszavak nem egyeznek!");
            } else {
                if ($scope.regijelszo == $scope.ujjelszo) {
                    alert("Az új jelszó megegyezik a régivel!");
                } else {
                    let pattern = /^[a-zA-Z0-9]{8,}$/;
                    if (!$scope.ujjelszo.match(pattern)) {
                        alert("A jelszó nem felel meg a minimális biztonsági kritériumoknak!");
                    } else {
                        $http({
                                method: 'POST',
                                url: '../backend/API/getOneRecord.php',
                                data: {
                                    'table': 'users',
                                    'felt': 'Email="' + $rootScope.email + '"'
                                }
                            })
                            .then(function(response) {
                                if (response.data[0].jelszo != CryptoJS.SHA1($scope.regijelszo)) {
                                    alert('Nem megfelelő a jelenlegi jelszó!');
                                } else {
                                    $http({
                                            method: 'POST',
                                            url: '../backend/API/updateRecord.php',
                                            data: {
                                                "id": response.data[0].Id,
                                                "table": "users",
                                                "values": {
                                                    "jelszo": "'" + CryptoJS.SHA1($scope.ujjelszo) + "'"
                                                }
                                            }
                                        })
                                        .then(function(response) {
                                            alert("Jelszó módosítva!");
                                        });
                                }
                            });
                    }
                }
            }
        }
    }
});
