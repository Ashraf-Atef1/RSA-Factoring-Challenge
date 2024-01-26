#!/usr/bin/perl -w

use strict;
use warnings;

die "Usage: $0 <script> <test_file>\n" if ($#ARGV < 1);

my $program = shift;
my $test_file = shift;
my $output = "${test_file}_output";

# print "PROG[$program], TEST[$test_file]\n";

if (! -f $test_file) {
	print "$test_file: No such file\n";
	exit (1);
} elsif (! -f $program) {
	print "$program: No such file\n";
	exit (1);
}

my %origin_numbers;
# Total number of lines
my $origin_l = 0;
my $points = 1;

# Read test file and store values in a hash
open(ORIGIN, "<$test_file") or die "Could not open file '$test_file' $!\n";
while (<ORIGIN>) {
	#Remove trailing new line
	chomp $_;
	++$origin_l;
	# my $line = $. - 1;
	# print "LINE[$line]:$_\n";
	$origin_numbers{$_} = 1;
}
close(ORIGIN);

# Launch program
# print "Execute command...\n";
system("timeout 5s ./$program $test_file > $output");
# print "Executed!\n";

# Read test file and store values in a hash
open(OUTPUT, "<$output") or die "Could not open file '$output' $!\n";
while (<OUTPUT>) {
	#Remove trailing new line
	chomp $_;

	my $line = $. - 1;
	# print "LINE[$line]:$_\n";

	if ($_ =~ /(\d+)=(\d+)\*(\d+)/) {
		my $result = $1;
		my $op1 = $2;
		my $op2 = $3;

		my $res = `echo "$op1*$op2" | bc`;
		chomp $res;
		next if ($res != $result);
		next if (!exists($origin_numbers{$res}));

		delete $origin_numbers{$res};
		++$points;

		# print "[$op1]*[$op2]=$result\n";
		# print "+1 point\n";
	}
}
close(OUTPUT);

# Cleanup
unlink $output;

# print "$points/$origin_l\n";
my $percent = $points * 100 / $origin_l;
# print "TOTAL:";
printf "%d\n", $percent;