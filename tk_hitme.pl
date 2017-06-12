
###SUBROUTINES BEGIN
sub HitMe{

	$card=pop(@deck);
	push(@playerHand,$card);
	print "\n";
	print "$card\n";
	$playerScore=&EvaluateHand(@playerHand);
	print "Player's score...$playerScore\n";
	print "\n";	


$screen->destroy() if Tk::Exists($screen);

return $answer;
}
###SUBROUTINES ENDS
