@deck=("1".."10");
$players=5;
###$players=$players+1;

until($players==0){
	@playerHand='@playerHand'.$players;
	@_=@playerHand;
	$card=pop(@deck);
	push(@_,$card);
	$card=pop(@deck);
	push(@_,$card);
	print "\n";
	print "Player's hand @playerHand...\n";
	###$Player_Bottom_Card=$playerHand[0];
	###$Player_Top_Card=$playerHand[1];
	###print "Bottom Card $Player_Bottom_Card\n";
	###print "Top Card $Player_Top_Card\n";
	###$playerScore=&EvaluateHand(@playerHand);
}

continue{ 
	--($players);
}

$card=@playerHand3[1];
print "$card\n";
