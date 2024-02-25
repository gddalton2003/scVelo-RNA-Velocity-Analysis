# scVelo-RNA-Velocity-Analysis
<h3><img src="https://github.com/gddalton2003/demo_rep/assets/152720143/1dc474da-93ff-4ba1-a245-6a2d54b40f62" width="300" height="400" align = "left"> RNA Velocity Analysis Using The Python Package scVelo In Single Cell RNA-Seq Data </h3>

The paper presenting scVelo as a package to use for RNA velocity analysis was published in Nature Biotechnology in 2020.  RNA velocity can be used to determine if a gene is induced or repressed in a specific cell type. Further, it can be 
used to determine cell fate decisions via pseudtime trajectory analysis. The process starts in R where information can be extracted from a fully processed Seurat object. The information required from the Seurat object is an expression counts 
matrix, pca dimensionality reduction matrix, barcodes, gene names, and UMAP info. This information is used to make an anndata object (code in file named Step 1). In additon to an anndata object, one must construct spliced and unspliced matrices 
as a loom file. This is done using velocyto from the command line in Linux. This can be run from the folder in Linux where you want the velocyto results in. Files required for this: (1) mm10_rmsk.gtf (to mask repeats), (2) gencode.vM25.annotation.gtf 
(as annotation reference), (3) barcodes.tsv file, and (4) possorted_genome_bam.bam file. 

***Command That Worked To Run velocyto***: velocyto run -b barcodes.tsv -m mm10_rmsk.gtf possorted_genome_bam.bam gencode.vM25.annotation.gtf. 
Velocyto creates a spliced and unspliced matrix for each sample and this can be merged with the anndata object (code in file name Step 2). After this merged anndata object is created, scVelo RNA velocity analysis can be run in stochastic mode (code in file named
Step 3) or dynamical mode (code in file named Step 4). The stochastic and dynamical analysis were both run using Jupyter notebook.
