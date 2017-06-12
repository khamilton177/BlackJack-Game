###SUBROUTINES BEGIN
sub ShuffleDeck{

	until($#cards<0){
		$cards=splice(@cards,rand(@cards),1);
		push @deck,$cards;
	}

return @deck;
}
###SUBROUTINES ENDS