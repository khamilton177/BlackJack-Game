#!/perl/bin/perl -w
use Tk;

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


###SUBROUTINES BEGIN
sub HitMe{

	$card=pop(@deck);
	push(@playerHand,$card);
	$playerScore=&EvaluateHand(@playerHand);
	
return $playerScore;
}
###SUBROUTINES ENDS


###SUBROUTINES BEGIN

sub BeginGame{

	&CreateCards();
	&ShuffleDeck(@cards);
	%face_value=@face_value;
	@playerHand=();
	@houseHand=();
	$howmany=$#deck+1;
	$cardCount="Cards Left:  $howmany\n" ;

	###Create Counter.
	$bottomScoreBar->destroy() if Tk::Exists($bottomScoreBar);
	$counter=$screen->Label(-relief=>"sunken", -anchor=>"se", -bg=>"grey", -font=>"terminal", -textvariable=>\$cardCount);
	$counter->pack(-side=>"bottom", -fill=>'x');

	###Create buttons.
	$hit=$table->Button(-bitmap=>'calculator', -command=>sub{HitMe})->place(-relx=>0.1, -rely=>0.1);
	##$image=$hit->bitmap('deck.bmp', '@C:/hamke04/kerryprivatestuff/learningperl/');
	###$image->create
	$stay=$table->Button(-text=>"Stay")->place(-relx=>0.4, -rely=>0.8);
	MainLoop;
}
###SUBROUTINES ENDS


###Create Main Window.

$screen=MainWindow->new(-height=>"6i", -width=>"8i", -title=>"Black Jack");
$screen->packPropagate(0);

###Create Menu Bar.
$topMenuBar=$screen->Frame(-height=>"6m")->pack(-side=>"top", -fill=>'x');
$topMenuBar->Menubutton( - tearoff=>0,  -text=>"Game", -menuitems=>[['command', =>"Deal     ", -command=>sub{BeginGame}],  ['command', =>"Exit", -command=>sub{exit}]]) ->place(-anchor=>"nw");
$bottomScoreBar=$screen->Frame( -height=>"6m")->pack(-side=>"bottom", -fill=>'both');

###Create Table.
$table=$screen->Canvas(-height=>"5i", -background=>"green")->pack( -expand=>'yes', -fill=>'both');
MainLoop;

