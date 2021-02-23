package namespace::allclean;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

use B::Hooks::EndOfScope;
use namespace::clean;

sub import {
    my ($class, %args) = @_;
    my $cleanee = exists $args{-cleanee} ? $args{-cleanee} : scalar caller;

    on_scope_end {
        my $subs = namespace::clean->get_functions($cleanee);
 
        my @clean = keys %$subs;
 
        namespace::clean->clean_subroutines($cleanee, @clean);
    };
}

1;
__END__

=encoding utf-8

=head1 NAME

namespace::allclean - It's new $module

=head1 SYNOPSIS

    use namespace::allclean;

=head1 DESCRIPTION

namespace::allclean is ...

=head1 LICENSE

Copyright (C) kfly8.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

kfly8 E<lt>kfly8@cpan.orgE<gt>

=cut

