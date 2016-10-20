package BaseIncMandatory;

BEGIN { package main;
    isnt $INC[-1], '.', 'no trailing dot in @INC during mandatory module load from base';
}

1;
