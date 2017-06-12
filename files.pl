use strict;

open(FILE, 'perl need to know\'s.txt') || die "can't open file: $!";
my @line=<FILE>;
print @line;
close FILE;
