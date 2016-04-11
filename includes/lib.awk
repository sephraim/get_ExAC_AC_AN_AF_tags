# Print Header
#
# Import a header from a file and print it.
#
# @author Sean Ephraim
# @param file Name of header file
function print_header(file) {
  # Print header
  while (( getline < file) > 0 ) {
     print
  }
  close(file)
}

# Get AC AN AF
#
# Compute the AF for an ExAC variant based on AC/AN.
#
# Example variant:
# 22 24199764 rs66928071 AC ACC,ACCCC,ACCC,A ... AC_AFR=792,151,754,865,4244;...
# Example input (e.g. AC_AFR, AN_AFR):
#   "792,151,754,865"
#   "6806"
# Example output (i.e. AC, AN, AF):
#   ["792,151,754,865", "6806", "0.116368,0.0221863,0.110785,0.127094"]
#
# @author Sean Ephraim
# @param ac  Original string containing alternate allele counts (comma-separated)
# @param an  Original string containing total allele counts
# @param ac_an_af Array to store the final AC, AN, and AF values
function get_ac_an_af(ac, an, ac_an_af) {
  len_ac_array = split(ac, ac_array, ",")
  # Calculate AF
  for (i = 1; i <= len_ac_array; i++) {
    if (i == 1) {
      # Add first AF
      if (an == 0) {
        af = 0 # Can't divide by 0
      }
      else {
        af = ac_array[i]/an
      }
    }
    else {
      # Append any subsequent AFs (comma-separated)
      if (an == 0) {
        af = af "," 0 # Can't divide by 0
      }
      else {
        af = af "," ac_array[i]/an
      }
    }
  }

  # Set AC, AN, AF
  ac_an_af[1] = ac
  ac_an_af[2] = an
  ac_an_af[3] = af
}
