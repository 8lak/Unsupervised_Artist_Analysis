#PCA on features

pca_music <- prcomp(my_artist, scale = TRUE, center = TRUE)
pca_music %>% tidy(matrix = "eigenvalues")

#PCA on Songs(using clustered features)

song_pca <- prcomp(song_features, scale = TRUE)

ggplot(data = as.data.frame(song_pca$x), aes(x = PC1, y = PC2, color = as.factor(averaged_features$Cluster))) +
  geom_point(size = 3) +
  labs(title = "Song Clusters", x = "PC1", y = "PC2", color = "Cluster")
