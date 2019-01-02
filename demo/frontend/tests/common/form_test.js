import assert from 'assert';
import Form from 'common/form';

describe('common/form', () => {
    it('setting and getting definition', () => {
        const def = { foo: { caption: 'Foo' } };
        const form = new Form();

        form.setDefinition(def);

        const result = form.getDefinition();
        assert.equal(result, def);
    });

    it('setting and getting a value', () => {
        const def = {
            foo: { caption: 'Foo' },
        };
        const form = new Form();

        form.setDefinition(def);
        form.setValue('foo', 'test');

        const result = form.getValue('foo');
        assert.equal(result, 'test');
    });

    it('setting and getting a value for missing property throws exception', () => {
        const def = {
            foo: { caption: 'Foo' },
        };
        const form = new Form();

        form.setDefinition(def);

        assert.throws(() => {
            form.setValue('bar', 3);
        });

        assert.throws(() => {
            form.getValue('bar');
        });
    });

    it('setting and getting a complex value', () => {
        const complexValue = {
            something: 'abc',
            another: 'def',
        };
        const def = {
            foo: {
                caption: 'Foo',
            },
        };
        const form = new Form();

        form.setDefinition(def);
        form.setValue('foo', complexValue);

        const result = form.getValue('foo');
        assert.deepEqual(result, complexValue);
    });

    it('setting and getting more values at once', () => {
        const def = {
            foo: { caption: 'Foo' },
        };
        const form = new Form();

        form.setDefinition(def);
        form.setValues({ foo: 'test' });

        const result = form.getValues();
        assert.equal(result.foo, 'test');
    });
});