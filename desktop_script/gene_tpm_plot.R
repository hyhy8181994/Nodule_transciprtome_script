library(ggplot2)


setwd("/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm")

alfalfa_conserve = read.table("conserved_alfalfa_raw_tpm_.txt")
clover_conserve = read.table("conserved_clover_raw_tpm_.txt")
alfalfa_specific = read.table("specific_alfalfa_raw_tpm_.txt")
clover_specific = read.table("specific_clover_raw_tpm_.txt")

alfalfa_total = read.table("alfalfa_tpm_descend_with_annotation.txt", sep = "\t")
clover_total = read.table("clover_tpm_descend_with_annotation.txt", sep = "\t")

box_df_1 = data.frame(alfalfa_conserve = unlist(alfalfa_conserve))
box_df_2 = data.frame(clover_conserve = unlist(clover_conserve))
box_df_3 = data.frame(alfalfa_specific = unlist(alfalfa_specific))
box_df_4 = data.frame(clover_specific = unlist(clover_specific))

#median
alfalfa_median_conserved = median(box_df_1$alfalfa_conserve) #13.58347
alfalfa_median_specific = median(box_df_3$alfalfa_specific)  #1.411849
clover_median_conserved = median(box_df_2$clover_conserve) #15.39
clover_median_specific = median(box_df_4$clover_specific) #1.55655

alfalfa_mean_conserved = mean(box_df_1$alfalfa_conserve) #2310.993
alfalfa_mean_specific = mean(box_df_3$alfalfa_specific)  #7713.779
clover_mean_conserved = mean(box_df_2$clover_conserve) #2208.363
clover_mean_specific = mean(box_df_4$clover_specific) #5896.942


box_df_1$alfalfa_conserve = log10(box_df_1$alfalfa_conserve)
box_df_2$clover_conserve = log10(box_df_2$clover_conserve)
box_df_3$alfalfa_specific = log10(box_df_3$alfalfa_specific)
box_df_4$clover_specific = log10(box_df_4$clover_specific)


alfalfa_compare_df = data.frame(tpm = box_df_1$alfalfa_conserve,
                                type = rep("conserve",length(box_df_1$alfalfa_conserve)))
alfalfa_compare_df = rbind(alfalfa_compare_df,data.frame(tpm = box_df_3$alfalfa_specific,
                                                         type = rep("specific",length(box_df_3$alfalfa_specific))))
wilcox.test(tpm~type,data = alfalfa_compare_df) #p-value < 2.2e-16

clover_compare_df = data.frame(tpm = box_df_2$clover_conserve,
                                type = rep("conserve",length(box_df_2$clover_conserve)))
clover_compare_df = rbind(alfalfa_compare_df,data.frame(tpm = box_df_4$clover_specific,
                                                         type = rep("specific",length(box_df_4$clover_specific))))
wilcox.test(tpm~type,data = clover_compare_df) #p-value < 2.2e-16

ggplot()+
  geom_boxplot(data = box_df_1,aes("alfalfa conserve",box_df_1$alfalfa_conserve),color = "black",fill = "#FABF7B")+
  geom_boxplot(data = box_df_2,aes("clover conserve",box_df_2$clover_conserve), color = "black",fill = "#6CB0D6")+
  geom_boxplot(data = box_df_3,aes("alfalfa specific",box_df_3$alfalfa_specific),color = "black",fill = "#FABF7B")+
  geom_boxplot(data = box_df_4,aes("clover specific",box_df_4$clover_specific),color = "black",fill = "#6CB0D6")+
  ylab("log10 TPM")+
  xlab("gene") +
  theme_classic()+
  theme(text = element_text(size=20))+
  ylim(-3,7)+
  annotate("text", x = 1.5, y = 6.2, label = "***")+
  annotate("segment", x = 1, xend = 1, y = 5, yend = 6)+
  annotate("segment", x = 2, xend = 2, y = 5.2, yend = 6)+
  annotate("segment", x = 1, xend = 2, y = 6, yend = 6)+
  annotate("text", x = 3.5, y = 6.2, label = "***")+
  annotate("segment", x = 3, xend = 3, y = 5, yend = 6)+
  annotate("segment", x = 4, xend = 4, y = 5.2, yend = 6)+
  annotate("segment", x = 3, xend = 4, y = 6, yend = 6)
