library(data.table)
library(dplyr)

lamp_icd <- function(icd) {
  
  file.all <- 'data/conditions/all.csv'
  file.dat <- 'data/conditions/data.csv'
  file.val <- 'data/conditions/values.csv'
  file.log <- 'output/conditions/conditions-lamp.log'
  file.out <- 'output/conditions/conditions-lamp.csv'
  file.eut <- 'output/conditions/conditions-lamp-purged.csv'
  
  ds <- fread(file.all)
  
  ds %>%
    select(-matches(icd)) %>%
    write.table(file.dat, row.names = FALSE, quote = FALSE, sep = ',')
    
  ds %>%
    select(id, matches(icd)) %>%
    write.table(file.val, row.names = FALSE, quote = FALSE, sep = ',')

  system(sprintf("sed -i '1s/^/#/' %s", file.val))
  
  system(sprintf('python bin/lamp/lamp.py -p fisher %s %s 0.05 -e %s > %s',
    file.dat,
    file.val,
    file.log,
    file.out
  ))
  
  system(sprintf('python bin/lamp/eliminate_comb.py %s > %s',
    file.out,
    file.eut
  ))
}