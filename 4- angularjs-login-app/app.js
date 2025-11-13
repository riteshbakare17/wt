// Define AngularJS App
var app = angular.module("userApp", []);

// Define Controller
app.controller("userController", function ($scope) {

    // Initialize
    $scope.showLogin = true;
    $scope.registerMessage = "";
    $scope.loginMessage = "";

    // Toggle between Login and Registration
    $scope.toggleView = function () {
        $scope.showLogin = !$scope.showLogin;
        $scope.registerMessage = "";
        $scope.loginMessage = "";
    };

    // Registration Function
    $scope.register = function () {
        let users = JSON.parse(localStorage.getItem("users") || "[]");

        // Check if username already exists
        let exists = users.some(u => u.username === $scope.newUser.username);
        if (exists) {
            $scope.registerMessage = "⚠️ Username already exists!";
            return;
        }

        // Save new user
        users.push({
            firstName: $scope.newUser.firstName,
            lastName: $scope.newUser.lastName,
            username: $scope.newUser.username,
            password: $scope.newUser.password
        });

        localStorage.setItem("users", JSON.stringify(users));
        $scope.registerMessage = "✅ Registration successful!";
        $scope.newUser = {}; // Clear fields
    };

    // Login Function
    $scope.login = function () {
        let users = JSON.parse(localStorage.getItem("users") || "[]");
        let validUser = users.find(u =>
            u.username === $scope.loginUser.username &&
            u.password === $scope.loginUser.password
        );

        if (validUser) {
            $scope.loginMessage = "🎉 Login successful! Welcome " + validUser.firstName + "!";
        } else {
            $scope.loginMessage = "❌ Invalid username or password!";
        }
    };
});
