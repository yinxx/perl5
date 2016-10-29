#!/usr/bin/perl -w

use strict;
use Test::More tests => 8;  # some extra tests in t/lib/BaseInc*

use lib 't/lib', sub {()};

# make it look like an older perl
BEGIN { push @INC, '.' if $INC[-1] ne '.' }

use base 'BaseIncMandatory';

BEGIN { @BaseIncOptional::ISA = () } # make it look like an optional load
use base 'BaseIncOptional';

BEGIN {
    is $INC[0], 't/lib/on-head', 'modules loaded by base can prepend entries to @INC';
    is $INC[-1], 't/lib/on-tail', 'modules loaded by base can append entries to @INC';
    is $INC[-2], '.', 'dot still at previous end of @INC after using base';
    is $INC[1], 't/lib', 'previously prepended additional @INC entry remains';
}
