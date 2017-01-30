<!DOCTYPE HTML>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title>Welcome</title>

    <jsp:include page="include/angular_common.jsp"/>
</head>

<body ng-app="BaseApp" ng-cloak>

<md-content ng-controller="LoginFormController"
            class="md-padding"
            layout="row"
            layout-align="center center">
    <md-card md-whiteframe="8"
             flex="50"
             flex-xs="90"
             layout="column"
             layout-align="center">
        <md-tabs class="md-primary"
                 md-dynamic-height
                 md-border-bottom
                 md-stretch-tabs="always">
            <md-tab label="Login">
                <div class="md-padding">
                    <form name="loginForm"
                          action="<c:url value='/login'/>"
                          method='POST'>
                        <div layout="row"
                             layout-align="center">
                            <md-input-container class="md-block"
                                                flex="50"
                                                layout="row"
                                                layout-align="center">
                                <label>Username or email</label>
                                <input md-maxlength="30"
                                       required
                                       md-no-asterisk
                                       name="username"
                                       ng-model="login.username">

                                <div ng-messages="loginForm.username.$error">
                                    <div ng-message="required">This is required.</div>
                                    <div ng-message="md-maxlength">Username or email must be less than 30 characters
                                        long.
                                    </div>
                                </div>
                            </md-input-container>
                        </div>

                        <div layout="row"
                             layout-align="center">
                            <md-input-container class="md-block"
                                                flex="50"
                                                layout="column"
                                                layout-align="center">
                                <label>Password</label>
                                <input md-maxlength="30"
                                       required
                                       type="password"
                                       md-no-asterisk
                                       name="password"
                                       ng-model="login.password">

                                <div ng-messages="loginForm.password.$error">
                                    <div ng-message="required">This is required.</div>
                                    <div ng-message="md-maxlength">Password must be less than 30 characters long.</div>
                                </div>
                            </md-input-container>
                        </div>

                        <div layout="row"
                             layout-align="center center">
                            <md-button class="md-raised md-primary"
                                       flex="33"
                                       layout-align="center"
                                       type="submit">Submit
                            </md-button>
                        </div>
                    </form>
                </div>
            </md-tab>

            <md-tab label="Register">
                <md-content>
                    <form:form name="registerForm"
                               action="/register/"
                               modelAttribute="user"
                               enctype="multipart/form-data"
                               method="post">
                        <input type="hidden" id="registerData" name="data">
                        <md-content class="md-padding" md-theme="docs-dark" layout="row">
                            <md-input-container flex="50">
                                <label>First name</label>
                                <form:input required="required"
                                            path="name"
                                            ng-model="register.name"/>
                                <div ng-messages="registerForm.name.$error">
                                    <div ng-message="required">This is required.</div>
                                </div>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Last name</label>
                                <form:input required="required"
                                            path="surname"
                                            ng-model="register.surname"/>
                                <div ng-messages="registerForm.surname.$error">
                                    <div ng-message="required">This is required.</div>
                                </div>
                            </md-input-container>
                        </md-content>

                        <md-subheader class="md-primary">Main info</md-subheader>
                        <md-content class="md-padding" layout="row" layout-wrap>
                            <md-input-container flex="50">
                                <label>Middle name</label>
                                <form:input path="middleName"
                                            ng-model="register.middleName"/>
                                <div ng-messages="registerForm.middleName.$error">
                                    <div ng-message="md-maxlength">Username must be less than 30 characters long.</div>
                                </div>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Email</label>
                                <form:input name="email"
                                            type="email"
                                            path="email"
                                            required="required"
                                            ng-model="register.email"/>
                                <div ng-messages="registerForm.email.$error">
                                    <div ng-message="required">This is required.</div>
                                </div>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Username</label>
                                <form:input required="required"
                                            md-maxlength="30"
                                            name="username"
                                            path="username"
                                            ng-model="register.username"/>
                                <div ng-messages="registerForm.username.$error">
                                    <div ng-message="required">This is required.</div>
                                    <div ng-message="md-maxlength">Username must be less than 30 characters long.</div>
                                </div>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Password</label>
                                <form:input required="required"
                                            md-maxlength="30"
                                            name="password"
                                            path="password"
                                            ng-model="register.password"/>
                                <div ng-messages="registerForm.password.$error">
                                    <div ng-message="required">This is required.</div>
                                    <div ng-message="md-maxlength">Password must be less than 30 characters long.</div>
                                </div>
                            </md-input-container>
                        </md-content>

                        <md-subheader class="md-primary">Passport info</md-subheader>
                        <md-content class="md-padding" layout="row" layout-wrap>
                            <md-input-container flex="50">
                                <label>Passport series</label>
                                <form:input name="passportSeries"
                                            path="userData.passportSeries"
                                            required="required"
                                            ng-model="register.passportSeries"/>
                                <div ng-messages="registerForm.passportSeries.$error">
                                    <div ng-message="required">This is required.</div>
                                </div>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Passport number</label>
                                <form:input name="passportNumber"
                                            required="required"
                                            path="userData.passportNumber"
                                            ng-model="register.passportNumber"/>
                                <div ng-messages="registerForm.passportNumber.$error">
                                    <div ng-message="required">This is required.</div>
                                </div>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Passport validity</label>
                                <form:input name="passportValidity"
                                            required="required"
                                            path="userData.passportValidity"
                                            ng-pattern="/^[0-9]{2}\.[0-9]{2}\.[0-9]{4}$/"
                                            ng-model="register.passportValidity"/>

                                <div class="hint">##.##.####</div>

                                <div ng-messages="registerForm.passportValidity.$error">
                                    <div ng-message="required">This is required.</div>
                                    <div ng-message="pattern">##.##.#### - Please enter a valid date.</div>
                                </div>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Passport registration</label>
                                <form:input name="passportRegistration"
                                            md-maxlength="100"
                                            path="userData.passportRegistration"
                                            ng-model="register.passportRegistration"/>
                                <div ng-messages="registerForm.passportRegistration.$error">
                                    <div ng-message="md-maxlength">Passport registration must be less than 30 characters
                                        long.
                                    </div>
                                </div>
                            </md-input-container>

                            <choose-file flex="100"
                                         layout="row">
                                <input id="fileInput"
                                       type="file"
                                       name="passportPhoto"
                                       class="ng-hide">
                                <md-input-container flex class="md-block">
                                    <input type="text"
                                           ng-model="fileName"
                                           disabled>
                                    <div class="hint">Select your passport photo</div>
                                </md-input-container>
                                <div>
                                    <md-button id="uploadButton"
                                               class="md-fab md-mini">
                                        <md-icon class="material-icons">attach_file</md-icon>
                                    </md-button>
                                </div>
                            </choose-file>
                        </md-content>

                        <md-subheader class="md-primary">Additional info</md-subheader>
                        <md-content class="md-padding" layout="row" layout-wrap>
                            <md-input-container flex="50">
                                <label>Phone</label>
                                <form:input name="phone"
                                            path="userData.phone"
                                            md-maxlength="10"
                                            ng-pattern="/^[0-9]{10}$/"
                                            ng-model="register.phone"/>
                                <div ng-messages="registerForm.phone.$error">
                                    <div ng-message="md-maxlength">Phone must be less than 30 characters
                                        long.
                                    </div>
                                    <div ng-message="pattern">Please enter a valid phone number.</div>
                                </div>
                            </md-input-container>
                        </md-content>

                        <md-subheader class="md-primary">Bonus card</md-subheader>
                        <md-content class="md-padding" layout="row" layout-wrap>
                            <md-input-container flex="50">
                                <label>Company name</label>
                                <form:input name="companyName"
                                            path="userData.companyName"
                                            ng-model="register.companyName"/>
                            </md-input-container>

                            <md-input-container flex="50">
                                <label>Card number</label>
                                <form:input name="cardNumber"
                                            path="userData.bonusCardNumber"
                                            ng-model="register.cardNumber"/>
                            </md-input-container>
                        </md-content>

                        <div layout="row"
                             flex="100"
                             layout-align="center center">
                            <md-button class="md-raised md-primary"
                                       flex="33"
                                       layout-align="center"
                                       type="submit">Submit
                            </md-button>
                        </div>
                    </form:form>
                </md-content>
            </md-tab>
        </md-tabs>
    </md-card>
</md-content>

<script type="text/javascript">
    app.controller('LoginFormController', ['$scope', '$window', '$http', '$mdDialog', '$mdToast',
        function ($scope, $window, $http, $mdDialog, $mdToast) {
//        $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

            this.register = function () {
                alert("");

                $http({
                    method: 'POST',
                    url: '/register/',
                    data: $.param({'data': $scope.register}),
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                }).then(
                        function (response) {
                            console.log(response.data);
                        },
                        function (response) {
                            console.log(response);
                        }
                );
            };
        }])
            .config(function ($mdThemingProvider) {
                $mdThemingProvider.theme('docs-dark', 'default')
                        .primaryPalette('yellow')
                        .dark();

            });
</script>

</body>
</html>