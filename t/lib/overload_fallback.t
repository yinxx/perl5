use warnings;
use strict;
use Test::Simple tests => 3;

use overload '""' => sub { 'stringvalue' }, fallback => 1;

BEGIN {
my $x = bless {}, 'main';
ok ($x eq 'stringvalue', 'fallback worked');
}


# NOTE: delete the next line and this test script will pass
use overload '+' => sub { die "unused"; };

my $x = bless {}, 'main';
ok (eval {$x eq 'stringvalue'}, 'fallback worked again');

{
    my $warned = 0;
    local $SIG{__WARN__} = sub { $warned++; };

    eval q{
        use overload '${}', 'fallback';
        no overload '${}', 'fallback';
    };

    ok($warned == 0, 'no overload should not warn');
}

