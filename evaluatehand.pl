
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
			if($score>21){
				$score2=$score-10;
				if ($score2<21){
					$score=$score2;
				}
			}
		}
	
	}

	continue{ 
		--($times);
	}
	
return $score;
}
###SUBROUTINES END