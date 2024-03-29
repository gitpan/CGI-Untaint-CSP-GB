package CGI::Untaint::CSP::GB;

use warnings;
use strict;
use Carp;
use CGI::Untaint;

use base qw(CGI::Untaint::object CGI::Untaint::CSP);

=head1 NAME

CGI::Untaint::CSP::GB - Add British counties to CGI::Untaint::CSP tables

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

our %counties = (
	'aberdeenshire' => 1,
	'anglesey' => 1,
	'angus' => 1,
	'avon' => 1,
	'ayrshire' => 1,
	'bedfordshire' => 1,
	'berkshire' => 1,
	'blaenau gwent' => 1,
	'brecknockshire' => 1,
	'bridgend' => 1,
	'buckinghamshire' => 1,
	'borders' => 1,
	'cardinganshire' => 1,
	'caerphilly' => 1,
	'cambridgeshire' => 1,
	'cardiff' => 1,
	'carmarthenshire' => 1,
	'ceredigion' => 1,
	'channel islands' => 1,
	'cheshire' => 1,
	'clackmannanshire' => 1,
	'cleveland' => 1,
	'clywd' => 1,
	'county durham' => 1,
	'county tyrone' => 1,
	'conwy' => 1,
	'cornwall' => 1,
	'cumbria' => 1,
	'derbyshire' => 1,
	'denbighshire' => 1,
	'devon' => 1,
	'dorset' => 1,
	'dumfries and galloway' => 1,
	'dyfed' => 1,
	'east lothian' => 1,
	'east sussex' => 1,
	'east yorkshire' => 1,
	'essex' => 1,
	'fife' => 1,
	'flintshire' => 1,
	'glamorgan' => 1,
	'gloucestershire' => 1,
	'grampian' => 1,
	'gwent' => 1,
	'gwynedd' => 1,
	'hampshire' => 1,
	'hertfordshire' => 1,
	'herefordshire' => 1,
	'isle of man' => 1,
	'isle of wight' => 1,
	'kent' => 1,
	'lancashire' => 1,
	'leicestershire' => 1,
	'lincolnshire' => 1,
	'london' => 1,
	'manchester' => 1,
	'merioneth' => 1,
	'merseyside' => 1,
	'mid lothian' => 1,
	'middlesex' => 1,
	'monmouthshire' => 1,
	'montgomeryshire' => 1,
	'north yorkshire' => 1,
	'norfolk' => 1,
	'northamptonshire' => 1,
	'northern ireland' => 1,
	'northumberland' => 1,
	'nottinghamshire' => 1,
	'oxfordshire' => 1,
	'pembrokeshire' => 1,
	'powys' => 1,
	'radnorshire' => 1,
	'renfrewshire' => 1,
	'shropshire' => 1,
	'somerset' => 1,
	'south yorkshire' => 1,
	'staffordshire' => 1,
	'strathclyde' => 1,
	'suffolk' => 1,
	'surrey' => 1,
	'tayside' => 1,
	'tyne and wear' => 1,
	'warwickshire' => 1,
	'west dunbartonshire' => 1,
	'west lothian' => 1,
	'west midlands' => 1,
	'west sussex' => 1,
	'west yorkshire' => 1,
	'wiltshire' => 1,
	'worcestershire' => 1,
);

my %sloppies = (
	'beds' => 'bedfordshire',
	'cambs' => 'cambridgeshire',
	'co durham' => 'county durham',
	'east yorks' => 'east yorkshire',
	'glasgow' => 'west lothian',
	'gloucester' => 'gloucestershire',
	'greater london' => 'london',
	'herts' => 'hertfordshire',
	'lancs' => 'lancashire',
	'middx' => 'middlesex',
	'n yorkshire' => 'north yorkshire',
	'notts' => 'nottinghamshire',
	'oxon' => 'oxfordshire',
	'greater manchester' => 'manchester',
	's yorkshire' => 'south yorkshire',
	'west mids' => 'west midlands',
	'west yorks' => 'west yorkshire',
);

=head1 SYNOPSIS

Adds a list of British counties to the list of counties/state/provinces
which are known by the CGI::Untaint::CSP validator.

    use CGI::Info;
    use CGI::Untaint;
    use CGI::Untaint::CSP::GB;
    my $info = CGI::Info->new();
    my $u = CGI::Untaint->new($info->params());
    # Succeeds if state = 'Kent', fails if state = 'Queensland';
    $u->extract(-as_CSP => 'state');
    # ...

=cut

=head1 SUBSOUTINES/METHODS

=head2 is_valid

Validates the data.
NB, unlike CGI::Untaint->is_valid(), this takes an argument.

=cut

sub is_valid {
	my ($self, $value) = @_;

	$value = lc($value);

	if(exists($sloppies{$value})) {
		$value = $sloppies{$value};
	}

	return exists($counties{$value});
}

sub _untaint_re {
	return CGI::Untaint::CSP::_untaint_re();
}

=head2 new

Used internally to add the table. Do not call this yourself.

=cut

sub new {
	my $proto = shift;

	my $class = ref($proto) || $proto;

	my $self = CGI::Untaint->new();

	bless $self, $class;

	return $self;
}

BEGIN {
	my $gb = CGI::Untaint::CSP::GB->new();

	push @CGI::Untaint::CSP::countries, $gb;
};

=head1 AUTHOR

Nigel Horne, C<< <njh at bandsman.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-cgi-untaint-csp-gb at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=CGI-Untaint-CSP>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SEE ALSO

CGI::Untaint::CSP, CGI::Untaint

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc CGI::Untaint::CSP::GB


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=CGI-Untaint-CSP-GB>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/CGI-Untaint-CSP-GB>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/CGI-Untaint-CSP-GB>

=item * Search CPAN

L<http://search.cpan.org/dist/CGI-Untaint-CSP-GB>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Nigel Horne.

This program is released under the following licence: GPL


=cut

1; # End of CGI::Untaint::CSP-GB
