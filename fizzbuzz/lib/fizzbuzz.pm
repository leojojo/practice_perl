package fizzbuzz;

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use CSV;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(fizzbuzz register_pairs);



sub fizzbuzz {
  my ($args) = @_;
  my $max = $args->{max};
  my %pairs = %{$args->{pairs}};

  my @result;
  for my $i (1..$max) {
    my $value = "";
    for my $modulus (sort keys %pairs) {
      $value = $value . $pairs{$modulus} if ($i % int($modulus) == 0);
    }
    $value = $value ? $value : $i;
    push(@result, $value);
  }
  return @result;
}

sub register_pairs {
  my $input_file = shift;

  my %pairs;
  if ($input_file) {
    my @csv = CSV::parse($input_file);
    $pairs{$_->[0]} = $_->[1] for @csv;
  } else {
    %pairs = (
      3 => "Fizz",
      5 => "Buzz"
    );
  }
  return %pairs;
}

1;
