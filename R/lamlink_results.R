library(data.table)

analyze <- function(threshold=4, maf=0.5) {
  threshold <- 4
  maf <- 0.4
  directory <- sprintf('output/lung/assoc_10_%s_%s', threshold, maf)
  lamp <- fread(file.path(directory, 'assoc.ld.lamp'))
  lamplink <- fread(file.path(directory, 'assoc.ld.lamplink'))
  
  lamplink.comb <- lamplink %>%
    transform(COMB=rowSums(lamplink[, 10:ncol(lamplink)])) %>%
    filter(COMB > 0) %>%
    select(CHR, SNP, A1, A2, TEST, AFF, UNAFF, P, OR, COMB)
  
}