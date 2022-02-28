var app= angular.module('pizzaApp',[]);

app.run(function($rootScope, $http){
    if (sessionStorage.getItem['uID']) {
        $rootScope.loggedIn=1;
        $rootScope.userName=sessionStorage.getItem('uName');  
    }
    else{
        $rootScope.loggedIn=0;
    }
});