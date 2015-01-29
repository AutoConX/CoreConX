component {

    variables.validUsername = 'test';
    variables.validPassword = 'password';

    public function init() {
        return this;
    }

    public boolean function authenticate( struct credentials = {} ) {
        var isAuthentic = false;
        var hasProperFormat = structKeyExists( arguments.credentials, 'username' ) && structKeyExists( arguments.credentials, 'password' );

        if ( hasProperFormat ) {
            isAuthentic = arguments.credentials.username == variables.validUsername && arguments.credentials.password == variables.validPassword;
            setCookies( arguments.credentials.username, arguments.credentials.password );
        } else {
            isAuthentic = checkCookies();
        }

        if ( !isAuthentic && listLast( cgi.script_name, '/' ) != 'login.cfm' ) {
            location('login.cfm', false);
        }

        return isAuthentic;
    }

    public boolean function checkCookies() {
        var isValid = false;

        if ( isDefined('cookie.username') && isDefined('cookie.password') ) {
            isValid = cookie.username == variables.validUsername && cookie.password == variables.validPassword;
        }

        return isValid;
    }

    public void function setCookies( string username = '', string password = '' ) {
        var expires = dateAdd( 'd', 1, now() );

        cookie.username = {
            value = arguments.username,
            expires = expires
        };
        cookie.password = {
            value = arguments.password,
            expires = expires
        };
    }

}
