#!/perl/bin/perl -w
use strict;
print "Welcome to the MathQ program\n";
my $quit=0;
my $TotalCorrect=1;
my $TotalIncorrect=1;

until ($quit){
		my $FirstNumber= int(rand(10));
		my $SecondNumber=int(rand(9))+1;
		my $operator=int(rand(2));
		my $solution;
		my $question;
		my $QuestionIncorrect;
		
###Decide if question produced is multiplication or division.
		if ($operator==1) {
			$solution=$FirstNumber * $SecondNumber;
			$question="$FirstNumber * $SecondNumber = ?";
			$QuestionIncorrect="$FirstNumber * $SecondNumber = ";
		}
		else{
			$solution=$FirstNumber * $SecondNumber;
			($solution, $FirstNumber)=($FirstNumber, $solution);
			$question="$FirstNumber / $SecondNumber = ?";
			$QuestionIncorrect="$FirstNumber / $SecondNumber = ";
		}
		my $response;
		my $IsValid=0;

	until ($IsValid){
		print "$question\n";
		$response=<STDIN>;
		chomp ($response);
	
###Is answer valid.
		if ($response eq 'q' or $response =~ m/^\d+$/) {
			$IsValid=1;
		}
		else{
			print "Invalid Input:  enter an interger or 'q' to quit\a\n";
		}
	}



###Test to see if response is correct,incorrect or if user wishes to exit.
	if ($response eq 'q'){
		$quit=1;
	}
	elsif ($response==$solution){
		print " \n";
		print $TotalCorrect++;
		print " Correct \n"

	}	
	else{
		print "Incorrect: $QuestionIncorrect $solution\n";
		print " \n";
		print $TotalIncorrect++;
		print " Incorrect \n"

	}
}
print "Exiting the MathQ program\n";
