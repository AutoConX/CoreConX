component {
    public function init() {
        return this;
    }

    public function translate( string locale = '', string key = '', fallback = '' ) {
        var translation = '';

        if ( arguments.locale == 'en_US' ) {
            if ( arguments.key == 'testing' ) {
                translation = 'custom testing';
            } else if ( len( arguments.fallback ) ) {
                translation = arguments.fallback;
            } else {
                translation = arguments.key;
            }
        }

        return translation;
    }
}
