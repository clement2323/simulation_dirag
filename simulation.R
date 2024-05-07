install.packages("aws.s3")
install.packages("uuid")

library(aws.s3)
library(uuid)

user <- "cguillo"
rep_in <- "population_simulation/"
rep_out <- "resultats_simulation/"

## Importation des données
population <- aws.s3::s3read_using(
  FUN = read.csv,
  object = paste0(rep_in,"train.csv"),
  bucket = user,
  opts = list("region" = "")
)

### instruction
Sys.sleep(20)


out <- data.frame(col1 = seq(1,25), col2= LETTERS[1:25])
unique_id <- UUIDgenerate()
nom_fichier <- paste0(Sys.Date(),"_",unique_id,".csv")

write.csv(out,nom_fichier)

commande_mc <- paste0("mc cp ",nom_fichier," s3/",user,"/",rep_out, nom_fichier)

system(commande_mc)  
  
