#No 1: Texture mean Vs Radius Mean

#load ggplot
library(ggplot2)

#import file
fileOnMyPc <- '~/R_doc/Breast_CA_data-3.csv'
read.delim(fileOnMyPc, header = T, sep = ',')
breast_CA <- read.delim(fileOnMyPc, header = T, sep = ',')

#ggplot
ggplot(breast_CA, aes(x = radius_mean, y = texture_mean, color = diagnosis))+
  geom_point(size = 1, alpha = 1)+
  labs(title = 'Texture Mean Vs Radius Mean',
       x = 'Radius Mean',
       y = 'texture Mean')+
  theme_classic()


#No 2: Correlation heatmap

#indexing the needed coloumns
breast_data <- breast_CA[, 3:8]

#computing correlation coefficient
breast_matrix <- cor(breast_data)
print(breast_matrix)

pheatmap(mat = breast_matrix,
         border_color = 'black',
         legend = T,
         cluster_rows = F,
         cluster_col = F,
         color = blues9,
         title = 'Correlation Heatmap',
         display_numbers = T)



#No 3: Scatter Plot (smoothness vs compactness)

ggplot(breast_CA, aes(x = smoothness_mean, y = compactness_mean, 
                      color = diagnosis))+
  geom_point(size = 1, alpha = 0.5)+
  labs(x = 'Smoothness Mean',
       y = 'Compactness Mean',
       title = 'Smoothness Mean Vs Compactness Mean')+
  theme_light()


#No 4: kernel density estimates (KDE) of area_mean

ggplot(breast_CA, aes(x = area_mean, fill = diagnosis))+
  geom_density(alpha = 0.3, size = 0.2)+
  labs(title = 'kernel Density Estimates (KDE) of Area_mean by Diagnosis',
       x = 'Area Mean',
       y = 'Density',
       fill = 'Diagnosis',
       )+
  theme_classic()




