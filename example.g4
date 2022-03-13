grammar example;

prog: statement_list+ EOF
    ;

statement_list: statement+
    ;

statement: var_declaration
    | transform_matrix_declaration
    | apply_texture_command
    | apply_transform_command
    ;

var_declaration: 'Object' ID '=' create_command
    | 'Number' ID '=' NUM
    | 'Texture' ID '=' create_command
    ;

create_command: 'Create' object_type
    | 'Create' object_type '{' object_props '}'
    // | 'Create' 'Texture'  '{' 'Image' '=' image_link '}'
    ;

// image_link: 
//     ;

transform_command: transform_function '(' (ID | NUM) ')'
    ;

transform_function: 'TranslateX'
    | 'TranslateY'
    | 'TranslateZ'
    | 'Scale'
    | 'RotateX'
    | 'RotateY'
    | 'RotateZ'
    ;

transform_matrix_declaration: 'matrix' ID '{' transform_command_list '}'
    ;

transform_command_list: transform_command+
    ;

apply_texture_command: 'ApplyTexture' '(' ID ',' ID ')'
    ;

apply_transform_command: 'Transform' '(' ID ',' ID ')'
    ;

object_props: object_prop+
    ;

object_prop: prop_name '=' ID | prop_name '=' NUM
    ;

prop_name: 'X' | 'Y' | 'Z' | 'Radius' | 'Scale';

object_type: 'Triangle'
    | 'Cube'
    | 'Sphere'
    | 'Pyramid'
    ;

ID: [a-z][a-zA-Z0-9_]*
    ;

NUM: '0' | '-'?[1-9][0-9]*
    ;

WS: [ \t\n]+ -> skip;
