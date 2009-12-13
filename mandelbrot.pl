use v6;

my $height = 41;
my $width = 41;

my $upper-right = -2 + (5/4)i;
my $lower-left = 1/2 - (5/4)i;

sub mandel(Complex $c) {
    my $z = 0i;
    for ^50 {
        return 0 if ($z.abs > 2);
        $z = $z * $z + $c;
    }
    return 1;
}

sub subdivide($low, $high, $count) {
    (^$count).map({ $low + ($_ / ($count - 1)) * ($high - $low) });
}

say "P1";
say "$width $height";

for subdivide($upper-right.re, $lower-left.re, $height) -> $re {
    my @line = subdivide($re + ($upper-right.im)i, $re + 0i, ($width + 1) / 2).map({ mandel($_) });
    my $middle = @line.pop;
    (@line, $middle, @line.reverse).join(' ').say;
}