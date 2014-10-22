package Data::Clean::ToStringyNumber;

use 5.010001;
use strict;
use warnings;

use parent qw(Data::Clean::Base);

sub command_replace_with_stringy_number {
    require Scalar::Util;

    my ($self, $args) = @_;
    return '{{var}} = defined({{var}}) && Scalar::Util::looks_like_number({{var}}) > 36 ? "{{var}}" : {{var}}';
}

sub new {
    my ($class, %opts) = @_;
    $opts{""} //= ['replace_with_stringy_number'];
    $class->SUPER::new(%opts);
}

sub get_cleanser {
    my $class = shift;
    state $singleton = $class->new;
    $singleton;
}

1;
# ABSTRACT: Convert non-stringy numbers in data to stringy numbers

__END__

=pod

=encoding utf-8

=head1 NAME

Data::Clean::ToStringyNumber - Convert non-stringy numbers in data to stringy numbers

=head1 SYNOPSIS

 use Data::Clean::ToStringyNumber;
 my $cleanser = Data::Clean::ToStringyNumber->get_cleanser;
 my $data     = ["a", 1, "1.2", []];
 my $cleaned  = $cleanser->clean_in_place($data); # -> ["a", "1", "1.2", []]

=head1 DESCRIPTION

This class can convert non-stringy numbers in your data to stringy ones.

=for Pod::Coverage ^(new|command_.+)$

=head1 METHODS

=head2 CLASS->get_cleanser => $obj

Return a singleton instance.

=head2 $obj->clean_in_place($data) => $cleaned

Clean $data. Modify data in-place.

=head2 $obj->clone_and_clean($data) => $cleaned

Clean $data. Clone $data first.

=head1 SEE ALSO

L<Data::Clean::ToNonStringyNumber>

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Data-Clean-ToStringyNumber>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Data-Clean-ToStringyNumber>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
http://rt.cpan.org/Public/Dist/Display.html?Name=Data-Clean-ToStringyNumber

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
