package Business::CyberSource;
use 5.008;
use strict;
use warnings;

# VERSION

1;

# ABSTRACT: Perl interface to the CyberSource Simple Order SOAP API

=head1 DESCRIPTION

This library is a Perl interface to the CyberSource Simple Order SOAP API built
on L<Moose> and L<XML::Compile::SOAP> technologies. This library aims to
eventually provide a full interface the SOAPI.

You may wish to read the Official CyberSource Documentation on L<Credit Card
Services for the Simpler Order
API|http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SO_API/html/>
as it will provide further information on why what some things are and the
general workflow.

To get started you will want to read the documentation in
L<Business::CyberSource::Request>. If you find any documentation unclear or
outright missing, please file a bug.

If there are features that are part of CyberSource's API but are not
documented, or are missing here, please file a bug. I'll be happy to add them,
but due to the size of the upstream API, I have not had time to cover all the features
and some are currently undocumented.

=head1 ACKNOWLEDGEMENTS

=over

=item * Mark Overmeer

for the help with getting L<XML::Compile::SOAP::WSS> working.

=back

=head1 SEE ALSO

=over

=item * L<Checkout::CyberSource::SOAP>

=item * L<Business::OnlinePayment::CyberSource>

=back

=cut
