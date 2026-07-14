### The BEGINNING ~~~~~
##
# ~ Plots PCA results. Written by George Pacheco.


# Cleans the environment ~ 
rm(list=ls())


# Loads libraries ~
library(ggplot2)
library(cowplot)
library(ggpubr)
library(extrafont)
library(showtext)
library(sysfonts)


# Activates extra fonts ~
font_add(family = "Optima",
         regular = "/home/sbbe26/conda/fonts/Optima.ttf",
         bold = "/home/sbbe26/conda/fonts/Optima_Bold.ttf",
         italic = "/home/sbbe26/conda/fonts/Optima_Italic.ttf",
         bolditalic = "/home/sbbe26/conda/fonts/Optima_Bold.ttf")


# Activayes showtext ~
showtext_auto()


# Loads the data ~
samples <- read.table("/home/sbbe26/Scripts/Admixture.popfile", stringsAsFactors = FALSE, sep = "\t")


# Reads the annotation file ~
ids <- read.table("/home/sbbe26/Scripts/Admixture.labels", stringsAsFactors = FALSE, sep = "\t", header = FALSE, col.names = c("Sample_ID"))


# Expands ids.auto by adding Population ~
ids$Population <-  ifelse(grepl("1", ids$Sample_ID), "Species A",
                   ifelse(grepl("2", ids$Sample_ID), "Species B",
                   ifelse(grepl("3", ids$Sample_ID), "Species C", "Error")))


# Creates data frame ~
fulldf <- data.frame()


# Reorder values
x <- list(c(3, 1, 4, 2),
          c(1, 2, 3),
          c(1, 2))


# Defines samples' IDs ~
sampleid = "Sample_ID"


# Loops over all Ks while adding labels and reordering clusters ~
for (j in 1:length(samples[,1])){
     data <- read.table(samples[j,1])[,x[[j]]]
     for (i in 1:dim(data)[2]) { 
     temp <- data.frame(Value = data[,i])
     temp$K <- as.factor(rep(i, times = length(temp$Value)))
     temp[sampleid] <- as.factor(ids[sampleid][,1])
     temp$K_Value <- as.factor(rep(paste("K = ", dim(data)[2], sep = ""), times = length(temp$Value)))
     temp <- merge(ids, temp)
     fulldf <- rbind(fulldf, temp)}}


# Defines the target to be plotted ~
target = "Population"


# Creates plot ~
ngsAdmix <-
  ggplot(fulldf, aes(x = Sample_ID, y = Value, fill = K)) +
  geom_bar(stat = "identity", width = .9) +
  scale_fill_manual(values = c("#7570b3", "#d95f02", "#1b9e77", "#fed9a6")) +
  facet_grid(K_Value ~ get(target), space = "free_x", scales = "free_x") +
  scale_x_discrete(expand = c(0, 0)) + 
  scale_y_continuous(expand = c(0, 0), breaks = NULL) +
  theme(panel.background = element_rect(fill = "#ffffff"),
        panel.grid.minor.x = element_blank(),
        panel.grid.major = element_blank(),
        panel.spacing = unit(.2, "lines"),
        plot.title = element_blank(),
        axis.title = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        strip.background = element_rect(colour = "#000000", fill = '#FAFAFA', linewidth = .05),
        strip.text.x = element_text(family = "Optima", colour = "#000000", face = "bold", size = 8, margin = margin(.1, 0, .1, 0, "cm")),
        strip.text.y = element_text(family = "Optima", colour = "#000000", face = "bold", size = 6, angle = 90, margin = margin(0, .1, 0, .1, "cm")),
        legend.position = "none")


# Saves plot ~
ggsave(ngsAdmix, file = "Admixture_Plot.pdf",
       device = cairo_pdf, width = 3, height = 3, scale = 1, dpi = 600)


#
##
### The END ~~~~~
