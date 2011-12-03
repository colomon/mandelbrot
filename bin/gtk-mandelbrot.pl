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
constant GtkEventBox    = CLR::("Gtk.EventBox,$GTK");
constant SystemByte     = CLR::("System.Byte");
constant SystemIntPtr   = CLR::("System.IntPtr");
constant ByteArray      = CLR::("System.Byte[]");

my @red =   @color_map.map({ SystemByte.Parse($_.comb(/\d+/)[0]) });
my @green = @color_map.map({ SystemByte.Parse($_.comb(/\d+/)[1]) });
my @blue =  @color_map.map({ SystemByte.Parse($_.comb(/\d+/)[2]) });

my @windows;

class FractalSet {
    has Bool $.is-julia;
    has Complex $.upper-right;
    has Real $.delta;
    has Int $.width;
    has Int $.height;
    has Complex $.c;
    has $.stored-byte-array;
    
    method GetByteArray() {
        unless $.stored-byte-array {
            my $start-time = time;

            $.stored-byte-array = ByteArray.new($.width * 3 * $.height);

            my $counter = 0;
            my ($x, $y);
            loop ($y = 0; $y < $.height; $y++) {
                my $c = $upper-right - $y * $.delta * i;
                loop ($x = 0; $x < $.width; $x++) {
                    my $value = $.is-julia ?? julia($.c, $c) !! mandel($c);
                    $.stored-byte-array.Set($counter++, @red[$value]);
                    $.stored-byte-array.Set($counter++, @green[$value]);
                    $.stored-byte-array.Set($counter++, @blue[$value]);
                    $c += $.delta;
                }
            }

            my $elapsed = time - $start-time;
            say "$elapsed seconds";
        }
        $.stored-byte-array;
    }
    
    method BuildWindow()
    {
        my $index = +@windows;
        @windows.push(self);
        
        my $window = Window.new($.is-julia ?? "julia" !! "mandelbrot");
        $window.Resize($.width, $.height);  # TODO: resize at runtime NYI

        my $event-box = GtkEventBox.new;
        $event-box.add_ButtonReleaseEvent(&ButtonEvent);

        my $drawingarea = GtkDrawingArea.new;
        $drawingarea.SetData("Id", SystemIntPtr.new($index));
        $drawingarea.add_ExposeEvent(&ExposeEvent);
        $window.add_DeleteEvent(&DeleteEvent);
        $event-box.Add($drawingarea);

        $window.Add($event-box);
        $window.ShowAll;
    }
    
}

Application.Init;
GdkRgb.Init;

FractalSet.new(is-julia => False,
               upper-right => $upper-right, 
               delta => ($lower-left.re - $upper-right.re) / $size,
               width => $size, 
               height => $size).BuildWindow;
FractalSet.new(is-julia => True,
              upper-right => $upper-right, 
              delta => ($lower-left.re - $upper-right.re) / $size,
              width => $size, 
              height => $size,
              c => 0 + 0i).BuildWindow;

Application.Run;  # end of main program, it's all over when this returns

sub BuildWindow(Bool $is-julia,
                Complex $upper-right,
                Real $delta,
                Int $width,
                Int $height)
{
    my $set = FractalSet.new(:$is-julia, :$upper-right, :$delta, :$width, :$height);
    $set.BuildWindow;
}

sub ButtonEvent($obj, $args) {  #OK not used
    given $args.Event.Button {
        when 3 { say "Create Julia now!"; }
    }
}

sub DeleteEvent($obj, $args) {  #OK not used
    Application.Quit;
};

sub ExposeEvent($obj, $args)
{
    $args;  # suppress "declared but not used" "Potential difficulties"
    my $index = $obj.GetData("Id").ToInt32();
    my $set = @windows[$index];
    
    my $window = $obj.GdkWindow;
    my $windowX=0; my $windowY=0; my $windowWidth=0; my $windowHeight=0; my $windowDepth=0;
    $window.GetGeometry($windowX, $windowY, $windowWidth, $windowHeight, $windowDepth);
    if $windowHeight != $set.height || $windowWidth != $set.width {
        $set.resize($windowWidth, $windowHeight);
    }

    my $gc = GdkGC.new($window);
    $window.DrawRgbImage($gc, $windowX, $windowY, $windowWidth, $windowHeight, 
                         GdkRgbDither.Normal, $set.GetByteArray, $windowWidth * 3);
};

sub mandel(Complex $c) {
    my $z = 0i;
    my $i;
    loop ($i = 0; $i < $max_iterations; $i++) {
        if $z.abs > 2 {
            return $i + 1;
        }
        $z = $z * $z + $c;
    }
    return 0;
}

sub julia(Complex $c, Complex $z0) {
    my $z = $z0;
    my $i;
    loop ($i = 0; $i < $max_iterations; $i++) {
        if $z.abs > 2 {
            return $i + 1;
        }
        $z = $z * $z + $c;
    }
    return 0;
}
