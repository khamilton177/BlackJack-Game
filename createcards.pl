#!/perl/bin/perl -w

###SUBROUTINES BEGIN
sub CreateCards{

@suit=("CLUBS01".."CLUBS13","HEARTS01".."HEARTS13","DIAMONDS01".."DIAMONDS13","SPADES01".."SPADES13");

	do{
		$suit=splice(@suit,0,1);
		$suit =~ s/01/Ace/g;
		$suit =~ s/11/Jack/g;
		$suit =~ s/12/Queen/g;
		$suit =~ s/13/King/g;
		&FaceValue($suit);
		push @cards,$suit;
	}until($#suit<0);

return @cards;
}
###SUBROUTINES END
&CreateCards();
print "@cards\n";

