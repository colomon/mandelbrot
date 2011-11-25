use v6;

my $size = @*ARGS[0] // 321;
$size = +$size;
my $max_iterations = 50;

my $upper-right = -2 + (5/4)i;
my $lower-left = 1/2 - (5/4)i;

my @color_map = (
    "0 0 0",
    "0 0 252",
    "64 0 252",
    "124 0 252",
    "188 0 252",
    "252 0 252",
    "252 0 188",
    "252 0 124",
    "252 0 64",
    "252 0 0",
    "252 64 0",
    "252 124 0",
    "252 188 0",
    "252 252 0",
    "188 252 0",
    "124 252 0",
    "64 252 0",
    "0 252 0",
    "0 252 64",
    "0 252 124",
    "0 252 188",
    "0 252 252",
    "0 188 252",
    "0 124 252",
    "0 64 252",
    "124 124 252",
    "156 124 252",
    "188 124 252",
    "220 124 252",
    "252 124 252",
    "252 124 220",
    "252 124 188",
    "252 124 156",
    "252 124 124",
    "252 156 124",
    "252 188 124",
    "252 220 124",
    "252 252 124",
    "220 252 124",
    "188 252 124",
    "156 252 124",
    "124 252 124",
    "124 252 156",
    "124 252 188",
    "124 252 220",
    "124 252 252",
    "124 220 252",
    "124 188 252",
    "124 156 252",
    "180 180 252",
    "196 180 252",
    "216 180 252",
    "232 180 252",
    "252 180 252",
    "252 180 232",
    "252 180 216",
    "252 180 196",
    "252 180 180",
    "252 196 180",
    "252 216 180",
    "252 232 180",
    "252 252 180",
    "232 252 180",
    "216 252 180",
    "196 252 180",
    "180 252 180",
    "180 252 196",
    "180 252 216",
    "180 252 232",
    "180 252 252",
    "180 232 252",
    "180 216 252",
    "180 196 252",
    "0 0 112",
    "28 0 112",
    "56 0 112",
    "84 0 112",
    "112 0 112",
    "112 0 84",
    "112 0 56",
    "112 0 28",
    "112 0 0",
    "112 28 0",
    "112 56 0",
    "112 84 0",
    "112 112 0",
    "84 112 0",
    "56 112 0",
    "28 112 0",
    "0 112 0",
    "0 112 28",
    "0 112 56",
    "0 112 84",
    "0 112 112",
    "0 84 112",
    "0 56 112",
    "0 28 112",
    "56 56 112",
    "68 56 112",
    "84 56 112",
    "96 56 112",
    "112 56 112",
    "112 56 96",
    "112 56 84",
    "112 56 68",
    "112 56 56",
    "112 68 56",
    "112 84 56",
    "112 96 56",
    "112 112 56",
    "96 112 56",
    "84 112 56",
    "68 112 56",
    "56 112 56",
    "56 112 68",
    "56 112 84",
    "56 112 96",
    "56 112 112",
    "56 96 112",
    "56 84 112",
    "56 68 112",
    "80 80 112",
    "88 80 112",
    "96 80 112",
    "104 80 112",
    "112 80 112",
    "112 80 104",
    "112 80 96",
    "112 80 88",
    "112 80 80",
    "112 88 80",
    "112 96 80",
    "112 104 80",
    "112 112 80",
    "104 112 80",
    "96 112 80",
    "88 112 80",
    "80 112 80",
    "80 112 88",
    "80 112 96",
    "80 112 104",
    "80 112 112",
    "80 104 112",
    "80 96 112",
    "80 88 112",
    "0 0 64",
    "16 0 64",
    "32 0 64",
    "48 0 64",
    "64 0 64",
    "64 0 48",
    "64 0 32",
    "64 0 16",
    "64 0 0",
    "64 16 0",
    "64 32 0",
    "64 48 0",
    "64 64 0",
    "48 64 0",
    "32 64 0",
    "16 64 0",
    "0 64 0",
    "0 64 16",
    "0 64 32",
    "0 64 48",
    "0 64 64",
    "0 48 64",
    "0 32 64",
    "0 16 64",
    "32 32 64",
    "40 32 64",
    "48 32 64",
    "56 32 64",
    "64 32 64",
    "64 32 56",
    "64 32 48",
    "64 32 40",
    "64 32 32",
    "64 40 32",
    "64 48 32",
    "64 56 32",
    "64 64 32",
    "56 64 32",
    "48 64 32",
    "40 64 32",
    "32 64 32",
    "32 64 40",
    "32 64 48",
    "32 64 56",
    "32 64 64",
    "32 56 64",
    "32 48 64",
    "32 40 64",
    "44 44 64",
    "48 44 64",
    "52 44 64",
    "60 44 64",
    "64 44 64",
    "64 44 60",
    "64 44 52",
    "64 44 48",
    "64 44 44",
    "64 48 44",
    "64 52 44",
    "64 60 44",
    "64 64 44",
    "60 64 44",
    "52 64 44",
    "48 64 44",
    "44 64 44",
    "44 64 48",
    "44 64 52",
    "44 64 60",
    "44 64 64",
    "44 60 64",
    "44 52 64",
    "44 48 64",
);

