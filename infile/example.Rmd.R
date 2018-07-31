
dir <- c("/Users/cigom/Documents/GitHub/July_2018_bioinfo/infile/")
setwd(dir)

x <- read.table(paste0(dir,"diffExpr.P1e-2_C1.matrix2"))
str(x)

load("/Users/cigom/Documents//time0/edgeR.11759.dir/diffExpr.P1e-2_C1.matrix.RData")

tmp <- new.env()
load(file="/Users/cigom/Documents//time0/edgeR.11759.dir/diffExpr.P1e-2_C1.matrix.RData", env=tmp)
# ls(env=tmp)
test <- tmp$data


library(ggpubr)
library(superheat)
library(reshape)
library(ggplot2)


# plot heatmap of diffExp genes
superheat(data,
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
y <- read_trinotate("Trinotate.xls")
summary_trinotate(y)


y1 <- split_pfam(y)
head(y1,3)[,c(2,4:7)]

y2 <- summary_pfam(x1)
head(y2[order(-y2$transcripts),])

y2 <- summary_pfam(y1)
head(y2[order(-y2$transcripts),])
attr(y2, "count")


library(DT)
z <- data.frame(y2)
z$pfam <- paste0('<a href="http://pfam.xfam.org/family/', z$pfam, '">', z$pfam, '</a>')
datatable(z , escape=1, options = list( pageLength = 10 ) )


# melting files

x <- melt(z, id.vars = c("Temperature", "Condition"),
          #measure.vars = c("Hif1α", "Hsp70", "Hsp90", "GPx", "cMnSOD", "Na-K ATPasa"),
          value.name= "expression", variable_name = "Name")

colnames(x)[c(3:4)] <- c("Gene", "Expression")



split_blast2 <- function (x, hit = "sprot_Top_BLASTX_hit") 
{
  y <- x[!is.na(get(hit)), .(get(hit), gene_id, transcript_id, 
                             prot_id)]
  z <- strsplit(y$V1, "`")
  n <- sapply(z, length)
  z <- strsplit(unlist(z), "\\^")
  if (any(sapply(z, "[", 1) != sapply(z, "[", 2))) 
    print("WARNING: check different values in columns 1 and 2")
  NAME <- gsub("^RecName: Full=", "", sapply(z, "[", 6))
  NAME <- gsub("SubName: Full=", "", NAME)
  NAME <- gsub(";$", "", NAME)
  NAME <- gsub(" \\{[^}]+}", "", NAME)
  x1 <- data.frame(gene = rep(y$gene_id, n), transcript = rep(y$transcript_id, 
                                                              n), protein = rep(gsub(".*\\|", "", y$prot_id), n), uniprot = sapply(z, 
                                                                                                                                   "[", 1), align = sapply(z, "[", 3), identity = as.numeric(gsub("%ID", 
                                                                                                                                                                                                  "", sapply(z, "[", 4))), evalue = as.numeric(gsub("E:", 
                                                                                                                                                                                                                                                    "", sapply(z, "[", 5))), name = NAME, lineage = sapply(z, 
                                                                                                                                                                                                                                                                                                           "[", 7), domain = gsub("; .*", "", sapply(z, "[", 7)), 
                   genus = gsub(".*; ", "", sapply(z, "[", 7)), stringsAsFactors = FALSE)
  message(nrow(x1), " ", hit, " annotations")
  data.table(x1)
}






