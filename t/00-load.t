#!perl -T

use Test::More tests => 2;

BEGIN {
    use_ok('CGI::Untaint');
    use_ok( 'CGI::Untaint::CSP::GB' ) || print "Bail out!
";
}

diag( "Testing CGI::Untaint::CSP::GB $CGI::Untaint::CSP::VERSION, Perl $], $^X" );
