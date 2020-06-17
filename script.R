library(stringr)
library(dplyr)

x <- c("why", "video", "cross", "extra", "deal", "authority")
d = tibble(x) %>%
  mutate(l = str_length(x))
d
