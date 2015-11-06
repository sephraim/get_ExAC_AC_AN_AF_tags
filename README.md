# Get ExAC AC, AN, and AF tags

This script will pare down the original ExAC VCF file to only contain AC, AN, and AF tags in the INFO column for all populations. AF does not exist for individual populations in the original VCF, so it is calculated using AC/AN. The CHROM, POS, ID, REF, ALT, QUAL, and FILTER columns will remain exactly the same. Any columns after the INFO column will be dropped.

The point of this script is to provide a file that's easy to implement for annotation purposes.

## Output

The INFO column will only contain the following tags:

- **ExAC\_ALL\_AC** - Total number of alternate alleles in called genotypes
- **ExAC\_ALL\_AN** - Total number of alleles in called genotypes
- **ExAC\_ALL\_AF** - Allele frequency in the all populations calculated from AC and AN, in the range (0,1)
- **ExAC\_AFR\_AC** - African/African American alternate allele counts
- **ExAC\_AFR\_AN** - African/African American allele counts
- **ExAC\_AFR\_AF** - Allele frequency in the African/African American populations calculated from AC and AN, in the range (0,1)
- **ExAC\_AMR\_AC** - American alternate allele counts
- **ExAC\_AMR\_AN** - American allele counts
- **ExAC\_AMR\_AF** - Allele frequency in the American populations calculated from AC and AN, in the range (0,1)
- **ExAC\_EAS\_AC** - East Asian alternate allele counts
- **ExAC\_EAS\_AN** - East Asian allele counts
- **ExAC\_EAS\_AF** - Allele frequency in the East Asian populations calculated from AC and AN, in the range (0,1)
- **ExAC\_FIN\_AC** - Finnish alternate allele counts
- **ExAC\_FIN\_AN** - Finnish allele counts
- **ExAC\_FIN\_AF** - Allele frequency in the Finnish populations calculated from AC and AN, in the range (0,1)
- **ExAC\_NFE\_AC** - Non-Finnish European alternate allele counts
- **ExAC\_NFE\_AN** - Non-Finnish European allele counts
- **ExAC\_NFE\_AF** - Allele frequency in the Non-Finnish populations calculated from AC and AN, in the range (0,1)
- **ExAC\_OTH\_AC** - Other alternate allele counts
- **ExAC\_OTH\_AN** - Other allele counts
- **ExAC\_OTH\_AF** - Allele frequency in the Other populations calculated from AC and AN, in the range (0,1)
- **ExAC\_SAS\_AC** - South Asian alternate allele counts
- **ExAC\_SAS\_AN** - South Asian allele counts
- **ExAC\_SAS\_AF** - Allele frequency in the South Asian populations calculated from AC and AN, in the range (0,1)

## Usage

First, you will need to download the original VCF file from the ExAC server [here](http://exac.broadinstitute.org/downloads). Then run the script on the file. See the example below on how to run the script.

### Example

This script comes with a sample file that you can use to see what the output will look like. You can run the script like follows:

    ./get_ExAC_AC_AN_AF_tags.sh exac.sample.vcf exac.sample.NEW.vcf.gz

#### Input file (argument #1):

- Original ExAC .vcf/vcf.gz/bcf/bcf.gz file

#### Output file (argument #2):

- Altered ExAC .vcf.gz file (with .tbi index file) with only allele counts and freqs

## Requirements

- *bcftools* must be in your $PATH (download it [here](https://github.com/samtools/bcftools/releases))

## Author

Sean Ephraim
