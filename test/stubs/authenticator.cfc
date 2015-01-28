component {

    public function init() {
        return this;
    }

    public boolean function authenticate( struct credentials = {} ) {
        var isAuthentic = false;
        var hasProperFormat = structKeyExists( credentials, 'username' ) && structKeyExists( credentials, 'password' );

        if ( hasProperFormat ) {
            isAuthentic = credentials.username == 'test' && credentials.password == 'password';
        }

        return isAuthentic;
    }

}
