rm(list=ls())
source("new_file_id.R")
maindir=getwd()
file_errors<-"download_error.txt"
#url sito da dove scaricare il dataset
sturl<-"https://s3.amazonaws.com/fcp-indi/data/Projects/ABIDE_Initiative/Outputs/freesurfer/5.1"
#file contenente i soggetti da scaricare
x<-read.csv(file.path(maindir,'Phenotypic_V1_0b_preprocessed1_abide.csv'), header = T, sep = ",",stringsAsFactors = F)
#inizializzazione dataframe
bs<-data.frame()
zeroString<-"00"
underscoreString<-"_"
#inserimento nel dataframe solo i soggetti maschili
bs<-x[which(x$SEX==1),]
file<-scan("file_stats_da_scaricare.txt", character(), quote = "")
for (i in 1:nrow(bs)){
  if (bs[i, "FILE_ID"]=="no_filename" ){
   #############################################
    #inserite il codice per generare i file id mancanti
    #get subject
    subject<-bs[i,"subject"]
    #get SITE_ID
    newSiteID<-bs[i,"SITE_ID"]
    #get new newFILE_ID
    newSiteID <-new_file_id(newSiteID)
    newSiteID <-paste(newSiteID,underscoreString,zeroString,subject,sep="")
    bs[i,"FILE_ID"]<-newSiteID
  }
  
    dir<-file.path(maindir,"FS",bs[i, "FILE_ID"],"stats")
    dir.create(file.path(dir), showWarnings = F,recursive = T)
    url<-paste(c(sturl,bs[i, "FILE_ID"],"stats"),collapse="/")
    for(i in file)
    {

      #TODO try-catch block to capture error message download
      tryCatch({
        download.file(paste(c(url,i),collapse="/"), file.path(paste(c(dir,i),collapse="/")), quiet = FALSE, mode = "w", cacheOK = TRUE)
      },error=function(e){
        if(grepl("404",e$message)){
          write(paste(c(url,i),collapse="/"),file=file_errors,append = TRUE)
        }
      })

    }
  
}
write.table(bs,file.path(maindir,'campioni.csv'), row.names = F, col.names=T, sep=',')
