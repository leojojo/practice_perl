use warnings;
use strict;
use feature qw(say);



main();

sub main {
  print "FizzBuzzの最大値: ";
  my $input = <STDIN>;

  fizzbuzz($input);
}

sub fizzbuzz {
  my ($max) = @_;

  for (1..$max) {
    if ($_ % 3 == 0) {
      print "Fizz";
      if ($_ % 5 == 0) {
        print "Buzz";
      }
      print "\n";
    } elsif ($_ % 5 == 0) {
      say "Buzz";
    } else {
      say $_;
    }
  }
}
