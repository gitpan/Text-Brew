use strict;
use Text::Brew qw(distance);

my $ko=0;
my $test=1;
my ($distance,$arrayref_edits)=distance("four","foo");
my $sequence=join",",@$arrayref_edits;
if ($distance == 2) {

	print $test."a. ok\n"

} else {

	print $test."a. NO <--\n";
	$ko=1;
}

if ($sequence eq "INITIAL,MATCH,MATCH,DEL,SUBST") {

	print $test."b. ok\n"

} else {

	print $test."b. NO <--\n";
	$ko=1;
}

my $string1="foo";
my @strings=("four","foo","bar");
my (@dist,@edits);
my @dist_ok=(2,0,3);
my @edits_ok=("INITIAL,MATCH,MATCH,INS,SUBST","INITIAL,MATCH,MATCH,MATCH","INITIAL,SUBST,SUBST,SUBST");
foreach my $string2 (@strings) {
	my ($dist,$edits)=distance($string1,$string2);
	push @dist,$dist;
	push @edits,(join ",",@$edits);
}
foreach my $index (0 .. $#strings) {

	$test++;
	if ($dist[$index] == $dist_ok[$index]) {

		print $test."a. ok\n"

	} else {

		print $test."a. NO <--\n";
		$ko=1;
	}

	if ($edits[$index] eq $edits_ok[$index]) {

		print $test."b. ok\n"

	} else {

		print $test."b. NO <--\n";
		$ko=1;
	}
}

$test++;
$distance=distance("four","foo",{-output=>'distance'});

if ($distance == 2) {

	print $test.".  ok\n"

} else {

	print $test.".  NO <--\n";
	$ko=1;
}


$test++;

$arrayref_edits=distance("four","foo",{-output=>'edits'});
$sequence=join",",@$arrayref_edits;

if ($sequence eq "INITIAL,MATCH,MATCH,DEL,SUBST") {

	print $test.".  ok\n"

} else {

	print $test.".  NO <--\n";
	$ko=1;
}


$test++;
($distance,$arrayref_edits)=distance("four","foo",{-cost=>[0,2,1,1]});
$sequence=join",",@$arrayref_edits;

if ($distance == 2) {

	print $test."a. ok\n"

} else {

	print $test."a. NO <--\n";
	$ko=1;
}

if ($sequence eq "INITIAL,MATCH,MATCH,DEL,SUBST") {

	print $test."b. ok\n"

} else {

	print $test."b. NO <--\n";
	$ko=1;
}


$test++;
($distance,$arrayref_edits)=distance("foo","four",{-cost=>[0,2,1,1]});
$sequence=join",",@$arrayref_edits;

if ($distance == 3) {

	print $test."a. ok\n"

} else {

	print $test."a. NO <--\n";
	$ko=1;
}

if ($sequence eq "INITIAL,MATCH,MATCH,INS,SUBST") {

	print $test."b. ok\n"

} else {

	print $test."b. NO <--\n";
	$ko=1;
}


if ($ko) {print "\nTest suite failed\n"} else {print "\nTest suite ok\n"}
