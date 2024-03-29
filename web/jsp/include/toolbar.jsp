<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<md-toolbar ng-controller="ToolbarController as ctrl" md-whiteframe="4">
    <div class="md-toolbar-tools">
        <h3>
            <span>${param.title}</span>
        </h3>

        <span flex></span>

        <md-menu md-position-mode="target-right target">
            <md-button aria-label="Open phone interactions menu" class="md-icon-button"
                       ng-click="ctrl.openMenu($mdOpenMenu, $event)">
                <md-icon md-menu-origin md-svg-icon="dots-vertical"></md-icon>
            </md-button>

            <md-menu-content width="4">
                <md-menu-item>
                    <md-button ng-click="ctrl.redirect('/user/me')">
                        <md-icon md-svg-icon="account"></md-icon>
                        My profile
                    </md-button>
                </md-menu-item>

                <c:if test="${sessionScope.user.hasRole('ROLE_AGENT')}">
                    <md-menu-item>
                        <md-button ng-click="ctrl.redirect('/users/')">
                            <md-icon md-svg-icon="account-multiple"></md-icon>
                            Users
                        </md-button>
                    </md-menu-item>
                </c:if>

                <md-menu-divider></md-menu-divider>

                <c:if test="${sessionScope.user.isRole('ROLE_AGENT')}">
                    <md-menu-item>
                        <md-button ng-click="ctrl.redirect('/settings/')">
                            <md-icon md-svg-icon="settings"></md-icon>
                            Settings
                        </md-button>
                    </md-menu-item>

                    <md-menu-divider></md-menu-divider>
                </c:if>

                <c:if test="${sessionScope.user.hasRole('ROLE_AGENT')}">
                    <md-menu-item>
                        <md-button ng-click="ctrl.redirect('/order/undefined')">
                            <md-icon md-svg-icon="playlist-minus" md-menu-align-target></md-icon>
                            Undefined orders
                        </md-button>
                    </md-menu-item>
                </c:if>

                <md-menu-item>
                    <md-button ng-click="ctrl.redirect('/order/active')">
                        <md-icon md-svg-icon="playlist-play" md-menu-align-target></md-icon>
                        Active orders
                    </md-button>
                </md-menu-item>

                <md-menu-item>
                    <md-button ng-click="ctrl.redirect('/order/done')">
                        <md-icon md-svg-icon="playlist-check" md-menu-align-target></md-icon>
                        Completed orders
                    </md-button>
                </md-menu-item>

                <md-menu-item>
                    <md-button ng-click="ctrl.redirect('/order/canceled')">
                        <md-icon md-svg-icon="playlist-remove"></md-icon>
                        Canceled orders
                    </md-button>
                </md-menu-item>

                <c:if test="${sessionScope.user.hasRole('ROLE_AGENT')}">
                    <md-menu-item>
                        <md-button ng-click="ctrl.redirect('/order/archived')">
                            <md-icon md-svg-icon="archive" md-menu-align-target></md-icon>
                            Archived orders
                        </md-button>
                    </md-menu-item>
                </c:if>

                <md-menu-divider></md-menu-divider>

                <md-menu-item>
                    <md-button ng-click="ctrl.redirect('/logout')">
                        Logout
                    </md-button>
                </md-menu-item>
            </md-menu-content>
        </md-menu>
    </div>
</md-toolbar>