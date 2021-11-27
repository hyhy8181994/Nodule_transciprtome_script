library("DESeq2")

setwd("/home/rui-huang/Documents/RNA_seq_doc/deseq2")

#load one-to-one ortholog transcript count and length infomation
input_table = read.table("onetoone_ortholog_file.txt",header = TRUE)
length_table_raw = read.table("ortholog_length.txt",header = TRUE)

#reformat the data based on deseq2 requirement
length_table = round(as.matrix(length_table_raw[,2:7]))
row.names(length_table) = length_table_raw[,1]
input_table_truncate = data.matrix(input_table[,2:7])
row.names(input_table_truncate) <- input_table[,1]
columndata = data.frame(c("alfalfa","alfalfa","alfalfa","clover","clover","clover"))
columndata[,2] = rep("paired_end",6)
row.names(columndata) = colnames(input_table_truncate)
colnames(columndata) = c("plant","type")
columndata[,1] = factor(columndata[,1])
columndata[,2] = factor(columndata[,2])

#differential expression analysis
dds <- DESeqDataSetFromMatrix(countData = round(input_table_truncate),colData = columndata,design = ~plant)

# add length infomation in normalization process
assays(dds)[["avgTxLength"]] <- length_table

res_raw = DESeq(dds)

res_2 = results(res_raw)
res_1 = results(res_raw, contrast=c("plant","alfalfa","clover"))

resOrdered_1 <- res_1[order(res_1$pvalue),]
resOrdered_2 <- res_2[order(res_2$pvalue),]

#write output files
write.csv(as.data.frame(resOrdered_1),file = "alfalfa_vs_clover_DE.txt")

write.csv(as.data.frame(resOrdered_2),file = "clover_vs_alfalfa_DE.txt")


########################MA plot

resLFC <- lfcShrink(res_raw,coef="plant_clover_vs_alfalfa", type="apeglm")

plotMA(res_raw, ylim=c(-15,15))

plotMA(resLFC,ylim=c(-15,15))




