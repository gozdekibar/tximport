context("one_sample")
test_that("import one sample works", {

  library(readr)
  dir <- system.file("extdata", package="tximportData")
  samples <- read.table(file.path(dir,"samples.txt"), header=TRUE)
  files <- file.path(dir,"salmon", samples$run, "quant.sf.gz")
  names(files) <- paste0("sample",1:6)
  
  tx2gene <- read_csv(file.path(dir, "tx2gene.gencode.v27.csv"))
  
  txi <- tximport(files[1], type="salmon", tx2gene=tx2gene)
  expect_true(ncol(txi$counts) == 1)
  
})
