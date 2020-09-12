use warnings;
use strict;
use feature qw(say);
use Getopt::Long;
use Pod::Usage;

use FindBin;
use lib "$FindBin::Bin/lib";
use CSV;
use fizzbuzz;



sub main {
  my $help = 0;
  my $max = 20;
  my $input_file;
  GetOptions(
    "help|h"     => \$help,
    "number|n=i" => \$max,
    "input|i=s"  => \$input_file
  ) or pod2usage(2);
  pod2usage(1) if $help;

  my %pairs = fizzbuzz::register_pairs($input_file);

  my @result = fizzbuzz::fizzbuzz({max=>$max, pairs=>\%pairs});
  say $_ for @result;
}

main() unless caller;



__END__
 
=head1 NAME

FizzBuzz


=head1 SYNOPSIS

perl fizzbuzz.pl [-n] [-i]
 

  Optional arguments:
    -h, --help           help message
    -n, --number         (default 20) maximum number to count up to
    -i, --input          input CSV file

=head1 OPTIONS

=item -h, --help

Print a brief help message and exits.

=item -n, --number

Number in integer to count up to.

=item -i, --input

The words and dividents: "Fizz" for 3, and "Buzz" for 5, can be changed.
A CSV file of the following format is accepted.

  3, Fizz
  5, Buzz

=cut
