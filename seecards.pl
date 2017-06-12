#!/perl/bin/perl -w

###SUBROUTINES BEGIN
sub FaceValue{

$number=02;

	until($number>10){
		if ($suit =~m/$number/){
			$value=$number;
			push @face_value,$suit;
			push @face_value,$value; 
		}
	}
	continue{ 
		++($number);
	}			
	
	if ($suit =~ m/Jack/){
		$value=10;
		push @face_value,$suit;
		push @face_value,$value; 
	}
	if ($suit =~ m/Queen/){
		$value=10;
		push @face_value,$suit;
		push @face_value,$value; 
	}
	if ($suit =~ m/King/){
		$value=10;
		push @face_value,$suit;
		push @face_value,$value; 
	}
	if ($suit =~ m/Ace/){
		$value=11;
		push @face_value,$suit;
		push @face_value,$value; 
	}

return @face_value;
}
###SUBROUTINES END

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
&FaceValue();
&CreateCards();
print "@cards\n";

