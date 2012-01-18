#!perl -wT

use Test::More tests => 7;
BEGIN {
	use_ok('CGI::Untaint');
	use_ok('CGI::Untaint::CSP::GB');
};

my $vars = {
    state1 => 'MD',
    state2 => 'Kent',
    state3 => ' ',
    state4 => 'West Yorkshire',
    state5 => 'West Yorks',
};

my $untainter = CGI::Untaint->new($vars);
my $c = $untainter->extract(-as_CSP => 'state1');
ok(!defined($c), 'Maryland');

$c = $untainter->extract(-as_CSP => 'state2');
ok($c eq 'Kent', 'Kent');

$c = $untainter->extract(-as_CSP => 'state3');
ok(!defined($c), 'Empty');

$c = $untainter->extract(-as_CSP => 'state4');
ok($c eq 'West Yorkshire', 'West Yorkshire');

$c = $untainter->extract(-as_CSP => 'state5');
ok($c eq 'West Yorks', 'West Yorks');
