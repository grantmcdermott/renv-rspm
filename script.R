library(stringr)
library(data.table)

x <- c("why", "video", "cross", "extra", "deal", "authority")
d = data.table(x)
d[, l := str_length(x)][]
