#!/usr/bin/perl

@files = `ls Animal*.out`;

$out = ">AnimalStats.csv";
open(OUT, $out) or die "Cannot open $out: $!\n";
print OUT "AMT, Density, Average Path Distance, SD for Path Distance, SE for Path Distance, Average Max Distance, SD for Max Distance, SE for Max Distance\n";

foreach (@files){
	$file = $_;
	open(IN, $file) or die "Could not open $file: $!\n";

	($angle) = /A(\d+)/;
	($density) = /D(\d\.\d+)/;

	$size = 0;
	while(<IN>){
		if(/(\d+\.\d+)\s+(\d+\.\d+)/){
			$hash->{$angle}->{$density}->{avgPath} += $1; 
			$hash->{$angle}->{$density}->{avgMax} += $2;
			$size++;
		}
	}

	$hash->{$angle}->{$density}->{avgPath} /= $size; 
	$hash->{$angle}->{$density}->{avgMax} /= $size;
	
	close(IN);

	open(IN, $file) or die "Could not open $file: $!\n";
	$avgPath = $hash->{$angle}->{$density}->{avgPath}; 
	$avgMax = $hash->{$angle}->{$density}->{avgMax};

	while(<IN>){
		if(/(\d+\.\d+)\s+(\d+\.\d+)/){
			$hash->{$angle}->{$density}->{sdPath} += ($1 - $avgPath)**2; 
			$hash->{$angle}->{$density}->{sdMax} += ($2 - $avgMax)**2;
		}
	}
	
	$hash->{$angle}->{$density}->{sdPath} /= $size; 
	$hash->{$angle}->{$density}->{sdMax} /= $size;
	$hash->{$angle}->{$density}->{sdPath} **= 0.5; 
	$hash->{$angle}->{$density}->{sdMax} **= 0.5;
	$hash->{$angle}->{$density}->{sePath} = $hash->{$angle}->{$density}->{sdPath} / ($size)**0.5; 
	$hash->{$angle}->{$density}->{seMax} = $hash->{$angle}->{$density}->{sdMax} / ($size)**0.5;

	$sdPath = $hash->{$angle}->{$density}->{sdPath}; 
	$sePath = $hash->{$angle}->{$density}->{sePath}; 
	$sdMax = $hash->{$angle}->{$density}->{sdMax};
	$seMax = $hash->{$angle}->{$density}->{seMax};

	print OUT "$angle, $density, $avgPath, $sdPath, $sePath, $avgMax, $sdMax, $seMax,\n";
	
	close(IN);
}
close(OUT);
