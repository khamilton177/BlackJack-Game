#!/Perl/bin/perl.exe -w
use strict;
my $FaqDirectory='D:\Perl\Lib\Pod';
my @FaqFiles=(	
'perlfaq1.pod', 'perlfaq2.pod', 'perlfaq3.pod', 'perlfaq4.pod', 'perlfaq5.pod', 'perlfaq6.pod', 'perlfaq7.pod', 'perlfaq8.pod', 'perlfaq9.pod');													
my $pattern=$ARGV[0] || die ("no pattern given: $!");

foreach my $filename (@FaqFiles){
	open (FILE, "$FaqDirectory/$filename") || die ("Can't open 'filename': $!");
		while (<FILE>){
			if (s/^=head2// and m/$pattern/){
				print "$filename:\n$_";
			}
		}
}
close FILE;


