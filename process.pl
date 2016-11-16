# process.pl -- Process Drummond's Kachari Folk-Tales.

use strict;
use warnings;
use FindBin qw($Bin);

my $filename = "Kachari-Folk-Tales-1.0.tei";

sub processFile($) {
    my $filename = shift;
    $filename =~ m/^([A-Za-z0-9-]*?)(-[0-9.]+?)\.tei$/;
    my $basename = $1;
    my $version = $2;
    my $output = $basename . "-intra" . $version . ".tei";

    system ("perl intralinear.pl $filename > $output");
    # system ("perl -S tei2html.pl -t $filename");
    system ("perl -S tei2html.pl -h -e -r $output");
    system ("mv $basename" . "-intra.html $basename.html");
    system ("mv $basename" . "-intra.epub $basename.epub");
    # system ("perl -S tei2html.pl -x -t $filename");
}

processFile($filename);
