#Grouped features by components
kmeans_model <- kmeans(scale(pca_music$rotation), centers = 4)

variable_clusters <- tibble(
  Variable = names(kmeans_model$cluster),
  Cluster = kmeans_model$cluster
)

averaged_features <- my_artist %>%
  rownames_to_column(var = "Song") %>%
  pivot_longer(-Song, names_to = "Variable", values_to = "Value") %>%
  left_join(variable_clusters, by = "Variable") %>%
  group_by(Song, Cluster) %>%
  summarize(Average = mean(Value), .groups = "drop") %>%
  pivot_wider(names_from = Cluster, values_from = Average, names_prefix = "Cluster_")

#Grouped Songs by clustered features

song_kmeans <- kmeans(scale(song_features), centers = 4)

averaged_features <- averaged_features %>%
  mutate(Cluster = song_kmeans$cluster)
