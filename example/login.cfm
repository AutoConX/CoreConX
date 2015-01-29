<cfscript>
    if ( isDefined('form.authenticate') ) {
        isAuthentic = authenticate( credentials = form );
    }
</cfscript>
<!DOCTYPE html>
<html>
    <head>
        <title>Example CoreConX Site</title>
    </head>
    <body>
        <h1>Sign In</h1>

        <cfif isDefined('isAuthentic')>
            <cfif !isAuthentic>
                NOT
            </cfif>
            Authenticated!

            <cfif isAuthentic>
                Visit the <a href="index.cfm">homepage</a>.
            </cfif>
        </cfif>

        <form action="" method="post">
            <input type="hidden" name="authenticate" value="1">

            <ul>
                <li>
                    <label>
                        Username
                        <input type="text" name="username" value="" required>
                    </label>
                    <aside>Try <kbd>test</kbd>.</aside>
                </li>
                <li>
                    <label>
                        Password
                        <input type="password" name="password" value="" required>
                    </label>
                    <aside>Try <kbd>password</kbd>.</aside>
                </li>
                <li>
                    <button type="submit">Sign In</button>
                </li>
            </ul>
        </form>
    </body>
</html>
