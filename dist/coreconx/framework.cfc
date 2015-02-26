component name='CoreConX' description='The CoreConX framework.' accessors='true' {

    property name='translator' default='';
    property name='authenticator' default='';
    property name='isAutoAuthenticating' type='boolean' default='false';

    public function init() {
        return this;
    }

    // application.onRequest
    public boolean function onRequest( string targetpage ) {
        // Shortcut methods
        // Read this for more info: http://www.milesrausch.com/2012/11/04/shortcut-functions-in-cfml/
        variables._ = _;

        if ( getIsAutoAuthenticating() ) {
            authenticate();
        }

        // Include our target page
        include arguments.targetpage;

        return true;
    }

    // Configure the framework
    public void function configure( struct configuration = {} ) {
        for ( var key in arguments.configuration ) {
            if ( isDefined('this.set#key#') ) {
                this['set#key#']( arguments.configuration[ key ] );
            }
        }
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

    public boolean function authenticate( struct credentials = {} ) {
        var isAuthentic = false;

        if ( len( trim( getAuthenticator() ) ) ) {
            try {
                isAuthentic = createObject( 'component', getAuthenticator() ).authenticate( argumentCollection = arguments );
            } catch( any ex ) {
                isAuthentic = false;
            }
        }

        return isAuthentic;
    }

    public string function show( required struct target, required string property, string wrapBefore = '', string wrapAfter = '', boolean makeHTMLSafe = true ) {
        var shown = '';

        if ( isDefined('arguments.target.#property#') ) {
            shown = arguments.target[ property ];

            if ( arguments.makeHTMLSafe ) {
                shown = HTMLEditFormat( shown );
            }

            if ( isBoolean( shown ) && !isNumeric( shown ) && shown ) {
                shown = wrapBefore & yesNoFormat( shown ) & wrapAfter;
            } else if ( isNumeric( shown ) && val( shown ) ) {
                shown = wrapBefore & val( shown ) & wrapAfter;
            } else if ( len( shown ) ) {
                shown = wrapBefore & shown & wrapAfter;
            }
        }

        return shown;
    }

    public string function qs( struct update = {}, array ignore = [], any querySource = cgi.query_string ) {
        var qs = '';
        var key = '';
        var newURLKey = '';
        var newURLValue = '';
        var newURLStruct = {};

        if ( isStruct( arguments.querySource ) ) {
            newURLStruct = duplicate( arguments.querySource );

        } else {
            for ( var qpart in listToArray( arguments.querySource, '&' ) ) {
                newURLKey = listFirst( qpart, '=' );
                newURLValue = listRest( qpart, '=' );

                newURLStruct[ newURLKey ] = '';
                if ( newURLKey != newURLValue ) {
                    newURLStruct[ newURLKey ] = newURLValue;
                }
            }

        }

        structAppend( newURLStruct, arguments.update, true );

        var keys = structKeyArray( newURLStruct );

        arraySort( keys, 'textnocase' );

        qs = '?';
        for ( key in keys ) {
            if ( !arrayFindNoCase( arguments.ignore, key ) ) {
                qs &= lCase( key ) & '=' & newURLStruct[ key ] & '&amp;';
            }
        }

        if ( len( qs ) == 1 ) {
            qs = '';
        } else {
            qs = left( qs, len( qs ) - 5 );
        }

        return qs;
    }

}
