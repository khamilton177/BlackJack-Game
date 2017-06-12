#!/perl/bin/perl -w
use strict;

my $quit=0;
my $Hours;

until ($quit){
	{print "Please enter total hours for week or '0' to exit: ";
	chomp($Hours=<STDIN>);
	}

my $RatePerHour;
my $OvertimeHours;
my $GrossPay;
	
		if($Hours==0){
			$quit=1;
		}
		elsif($Hours>40){
			print "Please enter rate per hour: ";
			chomp($RatePerHour=<STDIN>);
				my $OvertimeRate=$RatePerHour * 1.5;
			$OvertimeHours=$Hours-40;
			$GrossPay=(40*$RatePerHour) + ($OvertimeHours*$OvertimeRate);
			print "Gross pay for week= \$$GrossPay\n;";
		}	
		else{
			print "Please enter rate per hour: ";
			chomp($RatePerHour=<STDIN>);
			$GrossPay=($Hours*$RatePerHour);
			print "Gross pay for week= \$$GrossPay\n;";
		}
 }
	
	
