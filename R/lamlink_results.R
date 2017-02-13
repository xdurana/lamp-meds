library(data.table)
library(qqman)
library(dplyr)

analyze <- function(threshold=4, maf=0.4) {
  threshold <- 4
  maf <- 0.4
  directory <- sprintf('output/lung/assoc_10_%s_%s', threshold, maf)
  lamp <- fread(file.path(directory, 'assoc.ld.lamp'))
  lamplink <- fread(file.path(directory, 'assoc.ld.lamplink'))
  
  lamplink.comb <- lamplink %>%
    transform(COMB=rowSums(lamplink[, 10:ncol(lamplink)])) %>%
    filter(COMB > 0) %>%
    select(CHR, SNP, A1, A2, TEST, AFF, UNAFF, P, OR, COMB)
  
  write.csv2(lamplink.comb, file.path(directory, 'assoc.ld.lamp.comb.csv'), row.names = FALSE)
  
  lung_bim <- fread('data/lung/assoc_10_4/lung.bim')
  colnames(lung_bim) <- c('CHR', 'SNP', 'V3', 'BP', 'A1', 'A2')
  lamplink.comb.bim <- lamplink.comb %>% merge(lung_bim, all.x = TRUE)
  manhattan(lamplink.comb.bim)
}
