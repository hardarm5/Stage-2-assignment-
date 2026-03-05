#Part 1 – Gene Expression Analysis
#1a. clustered Heatmap of the top DEGs between HBR Vs UHR

#importing the  Normalized counts for HBR vs UHR samples data
fileOnMyPc <- '~/R_doc/hbr_uhr_top_deg_normalized_counts.csv'
normalized_data <- read.delim(fileOnMyPc, header = T, sep = ',')

#heatmap
library(pheatmap)
colnames(normalized_data[2:7]) #indexing the columns with only numbers
pheatmap(mat = normalized_data[2:7], #converting the data into a matrix
         border_color = 'white',
         labels_row = normalized_data$X,
         cluster_rows = T,
         cluster_cols = T,
         main = 'clustered Heatmap of the top DEGs between HBR Vs UHR',
         color = blues9)

