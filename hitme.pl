
###SUBROUTINES BEGIN
sub HitMe{

my $IsValid=0;
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
my $return=$response;
}
###SUBROUTINES ENDS
