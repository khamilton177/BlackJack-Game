

@suit = ("clubs", "diamonds", "hearts", "spades");
$refsuit=\@suit;
$refsuit=int(rand 4);
print "$refsuit\n";
my $int1=int $refsuit;
my $suit = @suit[$int];

@face=("ACE", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King");
$refface=\@face;
$refface=int(rand 13);
print "$refface\n";
my $int2=int $refface;
my $face = @face[$int2];
print "$face of $suit";