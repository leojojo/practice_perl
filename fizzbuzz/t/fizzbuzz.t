use Test2::V0;
use Data::Dumper;

use FindBin;
use lib "$FindBin::Bin/../lib";
use fizzbuzz qw(fizzbuzz register_pairs);



my %default_pair = (
  3 => "Fizz",
  5 => "Buzz"
);

my @zero = fizzbuzz({ max=>0, pairs=>\%default_pair });
my @zero_exp = U;
is \@zero, \@zero_exp, "出力がないこと";

my @one = fizzbuzz({ max=>1, pairs=>\%default_pair });
my @one_exp = (1);
is \@one, \@one_exp, "出力があること";

my @test = fizzbuzz({ max=>5, pairs=>\%default_pair });
my @test_exp = (1, 2, "Fizz", 4, "Buzz"); 
is \@test, \@test_exp, "数字で割り切れる場合は，入力文字列に変換されていること";

my @fizzbuzz = fizzbuzz({ max=>15, pairs=>\%default_pair });
my $fizzbuzz_exp = "FizzBuzz";
is $fizzbuzz[14], $fizzbuzz_exp, "複数の数字で割り切れる場合，入力文字列が結合されること";



my %pair = register_pairs("t/sample_input.csv");
my %pair_exp = (
  3 => "Foo",
  4 => "Bar",
  5 => "Hoge",
);
is %pair, %pair_exp, "入力CSVからハッシュが出力されること";

ok dies {register_pairs("t/illegal_length.csv")}, "不正なカラム数のCSVを入力すると停止すること";

ok dies {register_pairs("t/illegal_char.csv")}, "不正な形式のCSVを入力すると停止すること";

done_testing;
