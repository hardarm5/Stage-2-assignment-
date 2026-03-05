**Part 1 - Gene Expression Analysis**

1a. **Heatmap**

\# Step 1: Load the necessary library in R library(pheatmap)

\# Step 2: importing the Normalized counts for HBR vs UHR samples data

Using: fileOnMyPc <- '~/R_doc/hbr_uhr_top_deg_normalized_counts.csv'

\# Step 3: Read the data

normalized_data <- read.delim(fileOnMyPc, header = T, sep = ',')

Step 4: #indexing the columns with only numbers

Step 5: #converting the data into a matrix

Step 6: Generate the clustered heatmap

\# cluster_rows = TRUE: Groups genes with similar expression patterns.

\# cluster_cols = TRUE: Groups samples (HBR vs UHR) based on similarity.

**b. Volcano Plot**

**\# Step 1: Load the necessary library (ggplot2)**

Step 2: Import the file

Step 3: Read the file

Step 4: define color based on significance

Step 5: create volcano plot via ggplot

Step 6: Add dashed vertical lines at log2FoldChange = ±1

Step 7: Customize colors and labels

Step 8: Add a clean theme

**Part 2 - Breast Cancer Data Exploration**

**c. Scatter Plot (radius vs texture)**

Step 1: Load libraries library(ggplot2)

Step 2: Read the breast cancer dataset

Step 3: Plot texture_mean vs radius_mean using ggplot.

This plot visualizes whether there is a relationship between the size (radius) and the surface consistency (texture) of the cell nuclei, grouped by the diagnosis.

d. Correlation Heatmap

# indexing the needed columns

# computing correlation coefficient: this calculates the Pearson correlation coefficient between all pairs (values between -1 and 1).

Using pheatmap, create the correlation graph.

e. Scatter Plot (Smoothness vs Compactness)

using ggplot # Plot compactness_mean vs smoothness_mean

f. Density Plot (Area Distribution)

using ggplot, Plot kernel density estimates (KDE) of area_mean

**geom_density()**: Calculates and draws the KDE.

**fill = diagnosis**: Creates two separate, overlapping shapes-one for Benign and one for Malignant.

**alpha = 0.3**: Makes the density shapes semi-transparent so you can see where the distributions overlap.

**Part 3:**

**Task 1. Reproduce panel 2a: Cell-type ratio distributions**

Step 1: Load the necessary library

Step 2: Read the data

Step 3: Create the Boxplot using ggplot

\# Outlier visibility: geom_boxplot automatically shows outliers as dots. # We can customize them using outlier.colour and outlier.shape.

Step 4: Labels and Scaling

Step 5: Orientation (Rotated Labels) # angle = 45 rotates the text, and hjust = 1 aligns them to the axis ticks correctly

**Task 2. Reproduce panel 2b: Half-life vs alpha-life scatter**

Step 1: reading sheet b

Step 2: using plot for scatter plot

Step 3: Define Cutoffs using the function 'subset()'

Step 4: Overlaying Highlighted Points using the points function

Step 5: Adding Threshold Lines using the abline() function

Step 6: Labeling Specific Genes (Exemplars)

**Task 3. Reproduce panel 2c: Heatmap across cell types and time**

Step 1: Read Sheet C

Step 2: using pheatmap, library(pheatmap)

Step 3: Creating column annotation

Step 4: extract the cell type and time

Step 5: Prepare the Matrix # pheatmap requires a numeric matrix

Step 6: Generate pheatmap

**Task 4. Reproduce panel 2d: Pathway enrichment heatmap**

Step 1: Load libraries library(pheatmap)

Step 2: Read sheet 'd_1'

Step 3: indexing only columns with numbers

Step 4: generating pheatmap

**Task 5. Reproduce panel 2e: Bubble plot of kinetic regimes**

Step 1: Load the plotting library library(ggplot2)

Step 2: Read the data from sheet 'e'

Step 3: Create the Bubble Plot

Step 4: Add points with transparency, alpha = 1 prevents overlapping bubbles from hiding each other

Step 5: Customize the size range. This ensures the bubbles are large enough to be seen clearly

Step 6: Add Labels and Theme

**Task 6. Reproduce panel 2f: Stacked proportions**

1\. Load libraries library(ggplot2) library(dplyr)

2\. Read the data (Sheet f)

3\. Subset and Filter. We only want 'B' and 'Plasma' cells at the start (s00h) and end (s72h)

4\. Create the Stacked Barplot.Stat="identity" tells ggplot to use the actual values in the 'proportion' column. Position="stack" (the default) places one category on top of the other

5\. Fix the y-axis. This ensures the comparison is fair and matches the requirement

6\. Styling and Labels

**Task 7. Reproduce panel 2g: Directed cell-cell interaction network**

- Load igraph: library(igraph)
- Read sheet 'g'
- convert to adjacency matrix
- Build a directed graph
- Removing zero-weight edges so the plot is neat using delete.edges
- plotting using igraph

**Task 8. Final assembly (mandatory)**

<https://drive.google.com/file/d/1fn31dg7xXrn-8dMiTm1c3pspErjscWOV/view?usp=drivesdk>
