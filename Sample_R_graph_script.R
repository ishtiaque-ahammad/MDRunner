library(ggplot2)
library(RColorBrewer)
library(ggthemes)

RMSD <- read.csv("rmsd.csv", sep = ",", header = FALSE)
View(RMSD)
RMSF <- read.csv("rmsf.csv", sep = ",", header = FALSE)
View(RMSF)
Rg <- read.csv("gyrate.csv", sep = ",", header = FALSE)
View(Rg)
SASA <- read.csv("sasa.csv", sep = ",", header = FALSE)
View(SASA)

colnames(RMSD) <- c("Time (ns)", "Wild" , "C282Y")
View(RMSD)
colnames(RMSF) <- c("Residue", "Wild" , "C282Y")
View(RMSF)
colnames(Rg) <- c("Time (ps)", "Wild" , "C282Y")
View(Rg)
colnames(SASA) <- c("Time (ps)","Wild" , "C282Y")
View(SASA)

#RMSD Graph

rmsd_plot <- ggplot(RMSD, aes(x=RMSD$`Time (ns)`)) + 
  geom_line(aes(y = RMSD$`Wild`), color ="springgreen3")  +
  geom_line(aes(y = RMSD$`C282Y`), color ="darkgoldenrod1")  +
  labs(title = "Root Mean Square Deviation (RMSD)",
       subtitle = "Backbone after least square fit to Backbone",
       x = "Time (ns)",
       y = "RMSD (nm)") +
  theme_linedraw()+
  theme(plot.title = element_text(size = 50, face = "bold"),
        plot.subtitle = element_text(size = 30),
        axis.text=element_text(size=40),
        axis.title=element_text(size=40),
        plot.margin=unit(c(2,2,2,2),"cm"))
# Save the plot as a PNG image with 300 DPI
ggsave("RMSD_graph.png", plot = rmsd_plot, dpi = 300, width = 16, height = 12, units = "in")

#RMSF Graph
rmsf_plot <- ggplot(RMSF, aes(x=RMSF$Residue)) + 
  geom_line(aes(y = RMSF$`Wild`), color ="springgreen3")  +
  geom_line(aes(y = RMSF$`C282Y`), color ="darkgoldenrod1")  +
  labs(title = "Root Mean Square Fluctuation (RMSF)",
       x = "Residue",
       y = "RMSF (nm)") +
  theme_bw()+
  theme(plot.title = element_text(size = 50, face = "bold"),
        plot.subtitle = element_text(size = 30),
        axis.text=element_text(size=40),
        axis.title=element_text(size=40),
        plot.margin=unit(c(2,2,2,2),"cm"),
        legend.text = element_text())

# Save the plot as a PNG image with 300 DPI
ggsave("RMSf_graph.png", plot = rmsf_plot, dpi = 300, width = 16, height = 12, units = "in")

#Rg Graph

rg_plot <- ggplot(Rg, aes(x=Rg$`Time (ps)`)) + 
  geom_line(aes(y = Rg$`Wild`), color ="springgreen3")  +
  geom_line(aes(y = Rg$`C282Y`), color ="darkgoldenrod1")  +
  labs(title = "Radius of Gyration (total)",
       x = "Time (ps)",
       y = "Radius of Gyration (nm)") +
  theme_linedraw()+
  theme(plot.title = element_text(size = 50, face = "bold"),
        plot.subtitle = element_text(size = 30),
        axis.text=element_text(size=40),
        axis.title=element_text(size=40),
        plot.margin=unit(c(2,2,2,2),"cm"))
# Save the plot as a PNG image with 300 DPI
ggsave("Rg_graph.png", plot = rg_plot, dpi = 300, width = 16, height = 12, units = "in")

#SASA Graph
sasa_plot <-ggplot(SASA, aes(x=SASA$`Time (ps)`)) + 
  geom_line(aes(y = SASA$`Wild`), color ="springgreen3")  +
  geom_line(aes(y = SASA$`C282Y`), color ="darkgoldenrod1")  +
  labs(title = "Solvent Accessible Surface Area (SASA)",
       x = "Time (ps)",
       y = "Area (nm2)") +
  theme_linedraw()+
  theme(plot.title = element_text(size = 50, face = "bold"),
        plot.subtitle = element_text(size = 30),
        axis.text=element_text(size=40),
        axis.title=element_text(size=40),
        plot.margin=unit(c(2,2,2,2),"cm"))
# Save the plot as a PNG image with 300 DPI
ggsave("SASA_graph.png", plot = sasa_plot, dpi = 300, width = 16, height = 12, units = "in")