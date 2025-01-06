# Unsupervised_Artist_Analysis
Model Evaluation and Process Explanation
Our primary goal was to cluster songs based on their characteristics to identify patterns and groupings that provide meaningful insights. Initially, clustering songs using k-means directly on the original features (like tempo, loudness, etc.) did not yield significant correlations or patterns when visualized against any two variables. This lack of clear separation suggested that individual features alone were insufficient for clustering.

To address this, we implemented an ensemble-like method involving Principal Component Analysis (PCA) and k-means clustering. Here's how we refined the process:

1. Feature Grouping through PCA
Purpose: To reduce the dimensionality of the dataset and group similar features together based on their shared variance.

Process:

PCA was applied to the song features, transforming them into principal components (PCs).
The PCs captured the most significant patterns in the data, effectively grouping features that contribute to similar underlying trends.
Using k-means clustering on the PCA-transformed features, we assigned features to feature clusters, grouping them into interpretable components.
Outcome: The feature clusters revealed logical groupings, such as energy-related features (e.g., tempo, loudness) and structural features (e.g., harmony, complexity), which could be averaged to simplify song representation.

2. Averaging Features for Songs
Purpose: To represent songs in a reduced space defined by the grouped features, allowing for better clustering results.

Process:

For each song, we calculated the average value of the features within each feature cluster.
This produced a new dataset where each song was described by a smaller set of cluster-averaged features, rather than the original high-dimensional feature set.
Outcome: This step reduced noise and redundancy, ensuring that each song's representation focused on the most meaningful feature groupings.

3. Clustering Songs Based on Averaged Features
Purpose: To identify distinct clusters of songs with shared characteristics or "vibes."

Process:

K-means clustering was applied to the PCA-reduced and cluster-averaged features.
We selected the number of clusters (k = 4) based on an elbow plot of total within-cluster sum of squares (WSS), balancing model simplicity and interpretability.
Outcome: The resulting song clusters showed significant separation and clear groupings when visualized in the PCA space of the averaged features.

4. Visualizing the Results
Feature Clusters:

The grouped features in each cluster were analyzed for their shared characteristics.
For example, one cluster might represent energy-intensive features like tempo and loudness, while another might represent harmony and complexity.
Song Clusters:

Songs were visualized in the PCA space of the cluster-averaged features, revealing distinct clusters.
Each song cluster was described by its dominant characteristics, or "vibe," based on the features from the corresponding feature clusters.
Key Takeaways
Improved Interpretability:

The ensemble method of combining PCA and k-means clustering allowed us to reduce noise and focus on significant trends in the data.
This approach provided more meaningful groupings of songs, where each cluster captured a distinct musical "vibe."
Enhanced Clustering Results:

Directly clustering songs using the original features yielded no significant separation.
By grouping features into principal components and averaging them, we achieved clear and interpretable clusters.
Final Visualization:

The final visualization of songs in the PCA space of cluster-averaged features demonstrated well-separated clusters, validating the approach.
Conclusion
This ensemble-like approach highlights the power of combining dimensionality reduction (PCA) with clustering (k-means). By leveraging feature groupings and focusing on the most significant components, we were able to extract meaningful patterns from the data and cluster songs in a way that aligns with their underlying characteristics.
