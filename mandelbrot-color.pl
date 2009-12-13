use v6;

my $height = 35;
my $width = $height;
my $max_iterations = 50;

my $upper-right = -2 + (5/4)i;
my $lower-left = 1/2 - (5/4)i;

sub mandel(Complex $c) {
    my $z = 0i;
    for ^$max_iterations {
        return $_ if ($z.abs > 2);
        $z = $z * $z + $c;
    }
    return $max_iterations;
}

sub subdivide($low, $high, $count) {
    (^$count).map({ $low + ($_ / ($count - 1)) * ($high - $low) });
}

say "P3";
say "$width $height";
say $max_iterations;

for subdivide($upper-right.re, $lower-left.re, $height) -> $re {
    my @line = subdivide($re + ($upper-right.im)i, $re + 0i, ($width + 1) / 2).map({ mandel($_) });
    my $middle = @line.pop;
    (@line, $middle, @line.reverse).map({ $_ xx 3 }).join(' ').say;
}
