package Plack::Middleware::EnvTracer;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $args  = shift || +{};

    bless $args, $class;
}

1;

__END__

=head1 NAME

Plack::Middleware::EnvTracer - one line description


=head1 SYNOPSIS

    use Plack::Middleware::EnvTracer;


=head1 DESCRIPTION

Plack::Middleware::EnvTracer is


=head1 REPOSITORY

Plack::Middleware::EnvTracer is hosted on github
<http://github.com/bayashi/Plack-Middleware-EnvTracer>

Welcome your patches and issues :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Other::Module>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut