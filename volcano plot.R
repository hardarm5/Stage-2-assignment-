#1b. Volcano plot of Differential expression results (chromosome 22)

#import the file
fileOnMyPc <- '~/R_doc/hbr_uhr_deg_chr22_with_significance.csv'
DEG_data <- read.delim(fileOnMyPc, header = T, sep = ',')

library(ggplot2)

#define color based on significance
color_values <- c("up" = "green", "down" = "orange", "ns" = "grey")

#creating volcano plot via ggplot
ggplot(DEG_data,
       aes(x = log2FoldChange,
           y = X.log10PAdj, colour = as.factor(significance)))+
  geom_point(size = 1, alpha = 1)+
  geom_vline(xintercept = c(-1,1), linetype = 'dashed', color = 'black', alpha = 0.5)+
  scale_color_manual(values = color_values)+
  labs(
    x = 'log2 Fold Change',
    y = '-log10 Adjusted P-value',
    color = 'significance status',
    title = 'Volcano PLOT HBR vs UHR',
  )+
  theme_minimal(
  )
