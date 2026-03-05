#Task 1: Distribution of Immune Cell Type by New Ratio
#load ggplot
library(ggplot2)

#import the file
fileOnMyPc <- '~/R_doc/hb_stage_2.xlsx'
library(readxl)
hb_data_2 <- read_excel(fileOnMyPc, sheet = 'a')

#using ggplot
ggplot(hb_data_2, aes(x = cell_type, y = new_ratio, fill = cell_type))+
  geom_boxplot(outlier.colour = 'black', outlier.size = 2)+
  labs(x = 'Immune Cell Type',
       y = 'New Ratio',
       title = 'Distribution of Immune Cell Type by New Ratio')+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#Task 2: Reproduce panel 2b: Half-life vs alpha-life scatter
#reading sheet b
hb_task_2b <- read_excel(fileOnMyPc, sheet = 'b')

#using plot for scatter plot
plot(log2(hb_task_2b$half_life),
     log2(hb_task_2b$alpha),
     cex = 0.15,
     col = 1,
     ylim = c(-10, 0),
     xlim = c(-1, 5),
     xlab = 'log2(Half Life)',
     ylab = 'log2(Alpha)',
     main = 'Half-life vs Alpha-life Scatter Plot',
)

cut_1 <- subset(hb_task_2b, log2(half_life)>2.5)
cut_2 <- subset(hb_task_2b, log2(alpha)>-3.5)
cut_3 <- subset(hb_task_2b, log2(half_life)>2.5, log2(alpha)>-3.5)

points(log2(cut_1$half_life),
       log2(cut_1$alpha),
       cex = 0.3,
       col = 4)

points(log2(cut_2$half_life),
       log2(cut_2$alpha),
       cex = 0.15,
       col = 3)

points(log2(cut_3$half_life),
       log2(cut_3$alpha),
       cex = 0.3,
       col = 4)

abline(v = 2.5, lty = 2)
abline(h = -3.5, lty = 2)
            
label_hb_task_2b <- subset(hb_task_2b, cell %in% c('Camp', 'Ccr2'))
text(x = log2(label_hb_task_2b$half_life),
     y = log2(label_hb_task_2b$alpha),
     cex = 1,
     col = 'black',
     labels = label_hb_task_2b$cell)



#Task 3: Reproduce panel 2c: Heatmap across cell types and time

#reading sheet c
hb_task_2c <- read_excel(fileOnMyPc, sheet = 'c')

print(hb_task_2c)
#pheatmap
library(pheatmap)
#creating column annotation
#extract the cell type and time
col_info <- data.frame(row.names = colnames(hb_task_2c))

# Extract Time
col_info$Time <- factor(substr(rownames(col_info), 
                               nchar(rownames(col_info)) - 3, 
                               nchar(rownames(col_info))))

# Extract CellType (everything before the time)
col_info$CellType <- factor(substr(rownames(col_info), 1, 
                                   nchar(rownames(col_info)) - 4))
##indexing the columns with only numbers

normalized_hb_2c <- hb_task_2c[2:50] 

# Generate the Heatmap
pheatmap(mat = normalized_hb_2c,
         border_color = "white",
         annotation_col = col_info,
         cluster_rows = T, # Groups the genes with similar trends
         cluster_cols = F, #But keep the time order
         show_colnames = F,
         show_rownames = F,
         )


#Task 4: Pathway enrichment heatmap
#Read sheet d_1
read_excel(fileOnMyPc, sheet = 'd_1')
hb_task_2d_1 <- read_excel(fileOnMyPc, sheet = 'd_1')

#indexing only columns with numbers
normalized_hb_2d_1 <- hb_task_2d_1[2:8]

#generating pheatmap
pheatmap(normalized_hb_2d_1,
         border_color = 'white',
         cluster_rows = F,
         cluster_cols = F,
         show_rownames = T,
         labels_row = hb_task_2d_1$pathway,
         fontsize_row = 8,
         color = colorRampPalette(c('red', 'white', 'blue'))(100),
         main = 'Pathway Enrichment Heatmap Over Time')


#Task 5: Bubble plot of kinetic regimes
read_excel(fileOnMyPc, sheet = 'e')
hb_task_2e <- read_excel(fileOnMyPc, sheet = 'e')

library(ggplot2)
#using ggplot2
ggplot(hb_task_2e, aes(x = half_life, y = alpha, 
                       colour = stage, size = count))+
geom_point(alpha = 1)+
  labs(x = 'Half Life',
       y = 'Alpha',
       title = 'Bubble plot of kinetic regimes',
       colour = 'Stage',
       size = 'Count'
    )+
  scale_size_continuous(range = c(2,7))+
theme_minimal()


#Task 6. Stacked proportions
read_excel(fileOnMyPc, sheet = 'f')
hb_task_2f <- read_excel(fileOnMyPc, sheet = 'f')

install.packages("dplyr")
library(dplyr)
#Creating multiple categories
#B vs Plasma cell proportions over time
multiple_hb_2f <- hb_task_2f%>%
  filter(cell_type %in% c('Plasma', 'B'))%>%
  filter(stage %in% c('s00h', 's72h'))

#generating the plot
ggplot(multiple_hb_2f, aes(x = stage, y = proportion, fill = cell_type))+
  geom_bar(stat = 'identity', width = 0.8, 
           position = position_stack(reverse = T))+
  scale_y_continuous(limits = c(0,0.3))+
  labs(
    x = 'Stage',
    y = 'Proportion',
    title = 'B vs Plasma cell proportions over time',
    subtitle = 'Comparison Between s00h and s72h',
    fill = 'Cell type')+
  theme_classic()


#Task 7: Directed cell–cell interaction network
read_excel(fileOnMyPc, sheet = 'g')
hb_task_2g <- read_excel(fileOnMyPc, sheet = 'g')

#convert to adjacency matrix
matx_task_2g <- as.matrix(hb_task_2g[2:8])

#Build directed graph
library(igraph)
graph_2g <- graph_from_adjacency_matrix(matx_task_2g,
                            mode = 'directed',
                            weighted = T,
                            diag = F)

#Removing zero-weight edges so the plot is neat
graph_2g <- delete.edges(graph_2g, E(graph_2g)[weight == 0])

#plotting using igraph
plot(graph_2g,
     layout = layout_with_fr(graph_2g),
     vertex.color = "pink",            # Node color
     vertex.label.color = "navy",     # Label color
     vertex.size = 20,                 # Node size
     edge.color = "gray70",
     main = "Cell-to-Cell Communication Network")

     