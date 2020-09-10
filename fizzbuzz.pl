use warnings;
use strict;
use feature qw(say);

# use lib "/home/leojojo/sb/practice_perl/lib";         # abs path works too
use lib "./lib";
use CSV;



main();

sub main {
  print "FizzBuzzの最大値: ";
  my $input = <STDIN>;

  my @csv = CSV::parse("test.csv");
  my %pairs;
  $pairs{$_->[0]} = $_->[1] for @csv;

  fizzbuzz({max=>$input, pairs=>\%pairs});
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
