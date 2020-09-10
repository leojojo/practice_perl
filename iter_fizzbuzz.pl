use warnings;
use strict;
use feature qw(say);

sub Iterator (&) { return $_[0] }



main();

sub main {
  print "FizzBuzzの最大値: ";
  my $input = <STDIN>;

  my $iterator = iter_fizzbuzz($input);
  while (my $val = $iterator->()) {
    say $val;
  }
}

sub iter_fizzbuzz {
  my ($max) = @_;
  my $current;

  return Iterator {
    $current++;
    return undef if $current > $max;
    return $current % 15 == 0 ? "FizzBuzz" : $current % 3 == 0 ? "Fizz" : $current % 5 == 0 ? "Buzz" : $current;
  }
}
