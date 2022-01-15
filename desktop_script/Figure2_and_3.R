library(ggplot2)
library(tidyverse)

setwd("/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/make_tpm_figure")

conserve_table = read.table("alfalfa_clover_conserved_tpm.txt",header = F)
specific_ann_table = read.table("alfalfa_clover_specific_tpm_with_annotation.txt",header = F)
specific_no_ann_table = read.table("alfalfa_clover_specific_tpm_with_no_annotation.txt",header = F)

colnames(conserve_table) = c("Gene_ID","tpm","plant")
colnames(specific_ann_table) = c("Gene_ID","tpm","plant")
colnames(specific_no_ann_table) = c("Gene_ID","tpm","plant")


conserve_table$logtpm = log10(conserve_table$tpm)
conserve_table$plant = factor(conserve_table$plant)
conserve_table$type = rep("Conserved Transcript",length(conserve_table[,1]))

specific_ann_table$logtpm = log10(specific_ann_table$tpm)
specific_ann_table$plant = factor(specific_ann_table$plant)
specific_ann_table$type = rep("Specific Transcript with Annotation",length(specific_ann_table[,1]))

specific_no_ann_table$logtpm = log10(specific_no_ann_table$tpm)
specific_no_ann_table$plant = factor(specific_no_ann_table$plant)
specific_no_ann_table$type = rep("Specific Transcript with No Annotation",length(specific_no_ann_table[,1]))

all_df = rbind(conserve_table,specific_ann_table,specific_no_ann_table)



alfalfa_combine_df_1 = conserve_table %>%
  filter(plant == "alfalfa")

alfalfa_combine_df_2 = specific_ann_table %>%
  filter(plant == "alfalfa")

alfalfa_combine_df_3 = specific_no_ann_table %>%
  filter(plant == "alfalfa")

clover_combine_df_1 = conserve_table %>%
  filter(plant == "clover")

clover_combine_df_2 = specific_ann_table %>%
  filter(plant == "clover")

clover_combine_df_3 = specific_no_ann_table %>%
  filter(plant == "clover")

alfalfa_combine_df = rbind(alfalfa_combine_df_1,alfalfa_combine_df_2,alfalfa_combine_df_3)
clover_combine_df = rbind(clover_combine_df_1,clover_combine_df_2,clover_combine_df_3)

#individual plot conserved transcript
ggplot(conserve_table,aes(x = plant, y= logtpm,fill = plant)) +
  geom_boxplot(position = position_dodge(width = 0.2), width = 0.5)+
  scale_fill_manual(values = c("#FABF7B","#6CB0D6"), name = "Plant", label = c(expression(italic("M. sativa")), expression(italic("M. officinalis"))))+
  theme(panel.background = element_rect(
    fill = "white",
    colour = "black",
    linetype = "solid",
  ), legend.position="bottom",axis.text.x = element_blank(),text = element_text(size=20))+
  xlab("Conserved Transcripts")+
  ylim(-2.5,5)+
  ylab("log10 TPM")+
  scale_x_discrete(expand=c(0,1))
  
#individual plot specific transcript with annotation
ggplot(specific_ann_table,aes(x = plant, y= logtpm,fill = plant)) +
  geom_boxplot(position = position_dodge(width = 0.2), width = 0.5)+
  scale_fill_manual(values = c("#FABF7B","#6CB0D6"), name = "Plant", label = c(expression(italic("M. sativa")), expression(italic("M. officinalis"))))+
  theme(panel.background = element_rect(
    fill = "white",
    colour = "black",
    linetype = "solid",
  ), legend.position="bottom",axis.text.x = element_blank(),text = element_text(size=20))+
  xlab("Specific Transcripts with Annotation")+
  ylim(-2.5,5)+
  ylab("log10 TPM")+
  scale_x_discrete(expand=c(0,1))


#individual plot specific transcript with no annotation
ggplot(specific_no_ann_table,aes(x = plant, y= logtpm,fill = plant)) +
  geom_boxplot(position = position_dodge(width = 0.2), width = 0.5)+
  scale_fill_manual(values = c("#FABF7B","#6CB0D6"), name = "Plant", label = c(expression(italic("M. sativa")), expression(italic("M. officinalis"))))+
  theme(panel.background = element_rect(
    fill = "white",
    colour = "black",
    linetype = "solid",
  ), legend.position="bottom",axis.text.x = element_blank(),text = element_text(size=20))+
  xlab("Specific Transcripts with No Annotation")+
  ylim(-2.5,5)+
  ylab("log10 TPM")+
  scale_x_discrete(expand=c(0,1))



#statistics
pairwise.wilcox.test(alfalfa_combine_df$logtpm,alfalfa_combine_df$type) # all < <2e-16 
pairwise.wilcox.test(clover_combine_df$logtpm,clover_combine_df$type)# all < <2e-16 

pairwise.wilcox.test(conserve_table$logtpm,conserve_table$plant) # <2e-16
pairwise.wilcox.test(specific_ann_table$logtpm,specific_ann_table$plant) #<2e-16
pairwise.wilcox.test(specific_no_ann_table$logtpm,specific_no_ann_table$plant) #<2e-16 



