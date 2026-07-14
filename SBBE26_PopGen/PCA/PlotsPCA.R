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


# Reads PCA results ~
eigenvec <- read.table("tutorial_pruned_PCA.eigenvec", header = FALSE, stringsAsFactors = FALSE)
colnames(eigenvec)[1:5] <- c("FID", "IID", "PC1", "PC2", "PC3")


# Expands eigenvecs by adding Population ~
eigenvec$Population <-  ifelse(grepl("1", eigenvec$FID), "A",
                        ifelse(grepl("2", eigenvec$FID), "B",
                        ifelse(grepl("3", eigenvec$FID), "C", "Error")))


# Reads PC values ~
eigenval <- read.table("tutorial_pruned_PCA.eigenval", header = FALSE)
colnames(eigenval) <- c("Values")


# Creates legend plot ~
MyLegend_Plot <-
  ggplot(eigenvec, aes_string(x = "PC1", y = "PC2", fill = "Population")) +
  geom_point(alpha = .9, size = 2.75, shape = 21, colour = "#000000") +
  scale_fill_manual(values = c("#7570b3", "#d95f02", "#1b9e77")) +
  theme(legend.position = "top",
        legend.key = element_blank(),
        legend.background = element_blank(),
        legend.margin = margin(t = 0, b = 0, r = 15, l = 15),
        legend.box = "vertical",
        legend.box.margin = margin(t = 20, b = 30, r = 0, l = 0)) +
  guides(fill = guide_legend(title = "Species", title.theme = element_text(family = "Optima", size = 16, face = "bold"),
                             label.theme = element_text(family = "Optima", size = 15),
                             override.aes = list(size = 5, stroke = .15)),
         colour = "none")


# Gets Eigenvalues of each Eigenvectors ~
PCA_Eigenval_Sum <- sum(eigenval$Values)
(eigenval$Values[1]/PCA_Eigenval_Sum)*100
(eigenval$Values[2]/PCA_Eigenval_Sum)*100
(eigenval$Values[3]/PCA_Eigenval_Sum)*100


# Creates plot ~
PC_12_Plot <-
  ggplot(eigenvec, aes_string(x = "PC1", y = "PC2", fill = "Population")) +
  geom_point(alpha = .9, size = 2.75, shape = 21, colour = "#000000") +
  scale_fill_manual(values = c("#7570b3", "#d95f02", "#1b9e77")) +
  scale_x_continuous("PC 1 (21.3%)",
                     breaks = c(-.4, -.2, 0, .2, .4),
                     labels = c("-0.4", "-0.2", "0", "0.2", "0.4"),
                     limits = c(-.45, .45),
                     expand = c(0, 0)) +
  scale_y_continuous("PC 2 (15.75%)",
                     breaks = c(-.4, -.2, 0, .2, .4),
                     labels = c("-0.4", "-0.2", "0", "0.2", "0.4"),
                     limits = c(-.45, .45),
                     expand = c(0, 0)) +
  theme(panel.background = element_rect(fill = "#ffffff"),
        panel.border = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.grid.major = element_blank(),
        legend.position = "none",
        axis.title.x = element_text(family = "Optima", size = 16, face = "bold", margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(family = "Optima", size = 16, face = "bold", margin = margin(t = 0, r = 20, b = 0, l = 0)),
        axis.text = element_text(family = "Optima", color = "#000000", face = "bold", size = 13),
        axis.ticks = element_line(color = "#000000", linewidth = 0.3),
        axis.line = element_line(colour = "#000000", linewidth = 0.3))


# Creates plot ~
PC_13_Plot <-
  ggplot(eigenvec, aes_string(x = "PC1", y = "PC3", fill = "Population")) +
  geom_point(alpha = .9, size = 2.75, shape = 21, colour = "#000000") +
  scale_fill_manual(values = c("#7570b3", "#d95f02", "#1b9e77")) +
  scale_x_continuous("PC 1 (21.3%)",
                     breaks = c(-.4, -.2, 0, .2, .4),
                     labels = c("-0.4", "-0.2", "0", "0.2", "0.4"),
                     limits = c(-.45, .45),
                     expand = c(0, 0)) +
  scale_y_continuous("PC 3 (10.9%)",
                     breaks = c(-.4, -.2, 0, .2, .4),
                     labels = c("-0.4", "-0.2", "0", "0.2", "0.4"),
                     limits = c(-.45, .45),
                     expand = c(0, 0)) +
  theme(panel.background = element_rect(fill = "#ffffff"),
        panel.border = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.grid.major = element_blank(),
        legend.position = "none",
        axis.title.x = element_text(family = "Optima", size = 16, face = "bold", margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(family = "Optima", size = 16, face = "bold", margin = margin(t = 0, r = 20, b = 0, l = 0)),
        axis.text = element_text(family = "Optima", color = "#000000", face = "bold", size = 13),
        axis.ticks = element_line(color = "#000000", linewidth = 0.3),
        axis.line = element_line(colour = "#000000", linewidth = 0.3))


# Isolates legend ~
MyLegend <- get_legend(MyLegend_Plot)


# Gets final plot ~
PCA_Plot <- ggarrange(PC_12_Plot, PC_13_Plot, nrow = 2, legend.grob = MyLegend, legend = "top")


# Saves plot ~
ggsave(PCA_Plot, file = "PCA_Plot.pdf",
       device = cairo_pdf, scale = 1, width = 12, height = 8, dpi = 600)


#
##
### The END ~~~~~
