library(dplyr)
library(ggplot2)
library(cluster)
library(factoextra)
library(readr)
library(gridExtra)

data <- read_csv("css.csv")

str(data)
head(data)
colnames(data)

data$Gender <- as.factor(data$Gender)
data$GenderNum <- as.numeric(data$Gender)

features <- data %>% select(`Age`, `Annual Income (k$)`, `Spending Score (1-100)`)

scaled_features <- scale(features)

set.seed(123)
fviz_nbclust(scaled_features, kmeans, method = "wss")+
  labs(title = "Elbow Method for Optimal K")

set.seed(123)
k <- 5
km_model <- kmeans(scaled_features, centers=k, nstart=25)
data$Cluster <- as.factor(km_model$cluster)

pca <- prcomp(scaled_features)
pca_df <- as.data.frame(pca$x[,1:2])
pca_df$Cluster <- data$Cluster

ggplot(pca_df, aes(PC1, PC2, color=Cluster)) +
  geom_point(size=3, alpha = 0.7)+
  labs(title = "Customer Segmentation (K-Means Clustering)",
       x= "Principal Component1",
       y= "Principal Component2")+
  theme_minimal() +
  scale_color_brewer(palette = "Set2")

data %>%
  group_by(Cluster)%>%
  summarise(
    Count = n(),
    Avg_Age = round(mean(Age),1),
    Avg_Income = round(mean(Income),1),
    Avg_Score = round(mean(SpendingScore),1),
    Gender_Mix = paste(round(prop.table(table(Gender))*100,1),"%", collapse= ", ")
  )
  


