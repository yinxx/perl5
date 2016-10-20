package BaseIncOptional;

BEGIN { package main;
    isnt $INC[-1], '.', 'no trailing dot in @INC during optional module load from base';
}

use lib 't/lib/on-head';

push @INC, 't/lib/on-tail';

1;
