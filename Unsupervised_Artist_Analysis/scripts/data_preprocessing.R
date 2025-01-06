```{r}
library(tidyverse)
music <- read_csv("https://bcheggeseth.github.io/253_spring_2024/data/billboard.csv")

music %>% 
  count(performer) %>% 
  filter(n >= 25) %>% 
  select(performer)


```

```{r}
my_artist <- music %>% 
  filter(performer == "Beyonce") %>% 
  select(-performer) %>% 
  group_by(song) %>%      
  slice_sample(n = 1) %>% 
  ungroup()

```

```{r}
my_artist <- my_artist %>% 
  column_to_rownames("song")


```
