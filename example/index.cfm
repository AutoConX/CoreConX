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

        <h2>The <kbd>show()</kbd> Method</h2>

        <p><code>
            item = { name = 'CoreConX', version = '0.0.7', model = 'Town &amp; Country' };<br>
            writeOutput( 'Name: ' & show( item, 'name') & '&lt;br&gt;' );<br>
            writeOutput( 'Fake Name: ' & show( item, 'fakeName') & '&lt;br&gt;' );<br>
            writeOutput( 'Version: ' & show( item, 'version', 'Version: ', '!') & '&lt;br&gt;' );<br>
            writeOutput( 'Model: ' & show( item, 'model') & '&lt;br&gt;' );
        </code></p>
        <cfscript>
            item = { name = 'CoreConX', version = '0.0.7', model = 'Town & Country' };
            writeOutput( 'Name: ' & show( item, 'name') & '<br>' );
            writeOutput( 'Fake Name: ' & show( item, 'fakeName') & '<br>' );
            writeOutput( 'Version: ' & show( item, 'version', 'Version: ', '!') & '<br>' );
            writeOutput( 'Model: ' & show( item, 'model') & '<br>' );
        </cfscript>

        <h2>The <kbd>qs()</kbd> Method</h2>

        <p>Add to the query string of this page to see how the <kbd>qs()</kbd> method outputs.</p>

        <p><code>
            writeOutput( qs({ page = 3 }) );
        </code></p>
        <cfscript>
            writeOutput( qs({ page = 3 }) );
        </cfscript>
    </body>
</html>
