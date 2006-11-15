package Querylet::Output;

use strict;
use warnings;

use Carp;

=head1 NAME

Querylet::Output - generic output handler for Querlet::Query

=head1 VERSION

version 0.26

 $Id$

=cut

our $VERSION = '0.26';

=head1 SYNOPSIS

This is an abstract base class, meant for subclassing.

 package Querylet::Output::Tabbed;
 use base qw(Querylet::Output);

 sub default_type { 'tabbed' }
 sub handler      { \&as_tabbed }  

 sub as_tabbed {
   my ($query) = @_;
   my @output;
   push @output, join("\t", @{$query->columns});
	 push @output, join("\t", @{$_{@{$query->colummns}}}) for @{$query->results};
   return join("\n", @output);
 }

 1;

Then, in a querylet:

 use Querylet::Output::Tabbed;
 
 output format: tabbed

Or, to override the registered type:

 use Querylet::Output::Tabbed 'tsv';

 output format: tsv

=head1 DESCRIPTION

This class provides a simple way to write output handlers for Querylet, mostly
by providing an import routine that will register the handler with the
type-name requested by the using script.

The methods C<default_type> and C<handler> must exist, as described below.

=head1 IMPORT

Querylet::Output provides an C<import> method that will register the handler
when the module is imported.  If an argument is given, it will be used as the
type name to register.  Otherwise, the result of C<default_type> is used.

=cut

sub import {
	my ($class, $type) = @_;
	$type = $class->default_type unless $type;

	my $handler = $class->handler;

	Querylet::Query->register_output_handler($type => $handler);
}

=head1 METHODS

=over 4

=item C<< default_type >>

This method returns the name of the type for which the output handler will be
registered if no override is given.

=cut

sub default_type { croak "default_type method unimplemented" }

=item C<< handler >>

This method returns a reference to the handler, which will be used to register
the handler.

=cut

sub handler { croak "handler method unimplemented" }

=back

=head1 AUTHOR

Ricardo SIGNES, C<< <rjbs@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-querylet@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT

Copyright 2004 Ricardo SIGNES, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

"I do endeavor to give satisfaction, sir.";
