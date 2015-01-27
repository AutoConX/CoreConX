component extends="testbox.system.BaseSpec" {

    function run() {
        describe('CoreConX framework', function() {

            beforeEach(function( currentSpec ) {
                coreconx = new dist.coreconx.framework();
            });

            it('should exist', function() {
                expect( coreconx ).toHaveKey('init');
            });

            describe('Translator', function() {

                it('should have getter and setter', function() {
                    expect( coreconx ).toHaveKey('setTranslator');
                    expect( coreconx ).toHaveKey('getTranslator');
                    expect( coreconx ).toHaveKey('_');
                });

                it('should translate', function() {
                    coreconx.setTranslator('test.stubs.translator');
                    expect( coreconx._() ).toBeEmpty();
                    expect( coreconx._('en_US') ).toBeEmpty();
                    expect( coreconx._('en_US', 'missing_key') ).toBe('missing_key');
                    expect( coreconx._('en_US', 'testing', 'Fallback Text') ).toBe('custom testing');
                    expect( coreconx._('en_US', 'missing_key', 'Fallback Text') ).toBe('Fallback Text');
                });

                it('should fallback with an empty translator', function() {
                    coreconx.setTranslator('');
                    expect( coreconx.getTranslator() ).toBeEmpty();
                    expect( coreconx._() ).toBeEmpty();
                    expect( coreconx._('en_US') ).toBeEmpty();
                    expect( coreconx._('en_US', 'missing_key') ).toBe('missing_key');
                    expect( coreconx._('en_US', 'testing', 'Fallback Text') ).toBe('Fallback Text');
                    expect( coreconx._('en_US', 'missing_key', 'Fallback Text') ).toBe('Fallback Text');
                });

                it('should fallback with a broken or missing translator', function() {
                    coreconx.setTranslator('missingTranslator.translate');
                    expect( coreconx.getTranslator() ).toBe('missingTranslator.translate');
                    expect( coreconx._() ).toBeEmpty();
                    expect( coreconx._('en_US') ).toBeEmpty();
                    expect( coreconx._('en_US', 'missing_key') ).toBe('missing_key');
                    expect( coreconx._('en_US', 'testing', 'Fallback Text') ).toBe('Fallback Text');
                    expect( coreconx._('en_US', 'missing_key', 'Fallback Text') ).toBe('Fallback Text');
                });

                it('should fallback with an unsupported locale', function() {
                    coreconx.setTranslator('test.stubs.translator');
                    expect( coreconx._('fakeLocale', 'missing_key') ).toBe('missing_key');
                    expect( coreconx._('fakeLocale') ).toBeEmpty();
                    expect( coreconx._('fakeLocale', 'testing', 'Fallback Text') ).toBe('custom testing');
                    expect( coreconx._('fakeLocale', 'missing_key', 'Fallback Text') ).toBe('Fallback Text');
                });
            })
        });
    }

}
