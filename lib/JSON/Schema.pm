use v6.c;

class JSON::Schema {
    subset SchemaType of Str where any("null", "boolean", "object", "array", "number", "string", "integer");
    has SchemaType $.type is required;

    proto method validate(|c) { * }

    multi method validate($instance --> Bool ) {
        self.validate($!type, $instance);
    }

    multi method validate('null', Mu:U $ --> Bool){
        True;
    }

    multi method validate('null', Mu:D $ --> Bool){
        False;
    }

    multi method validate('boolean', Bool $ --> Bool) {
        True;
    }
    multi method validate('boolean', $ --> Bool) {
        False;
    }


}

# vim: ft=perl6