constant $GTK  = "gtk-sharp, Version=2.12.0.0, Culture=neutral, PublicKeyToken=35e10195dab3c99f";
constant $GDK  = "gdk-sharp, Version=2.12.0.0, Culture=neutral, PublicKeyToken=35e10195dab3c99f";

constant Application    = CLR::("Gtk.Application,$GTK");
constant Window         = CLR::("Gtk.Window,$GTK");
constant GdkCairoHelper = CLR::("Gdk.CairoHelper,$GDK");
constant GdkGC          = CLR::("Gdk.GC,$GDK");
constant GdkRgb         = CLR::("Gdk.Rgb,$GDK");
constant GdkRgbDither   = CLR::("Gdk.RgbDither,$GDK");
constant GdkColor       = CLR::("Gdk.Color,$GDK");
constant GtkDrawingArea = CLR::("Gtk.DrawingArea,$GTK");
constant SystemByte     = CLR::("System.Byte");
constant ByteArray      = CLR::("System.Byte[]");

my @red =   @color_map.map({ SystemByte.Parse($_.comb(/\d+/)[0]) });
my @green = @color_map.map({ SystemByte.Parse($_.comb(/\d+/)[1]) });
my @blue =  @color_map.map({ SystemByte.Parse($_.comb(/\d+/)[2]) });

Application.Init;
GdkRgb.Init;
my $window = Window.new("mandelbrot");
my $windowSizeX = $size; my $windowSizeY = $size;
$window.Resize($windowSizeX, $windowSizeY);  # TODO: resize at runtime NYI
my $drawingarea = GtkDrawingArea.new;
$drawingarea.add_ExposeEvent(&ExposeEvent);
$window.add_DeleteEvent(&DeleteEvent);
$window.Add($drawingarea);
$window.ShowAll;
Application.Run;  # end of main program, it's all over when this returns

sub DeleteEvent($obj, $args) {  #OK not used
    Application.Quit;
};

sub ExposeEvent($obj, $args)
{
    $args;  # suppress "declared but not used" "Potential difficulties"
    
    my $start-time = time;
    my $windowX=0; my $windowY=0; my $windowWidth=0; my $windowHeight=0; my $windowDepth=0;
    my $window = $obj.GdkWindow;
    $window.GetGeometry($windowX, $windowY, $windowWidth, $windowHeight, $windowDepth);

    my $delta = ($lower-left.re - $upper-right.re) / $windowWidth;

    my $bytes = ByteArray.new($windowWidth * 3 * $windowHeight);

    my $counter = 0;
    my ($x, $y);
    loop ($y = 0; $y < $windowHeight; $y++) {
        my $c = $upper-right - $y * $delta * i;
        loop ($x = 0; $x < $windowWidth; $x++) {
            my $value = mandel($c);
            $bytes.Set($counter++, @red[$value]);
            $bytes.Set($counter++, @green[$value]);
            $bytes.Set($counter++, @blue[$value]);
            $c += $delta;
        }
    }

    my $gc = GdkGC.new($window);
    $window.DrawRgbImage($gc, $windowX, $windowY, $windowWidth, $windowHeight, 
                         GdkRgbDither.Normal, $bytes, $windowWidth * 3);
    
    my $elapsed = time - $start-time;
    say "$elapsed seconds";
};

sub mandel(Complex $c) {
    my $z = 0i;
    my $i;
    loop ($i = 0; $i < $max_iterations; $i++) {
        if ($z.abs > 2) {
            return $i + 1;
        }
        $z = $z * $z + $c;
    }
    return 0;
}
