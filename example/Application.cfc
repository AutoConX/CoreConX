component extends='dist.coreconx.framework' {

    this.name = 'example-coreconx';

    configure({
        authenticator = 'com.authenticator',
        isAutoAuthenticating = !isDefined('form.authenticate'),
        translator = 'com.translator'
    });

}
