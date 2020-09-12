package CSV;

use warnings;
use strict;

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s }

sub parse {
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

1;
