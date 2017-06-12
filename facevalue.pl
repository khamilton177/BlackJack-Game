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
