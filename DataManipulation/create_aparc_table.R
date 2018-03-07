createAparcTable<-function(hemi="lh",meas="area",resultname,file_subject="/file_subjects_adolescent.txt")
{
# hemi=left or right

currentpwd<-getwd();
# file contenente i soggetti da analizzare
rootpwd<-dirname(currentpwd)
file_subjects<-paste(currentpwd,file_subject,sep="")
commandstd<-paste("/usr/local/freesurfer/bin/aparcstats2table --subjectsfile=",file_subjects,sep="")
commandhemi<-paste(" --hemi=",hemi,sep="")
commandmean<-paste(" --meas",meas);
commandskip<-" --skip "
commandnametable<-paste("--tablefile ",rootpwd,"/",resultname,sep="")
# start command
commandexp<-paste('export SUBJECTS_DIR=',rootpwd,"/FS/",sep="")
commandfree<-paste(commandexp,sep=" \n " ,commandstd)
commandfree<-paste(commandfree,commandskip,commandmean,commandnametable,commandhemi)
print(commandfree)
system(commandfree)



# formattazine della tabella corretta
Table<-read.table(paste(rootpwd,resultname,sep="/"))
FinalData=as.matrix(Table)
write.table(FinalData,file=paste(rootpwd,resultname,sep="/"),row.names = FALSE,col.names =FALSE)
h<-read.csv(paste(rootpwd,resultname,sep="/"),sep="");
}
