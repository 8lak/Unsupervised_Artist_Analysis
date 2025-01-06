```{r}
library(tidyverse)
music <- read_csv("https://bcheggeseth.github.io/253_spring_2024/data/billboard.csv")

my_artist <- music %>% 
  filter(performer == "Beyonce") %>% 
  select(-performer) %>% 
  group_by(song) %>%      
  slice_sample(n = 1) %>% 
  ungroup()
my_artist <- my_artist %>% 
  column_to_rownames("song")


```
