

### Read In  Seurat Object ###

FH5 <- LoadH5Seurat("SeuratProject.h5Seurat")
FH5
Idents(FH5)

# save metadata table:
FH5$barcode <- colnames(FH5)
FH5$UMAP_1 <- FH5@reductions$umap@cell.embeddings[,1]
FH5$UMAP_2 <- FH5@reductions$umap@cell.embeddings[,2]
write.csv(FH5@meta.data, file='metadata.csv', quote=F, row.names=F)

# write expression counts matrix
rm(counts_matrix)
counts_matrix <- GetAssayData(FH5, assay='RNA', slot='counts')
writeMM(counts_matrix, "counts.mtx")
readLines("counts.mtx")

# write dimesnionality reduction matrix, in this example case pca matrix
write.csv(FH5@reductions$pca@cell.embeddings, file='pca.csv', quote=F, row.names=F)

# write gene names
write.table(
  data.frame('gene'=rownames(counts_matrix)),file='gene_names.csv',
  quote=F,row.names=F,col.names=F
)

SaveH5Seurat(FH5)
