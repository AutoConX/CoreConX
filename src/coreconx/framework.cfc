component name='CoreConX' description='The CoreConX framework.' accessors='true' {

    property name='translator' default='';

    public function init() {
        return this;
    }

    // application.onRequest
    public boolean function onRequest( string targetpage ) {
        // Shortcut methods
        // Read this for more info: http://www.milesrausch.com/2012/11/04/shortcut-functions-in-cfml/
        variables._ = _;

        // Include our target page
        include arguments.targetpage;

        return true;
    }

    // Translate strings
    public string function _( string locale = '', string key = '', string fallback = '' ) {
        var translator = '';
        var translation = '';
        var fallbackLocale = 'en_US';
        var needToFakeTranslation = false;

        // We can't trust what gets sent in, so we clean the input a little
        arguments.locale = trim( arguments.locale );
        arguments.key = trim( arguments.key );
        arguments.fallback = trim( arguments.fallback );

        // If we don't support this locale, let's use a fallback.
        if ( !listFind( server.coldfusion.supportedLocales, arguments.locale ) ) {
            arguments.locale = fallbackLocale;
        }

        // Try to use a translator method
        if ( len( trim( getTranslator() ) ) ) {
            try {
                translation = createObject( 'component', getTranslator() ).translate( argumentCollection = arguments );
            } catch( any ex ) {
                needToFakeTranslation = true;
            }
        } else {
            needToFakeTranslation = true;
        }

        if ( needToFakeTranslation ) {
            if ( len( arguments.fallback ) ) {
                translation = arguments.fallback;
            } else if ( len( arguments.key ) ) {
                translation = arguments.key;
            }
        }

        return translation;
    }

}
