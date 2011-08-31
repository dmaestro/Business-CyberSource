package Business::CyberSource::Request::Role::CreditCardInfo;
use 5.008;
use strict;
use warnings;
use Carp;
BEGIN {
	our $VERSION = 'v0.1.11'; # VERSION
}
use Moose::Role;
use namespace::autoclean;
use MooseX::Aliases;
use MooseX::Types::Moose      qw( Int        );
use MooseX::Types::Varchar    qw( Varchar    );
use MooseX::Types::CreditCard 0.001001 qw( CreditCard CardSecurityCode );

has credit_card => (
	required => 1,
	is       => 'ro',
	isa      => CreditCard,
	coerce   => 1,
);

has card_type => (
	required => 0,
	is       => 'ro',
	isa      => Varchar[3],
);

has cc_exp_month => (
	required => 1,
	is       => 'ro',
	isa      => Int,
);

has cc_exp_year => (
	required => 1,
	is       => 'ro',
	isa      => Int,
);

has cv_indicator => (
	required => 0,
	lazy     => 1,
	is       => 'ro',
	isa      => Varchar[1],
	default  => '1',
	documentation => 'Flag that indicates whether a CVN code was sent'
);

has cvn => (
	required => 0,
	alias    => [ qw( cvv cvv2  cvc2 cid ) ],
	is       => 'ro',
	isa      => CardSecurityCode,
);

sub _build_credit_card_info {
	my ( $self, $sb ) = @_;

	my $card = $sb->add_elem(
		name => 'card',
	);

	$sb->add_elem(
		name   => 'accountNumber',
		value  => $self->credit_card,
		parent => $card,
	);

	$sb->add_elem(
		name   => 'expirationMonth',
		value  => $self->cc_exp_month,
		parent => $card,
	);

	$sb->add_elem(
		name   => 'expirationYear',
		value  => $self->cc_exp_year,
		parent => $card,
	);

	if ( $self->cvn ) {
		$sb->add_elem(
			name   => 'cvIndicator',
			value  => $self->cv_indicator,
			parent => $card,
		);

		$sb->add_elem(
			name   => 'cvNumber',
			value  => $self->cvn,
			parent => $card,
		);
	}

	return $sb;
}

1;

# ABSTRACT: credit card info role

__END__
=pod

=head1 NAME

Business::CyberSource::Request::Role::CreditCardInfo - credit card info role

=head1 VERSION

version v0.1.11

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/xenoterracide/Business-CyberSource/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Caleb Cushing <xenoterracide@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Caleb Cushing.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

