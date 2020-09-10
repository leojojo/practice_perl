package fizzbuzz;

use warnings;
use strict;



sub fizzbuzz {
  my ($args) = @_;
  my $max = $args->{max};
  my %pairs = %{$args->{pairs}};

  my @result;
  for my $i (1..$max) {
    my $value = "";
    for my $modulus (keys %pairs) {
      $value = $value . $pairs{$modulus} if ($i % int($modulus) == 0);
    }
    $value = $value ? $value : $i;
    push(@result, $value);
  }
  return @result;
}

1;
