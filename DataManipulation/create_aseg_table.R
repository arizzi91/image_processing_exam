createAsegTable<-function(meas="volume",resultname="Data/aseg/aseg_feature.csv",file_subject="/file_subjects_adolescent.txt")#build table.csv
{
# Inizializzazioni file;
currentpwd<-getwd();
rootpwd<-dirname(currentpwd)
# file contenente i soggetti da analizzare
file_subjects<-paste(currentpwd,file_subject,sep="")
commandstd<-paste("/usr/local/freesurfer/bin/asegstats2table --subjectsfile=",file_subjects,sep="")
#selezionare una measure
commandmean<-paste(" --meas",meas);
#salta i soggetti con non hanno aseg.stats
commandskip<-" --skip "
#nome tabella che creo
commandnametable<-paste("--tablefile ",rootpwd,"/",resultname,sep="")
#alcuni file stats non posseggono tutte le feature con common scrivo solo quelle che possogono tutti
#con --all-segs le scrivo tutte
commandseg=" --all-segs "
commandexp<-paste('export SUBJECTS_DIR=',rootpwd,"/FS/",sep="")
commandfree<-paste(commandexp,sep=" \n " ,commandstd)
commandfree<-paste(commandfree,commandskip,commandmean,commandnametable,commandseg)
print(commandfree)
system(commandfree)

#vado a prendere la tabella cosi formata e la modifico in modo tale da assegnare alle feautures nomi relativi alla dimensione di cui hanno il valore
#e sovrascrivo la tabella con queste modifiche.
Table<-read.table(paste(rootpwd,resultname,sep="/"))
stringmeas=substring(Table[1,1],8)
FinalData=as.matrix(Table)
FinalData[1,]=paste(FinalData[1,],stringmeas,sep="")
write.table(FinalData,file=paste(rootpwd,resultname,sep="/"),row.names = FALSE,col.names =FALSE)
h<-read.csv(paste(rootpwd,resultname,sep="/"),sep="");
}
