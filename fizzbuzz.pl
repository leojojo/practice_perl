use warnings;
use strict;
use feature qw(say);

sub Iterator (&) { return $_[0] }
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s }



main();

sub main {
  print "FizzBuzzの最大値: ";
  my $input = <STDIN>;

  my @csv = parse_csv("test.csv");
  my %pairs;
  $pairs{$_->[0]} = $_->[1] for @csv;

  fizzbuzz({max=>$input, pairs=>\%pairs});

  # my $iterator = iter_fizzbuzz($input);
  # while (my $val = $iterator->()) {
  #   say $val;
  # }
}

sub parse_csv {
  my ($filename) = @_;

  my @parsed;
  open(FH, "<", $filename) or die("error :$!");
  while (<FH>) {
    chomp($_);
    my @line = split(/,/, $_, -1);          # 末尾の空白が削られる仕様を防ぐ-1
    $_ = trim($_) for @line;
    push(@parsed, \@line);
  }
  close(FH);
  return @parsed;
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

sub iter_fizzbuzz {
  my ($max) = @_;
  my $current;

  return Iterator {
    $current++;
    return undef if $current > $max;
    return $current % 15 == 0 ? "FizzBuzz" : $current % 3 == 0 ? "Fizz" : $current % 5 == 0 ? "Buzz" : $current;
  }
}
