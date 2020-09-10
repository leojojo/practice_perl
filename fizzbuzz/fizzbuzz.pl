use warnings;
use strict;
use feature qw(say);
use FindBin;
use Getopt::Long;
use Pod::Usage;

use lib "$FindBin::Bin/../lib";
use CSV;



main();

sub main {
  my $help = 0;
  my $max = 20;
  my %pairs;
  my $input_file;
  GetOptions(
    "help|h"     => \$help,
    "number|n=i" => \$max,
    "input|i=s"  => \$input_file
  ) or pod2usage(2);
  pod2usage(1) if $help;

  if ($input_file) {
    my @csv = CSV::parse($input_file);
    $pairs{$_->[0]} = $_->[1] for @csv;
  } else {
    %pairs = (
      3 => "Fizz",
      5 => "Buzz"
    );
  }

  fizzbuzz({max=>$max, pairs=>\%pairs});
}

sub fizzbuzz {
  my ($args) = @_;
  my $max = $args->{max};
  my %pairs = %{$args->{pairs}};

  for my $i (1..$max) {
    my $value = "";
    for my $modulus (keys %pairs) {
      $value = $value . $pairs{$modulus} if ($i % int($modulus) == 0);
    }
    $value = $value ? $value : $i;
    say $value;
  }
}



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
