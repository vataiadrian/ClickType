app.controller('regCtrl', function($scope, $http){
    $scope.regist = function() {
        $scope.users = [];
        console.log("anyadat");
        if ($scope.user.name == null || $scope.user.email == null || $scope.passwd1 == null || $scope.passwd2 == null) {
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
                                'felt': 'email="' + $scope.user.email + '"'
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
                                                "Email": "'" + $scope.user.email + "'",
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
                                        //   $location.path('#!/');
                                    });
                            }
                        });
                }
            }
        }
    }
})