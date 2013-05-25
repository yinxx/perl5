#!perl

use strict;
use warnings;

require "test.pl";

plan(1);

use XS::APItest;

my ($prog, $expect) = (<<'PROG', <<'EXPECT');
use XS::APItest;
XS::APItest::enable_destruct_callback();
PROG
DESTRUCT CALLBACK
EXPECT
fresh_perl_is($prog, $expect);
