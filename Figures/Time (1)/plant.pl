#!/usr/bin/perl

@files = `ls Plant*.out`;

$out = ">PlantStats.csv";
open(OUT, $out) or die "Cannot open $out: $!\n";
print OUT "AMT, Density, Average Pollen Distance, SD for Pollen Distance, SE for Pollen Distance, Average Max Pollen Distance, SD for Max Pollen Distance, SE for Max Pollen Distance, Average Weighted Diversity of Fathers, SD for Weighted Diversity of Fathers, SE for Weighted Diversity of Fathers\n";

foreach (@files){
	$file = $_;
	open(IN, $file) or die "Could not open $file: $!\n";

	($angle) = /A(\d+)/;
	($density) = /D(\d\.\d+)/;

	$size = 0;
	while(<IN>){
		if(/(\d+\.\d+)\s+(\d+\.\d+)\s+(\d+\.\d+)/){
			$hash->{$angle}->{$density}->{avgPollenD} += $1; 
			$hash->{$angle}->{$density}->{avgMaxPollenD} += $2;
			$hash->{$angle}->{$density}->{WDF} += 1/$3;
			$size++;
		}
	}

	$hash->{$angle}->{$density}->{avgPollenD} /= $size; 
	$hash->{$angle}->{$density}->{avgMaxPollenD} /= $size;
	$hash->{$angle}->{$density}->{WDF} /= $size;
	
	close(IN);

	open(IN, $file) or die "Could not open $file: $!\n";
	$avgPollenD = $hash->{$angle}->{$density}->{avgPollenD}; 
	$avgMaxPollenD = $hash->{$angle}->{$density}->{avgMaxPollenD};
	$WDF = $hash->{$angle}->{$density}->{WDF};

	while(<IN>){
		if(/(\d+\.\d+)\s+(\d+\.\d+)\s+(\d+\.\d+)/){
			$hash->{$angle}->{$density}->{sdPollenD} += ($1 - $avgPollenD)**2; 
			$hash->{$angle}->{$density}->{sdMaxPollenD} += ($2 - $avgMaxPollenD)**2;
			$hash->{$angle}->{$density}->{sdWDF} += (1/$3 - $WDF)**2;
		}
	}
	
	$hash->{$angle}->{$density}->{sdPollenD} /= $size; 
	$hash->{$angle}->{$density}->{sdMaxPollenD} /= $size;
	$hash->{$angle}->{$density}->{sdWDF} /= $size;
	$hash->{$angle}->{$density}->{sdPollenD} **= 0.5; 
	$hash->{$angle}->{$density}->{sdMaxPollenD} **= 0.5;
	$hash->{$angle}->{$density}->{sdWDF} **= 0.5;
	$hash->{$angle}->{$density}->{sePollenD} = $hash->{$angle}->{$density}->{sdPollenD}/($size)**0.5; 
	$hash->{$angle}->{$density}->{seMaxPollenD} = $hash->{$angle}->{$density}->{sdMaxPollenD}/($size)**0.5;
	$hash->{$angle}->{$density}->{seWDF} = $hash->{$angle}->{$density}->{sdWDF}/($size)**0.5;

	$sdPollenD = $hash->{$angle}->{$density}->{sdPollenD} **= 0.5; 
	$sdMaxPollenD = $hash->{$angle}->{$density}->{sdMaxPollenD} **= 0.5;
	$sdWDF = $hash->{$angle}->{$density}->{sdWDF} **= 0.5;
	$sePollenD = $hash->{$angle}->{$density}->{sePollenD}; 
	$seMaxPollenD = $hash->{$angle}->{$density}->{seMaxPollenD};
	$seWDF = $hash->{$angle}->{$density}->{seWDF};

	print OUT "$angle, $density, $avgPollenD, $sdPollenD, $sePollenD, $avgMaxPollenD, $sdMaxPollenD, $seMaxPollenD, $WDF, $sdWDF, $seWDF\n";
	close(IN);
}
close(OUT);
