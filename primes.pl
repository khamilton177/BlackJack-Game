use strict;

my $limit;

print "Enter an integer as an upper limit: ";
$limit=<STDIN>;
chomp($limit);

my $CrossOut;
my @primes=(0, 0, 2..$limit);
my $index;

for ($index=2; $index<=sqrt($limit); $index++){
	if ($primes[$index]){
	$CrossOut=$index*2;
			
		while ($CrossOut<=$limit){
		$primes[$CrossOut]=0;
		$CrossOut+=$index;
		}
	}
}		

my $PrimeNumber;
 
foreach $PrimeNumber (@primes){
	if ($PrimeNumber){
		print "$PrimeNumber is prime\n";
	}
}


			