#Figure_2_version1
ggplot()+
  geom_boxplot(data = conserve_table,aes(x = type, y= logtpm,fill = plant))+
  geom_boxplot(data = specific_ann_table,aes(x = type, y= logtpm,fill = plant))+
  geom_boxplot(data = specific_no_ann_table,aes(x = type, y= logtpm,fill = plant))+
  scale_fill_manual(values = c("#FABF7B","#6CB0D6"), name = "Plant", label = c(expression(italic("M. sativa")), expression(italic("M. officinalis"))))+
  theme(panel.background = element_rect(
    fill = "white",
    colour = "black",
    linetype = "solid",
  ), legend.position="bottom",text = element_text(size=20))+
  ylab("log10 TPM")+
  annotate("text", x = 1, y = 5.6, label = "***", size = 5)+
  annotate("segment", x = 0.81, xend = 0.81, y = 5, yend = 5.5)+
  annotate("segment", x = 1.19, xend = 1.19, y = 4.5, yend = 5.5)+
  annotate("segment", x = 0.81, xend = 1.19, y = 5.5, yend = 5.5)+
  annotate("text", x = 2, y = 5.6, label = "***", size = 5)+
  annotate("segment", x = 1.81, xend = 1.81, y = 4.5, yend = 5.5)+
  annotate("segment", x = 2.19, xend = 2.19, y = 5, yend = 5.5)+
  annotate("segment", x = 1.81, xend = 2.19, y = 5.5, yend = 5.5)+
  annotate("text", x = 3, y = 5.6, label = "***", size = 5)+
  annotate("segment", x = 2.81, xend = 2.81, y = 4.2, yend = 5.5)+
  annotate("segment", x = 3.19, xend = 3.19, y = 4.5, yend = 5.5)+
  annotate("segment", x = 2.81, xend = 3.19, y = 5.5, yend = 5.5)


#Figure_2_version2
ggplot()+
  geom_boxplot(data = alfalfa_combine_df,aes(x="alfalfa", y= logtpm,fill = type))+
  geom_boxplot(data = clover_combine_df,aes(x="clover", y= logtpm,fill = type))+
  scale_fill_manual(values = c("#FABF7B","#6CB0D6","#7CCBA2"))+
  theme(panel.background = element_rect(
    fill = "white",
    colour = "black",
    linetype = "solid"),
    legend.position="bottom",text = element_text(size=20))+
  scale_x_discrete(labels = c(expression(italic("M. sativa")),expression(italic("M. officinalis"))))+
  ylab("log10 TPM")+
  xlab("Plant")+
  annotate("text", x = 0.87, y = 5.6, label = "***",size = 5)+
  annotate("segment", x = 0.75, xend = 0.75, y = 5, yend = 5.5)+
  annotate("segment", x = 0.99, xend = 0.99, y = 4.3, yend = 5.5)+
  annotate("segment", x = 0.75, xend = 0.99, y = 5.5, yend = 5.5)+
  annotate("text", x = 1.13, y = 5.1, label = "***",size = 5)+
  annotate("segment", x = 1.01, xend = 1.01, y = 4.3, yend = 5)+
  annotate("segment", x = 1.25, xend = 1.25, y = 4.3, yend = 5)+
  annotate("segment", x = 1.01,, xend = 1.25, y = 5, yend = 5)+
  annotate("text", x = 1.87, y = 5.6, label = "***",size = 5)+
  annotate("segment", x = 1.75, xend = 1.75, y = 4.3, yend = 5.5)+
  annotate("segment", x = 1.99, xend = 1.99, y = 5, yend = 5.5)+
  annotate("segment", x = 1.75,, xend = 1.99, y = 5.5, yend = 5.5)+
  annotate("text", x = 2.12, y = 5.4, label = "***",size = 5)+
  annotate("segment", x = 2.01, xend = 2.01, y = 5, yend = 5.3)+
  annotate("segment", x = 2.25, xend = 2.25, y = 4.5, yend = 5.3)+
  annotate("segment", x = 2.01,, xend = 2.25, y = 5.3, yend = 5.3)
  
 

#ortholog tpm scatter plot

ortholog_DEG_tpm_table = read.table("alfalfa_clover_tpm_scatter_DEG.txt",header = F)
ortholog_no_DGE_tpm_table = read.table("alfalfa_clover_tpm_scatter_not_DEG.txt",header = F)

colnames(ortholog_DEG_tpm_table) = c("alfalfa", "clover")
colnames(ortholog_no_DGE_tpm_table) = c("alfalfa", "clover")

ortholog_DEG_tpm_table$alfalfalog = log10(ortholog_DEG_tpm_table$alfalfa)
ortholog_DEG_tpm_table$cloverlog = log10(ortholog_DEG_tpm_table$clover)

ortholog_no_DGE_tpm_table$alfalfalog = log10(ortholog_no_DGE_tpm_table$alfalfa)
ortholog_no_DGE_tpm_table$cloverlog = log10(ortholog_no_DGE_tpm_table$clover)

all_ortholog_df = rbind(ortholog_DEG_tpm_table,ortholog_no_DGE_tpm_table)

ggplot()+
  geom_point(data = ortholog_no_DGE_tpm_table, aes(x = alfalfalog, y = cloverlog), colour = "black",shape = 21,fill = "grey",size = 1.4)+
  geom_point(data = ortholog_DEG_tpm_table, aes(x = alfalfalog, y = cloverlog), colour = "black", shape = 21, fill = "red", size = 1.4)+
  theme_bw()+
  xlab(expression(paste(italic("M. sativa"), " log10 TPM")))+
  ylab(expression(paste(italic("M. officinalis"), " log10 TPM")))+
  theme(text = element_text(size=20))+
  geom_smooth(method='lm', aes(x= all_ortholog_df$alfalfalog, y = all_ortholog_df$cloverlog), formula = y~x, colour = '#56B4E9')

  

