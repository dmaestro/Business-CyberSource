package Business::CyberSource::Request::Role::BusinessRules;
use strict;
use warnings;
use namespace::autoclean;

# VERSION

use Moose::Role;
use MooseX::RemoteHelper;
use MooseX::Types::CyberSource qw( BusinessRules );

#use List::MoreUtils qw( any );
use Class::Load qw( load_class );

our @CARP_NOT = ( 'Class::MOP::Method::Wrapped', __PACKAGE__ );

around BUILDARGS => sub {
	my $orig = shift;
	my $self = shift;

	my $args = $self->$orig( @_ );

	my %newargs = %{ $args };

	my %br_map = (
		ignore_avs_result      => 1,
		ignore_cv_result       => 1,
		ignore_dav_result      => 1,
		ignore_export_result   => 1,
		ignore_validate_result => 1,
		decline_avs_flags      => 1,
		score_threshold        => 1,
	);

	return $args if defined $args->{business_rules}
		#or any { defined $br_map{$_} } keys %br_map
		;

	my %business_rules
		= map {
			defined $br_map{$_} ? ( $_, delete $newargs{$_} ) : ()
		} keys %newargs;

	$newargs{business_rules} = \%business_rules if keys %business_rules;

	load_class 'Carp';
	Carp::carp 'DEPRECATED: '
		. 'pass a Business::CyberSource::RequestPart::BusinessRules to '
		. 'purchase_totals '
		. 'or pass a constructor hashref to bill_to as it is coerced from '
		. 'hashref.'
		if keys %business_rules
		;

	return \%newargs;
};

has business_rules => (
	isa         => BusinessRules,
	remote_name => 'businessRules',
	traits      => ['SetOnce'],
	is          => 'rw',
	coerce      => 1,
);

1;

# ABSTRACT: Business Rules

=attr business_rules

L<Business::CyberSource::RequestPart::BusinessRules>

=cut
