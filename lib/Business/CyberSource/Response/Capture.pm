package Business::CyberSource::Response::Capture;
use 5.008;
use strict;
use warnings;
BEGIN {
	our $VERSION = 'v0.1.0'; # VERSION
}
use Moose;
with 'Business::CyberSource::Response';

__PACKAGE__->meta->make_immutable;
1;

__END__
=pod

=head1 NAME

Business::CyberSource::Response::Capture

=head1 VERSION

version v0.1.0

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
