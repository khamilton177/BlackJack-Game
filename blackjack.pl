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
		$value=1;
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


###SUBROUTINES BEGIN
sub ShuffleDeck{

	until($#cards<0){
		$cards=splice(@cards,rand(@cards),1);
		push @deck,$cards;
	}

return @deck;
}
###SUBROUTINES ENDS


###SUBROUTINES BEGIN
sub HitMe{

$IsValid=0;
print "Hit or Stay?\n";
print "Please enter 'Hit Me' or 'Stay'\n";
				
	until($IsValid){
		$response=<STDIN>;
		chomp ($response);

		### Is response valid.
			if ($response eq 'q' or $response =~ m/Hit Me|Stay/i){
				$IsValid=1;
			}
			else
				{print "Please enter 'Hit Me' or 'Stay' or 'q' to quit.\a\n";
			}
	}
return $response;
}
###SUBROUTINES ENDS


###SUBROUTINES BEGIN
sub EvaluateHand{

@hand=@_;
$times=@hand;
$aces='no';
$score=0;

	until($times==0){
		$hand=shift(@hand);
		$value=$face_value{$hand};
		$score=$score+$value;
	
		if ($hand=~m/Ace/){
			$aces='yes';
			if($score<21){
				$score2=$score+10;
				if ($score2<21){
					$score=$score2;
				}
			}
		}
	
		if($aces eq 'yes'){
			if($score>21){
				$score=$score-10;
			}
		}
	}

	continue{ 
		--($times);
	}
	
return $score;
}
###SUBROUTINES END


###SUBROUTINES BEGINS
sub Play_Again{
print "Wanna play AGAIN???\n";
goto Play;
}
###SUBROUTINES ENDS


print"\n";
print"\n";
print "Hi!  Wanna play Blackjack?\n";
$quit=0;

Beginning:{
until ($quit){

$IsValid=0;

	until ($IsValid){
		Play: {
			print "Enter 'Y' or 'N'\n";
			$response=<STDIN>;
			chomp ($response);

		### Is response valid.
			if ($response =~ m/^[yY]$|^[nN]$/s){
				$IsValid=1;
			}
			else{
				print "Please enter 'Y' or 'N'\a\n";
			}
		}
	}


	### What's answer.
		if ($response eq 'q'or $response =~ m/N/i){
			$quit=1;
			last;
		}
		else{
			print "\n"; 
			print "You may press 'q' at any time to exit.\n";
			print "\n";
		}

	&CreateCards();
	&ShuffleDeck(@cards);
	%face_value=@face_value;
	@playerHand=();
	@houseHand=();

		while($#deck>0){
			
			$card=pop(@deck);
			push(@playerHand,$card);
			$card=pop(@deck);
			push(@playerHand,$card);
			print "\n";
			print "Player's Deal...\n";
			$Player_Bottom_Card=$playerHand[0];
			$Player_Top_Card=$playerHand[1];
			print "Bottom Card $Player_Bottom_Card\n";
			print "Top Card $Player_Top_Card\n";
			$playerScore=&EvaluateHand(@playerHand);
			$card=pop(@deck);
			push (@houseHand,$card);
			$card=pop(@deck);
			push (@houseHand,$card);
			print"\n";
			print "House's Deal...\n";
			$House_Top_Card=$houseHand[1];
			print "Top Card $House_Top_Card\n";
			$House_Bottom_Card=$houseHand[0];
			$houseScore=&EvaluateHand(@houseHand);
			print "\n";
			print "Player it's your turn...\n";

				while ($playerScore<=21){		
					$answer=&HitMe();

					if ($answer eq 'q'){
						$quit=1;
						goto Beginning;
						
					}
	
					if ($answer =~ m/Stay/i){
						print "\n";
						print "player stays at... $playerScore\n";
						print "House's turn...\n";
						print "\n";
							
						if ($houseScore==21){
							print "House is staying.  House's hand...@houseHand\n";
							print "House stays at... $houseScore\n";
							print "House Has TWENTY-ONE!!!  House WINS!!!\n";
							&Play_Again();
						}

						while ($houseScore<21){
	
				
							if ($houseScore>$playerScore){
								print "House is staying.  House's hand...@houseHand\n";
								print "House stays at... $houseScore\n";
								print "House WINS!!!\n";
								&Play_Again();		
							}
					
							if ($houseScore<=19){
								$card=pop(@deck);
								push(@houseHand,$card);
								print "House takes a hit...\n";
								print "$card\n";
								print "\n";
								$houseScore=&EvaluateHand(@houseHand);
								
									if ($houseScore>21){
										print "House's hand...@houseHand\n";
										print "House score... $houseScore\n";
										print "House BUSTED!!!  Player WINS!!!\n";
										&Play_Again();
									}	
	
									if ($houseScore==$playerScore){
										print "House's hand...@houseHand\n";
										print "House score... $houseScore\n";
										print "Tie...Player WINS!!!\n";
										&Play_Again();
									}
							
									if ($houseScore==21){
										print "House is staying.  House's hand...@houseHand\n";
										print "House stays at... $houseScore\n";
										print "House Has TWENTY-ONE!!!  House WINS!!!\n";
										&Play_Again();		
									}
							}
						}

					}

					if ($answer =~ m/Hit Me/i){
						$card=pop(@deck);
						push(@playerHand,$card);
						print "\n";
						print "$card\n";
						$playerScore=&EvaluateHand(@playerHand);
						print "Player's score...$playerScore\n";
						print "\n";	
					
						if ($playerScore==21){
							print "\n";
							print "Player Has TWENTY-ONE!!!  Player WINS!!!\n";
							&Play_Again();
						}

						if ($playerScore>21){
							print "\n";
							print "Player BUSTED!!!  House WINS!!!\n";
							&Play_Again();
						}	
					}
				}
		}
}
}
print "Exiting Blackjack program\n";

