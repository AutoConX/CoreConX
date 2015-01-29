<!DOCTYPE html>
<html>
    <head>
        <title>Example CoreConX Site</title>
    </head>
    <body>
        <h1>Example CoreConX Site</h1>

        <h2>The <kbd>_()</kbd> Method</h2>

        <p><code>
            writeOutput( _( 'en_US', 'greeting', 'Hello' ) );
        </code></p>
        <cfscript>
            writeOutput( _( 'en_US', 'greeting', 'Hello' ) );
        </cfscript>

        <h2>Authentication</h2>

        <p><code>
            writeOutput( authenticate() );
        </code></p>
        <cfscript>
            writeOutput( authenticate() );
        </cfscript>

        <h2>Auto-Authentication</h2>

        <p>If you can see this page, and the Authentication above says "true", then Auto-Authentication is on. You should have been directed to <a href="login.cfm">the login page</a> before seeing this one.</p>
    </body>
</html>
