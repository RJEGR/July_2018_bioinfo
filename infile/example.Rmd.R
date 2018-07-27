
dir <- c("/Users/cigom/Documents/GitHub/July_2018_bioinfo/infile/")
setwd(dir)

x <- read.table("diffExpr.P1e-2_C1.matrix")
str(x)


library(ggpubr)
library(superheat)
library(reshape)
library(ggplot2)


# plot heatmap of diffExp genes
superheat(x,
          # retain original order of rows/cols
          pretty.order.rows = TRUE,
          pretty.order.cols = TRUE,
          #row.dendrogram = T,
          #left.label = "none",
          bottom.label.text.angle = 0,
          #membership.rows = z$Temperature,
          row.title = "Differential Expressed",
          column.title = "Samples")


# plot with more than 1 factor
ggpubr::ggbarplot(x, x="Gene", 
                  y="Expression", 
                  add= c("mean_sd", "jitter"), 
                  color = "Temperature",
                  palette =c("#00AFBB", "#E7B800", "#FC4E07")) + 
  facet_grid(Temperature~Condition) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# plot annotation
library(trinotateR)




