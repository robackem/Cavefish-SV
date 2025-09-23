#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

# Variables for input options
my ($vcf_file, $key_file, $output_file);
GetOptions(
    'i=s' => \$vcf_file,
    'a=s' => \$key_file,
    'o=s' => \$output_file,
) or die "Usage: $0 -i <vcf_file> -a <key_file> -o <output_file>\n";

# Check if all required options are provided
die "Usage: $0 -i <vcf_file> -a <key_file> -o <output_file>\n" unless $vcf_file && $key_file && $output_file;

# Open the key file and process it
open my $key_fh, '<', $key_file or die "Could not open key file '$key_file': $!\n";
my %populations;
while (<$key_fh>) {
    chomp;
    my ($col_num, $sample_name, $population) = split;
    push @{$populations{$population}}, $col_num;
}
close $key_fh;

# Open the VCF file and process it
open my $vcf_fh, '<', $vcf_file or die "Could not open VCF file '$vcf_file': $!\n";
open my $out_fh, '>', $output_file or die "Could not open output file '$output_file': $!\n";

while (<$vcf_fh>) {
    next if /^#/;  # Skip header lines
    chomp;
    my @columns = split /\t/;
    
    # Extract the first five columns for output
    my @output_cols = @columns[0..4];
    
    # Calculate allele frequencies for each population
    my %freqs;
    foreach my $pop (keys %populations) {
        my $total_alleles = 0;
        my $alt_alleles = 0;
        my $missing_alleles = 0;
        
        foreach my $col_idx (@{$populations{$pop}}) {
	  # my $genotype = substr($columns[$col_idx], 0, 3);
	   my ($genotype) = ($columns[$col_idx] =~ /^([^:]+)/);
            my ($allele1, $allele2) = split /\//, $genotype;
            
            $missing_alleles++ if $allele1 eq '.';
            $missing_alleles++ if $allele2 eq '.';
            
            if ($allele1 ne '.') {
                $total_alleles++;
                $alt_alleles++ if $allele1 != 0;
            }
            if ($allele2 ne '.') {
                $total_alleles++;
                $alt_alleles++ if $allele2 != 0;
            }
        }
        
        my $num_individuals = scalar @{$populations{$pop}};
        my $total_possible_alleles = $num_individuals * 2;
        
        if ($missing_alleles > $total_alleles) {
            $freqs{$pop} = "NA ($total_alleles/$total_possible_alleles)";
        } else {
            my $freq = sprintf("%.4f", $alt_alleles / $total_alleles);
            $freqs{$pop} = "$freq ($total_alleles/$total_possible_alleles)";
        }
    }
    
    # Append population frequencies to the output
    foreach my $pop (sort keys %populations) {
        push @output_cols, "$pop:$freqs{$pop}";
    }
    
    # Print the output line
    print $out_fh join("\t", @output_cols), "\n";
}

close $vcf_fh;
close $out_fh;

print "Calculation completed. Results written to $output_file\n";
