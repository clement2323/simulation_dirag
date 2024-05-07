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
Sys.sleep(10)


out <- data.frame(col1 = seq(1,25), col2= LETTERS[1:25])
unique_id <- UUIDgenerate()
nom_fichier <- paste0(Sys.Date(),"_",unique_id,".csv")




Sys.setenv("AWS_ACCESS_KEY_ID" = "ZYM685FYX0R1JQ6KDPQ9",
           "AWS_SECRET_ACCESS_KEY" = "CH+QoR+D7ZgI2jZA0K8feMCFEPMpLvQWWIaTW2jF",
           "AWS_DEFAULT_REGION" = "us-east-1",
           "AWS_SESSION_TOKEN"="eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NLZXkiOiJaWU02ODVGWVgwUjFKUTZLRFBROSIsImFsbG93ZWQtb3JpZ2lucyI6WyIqIl0sImF1ZCI6WyJtaW5pby1kYXRhbm9kZSIsIm9ueXhpYSIsImFjY291bnQiXSwiYXV0aF90aW1lIjoxNzE1MDM5OTIwLCJhenAiOiJvbnl4aWEiLCJlbWFpbCI6ImNsZW1lbnQuZ3VpbGxvQGluc2VlLmZyIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImV4cCI6MTcxNTcxMjI4OCwiZmFtaWx5X25hbWUiOiJHdWlsbG8iLCJnaXZlbl9uYW1lIjoiQ2zDqW1lbnQiLCJncm91cHMiOlsiVVNFUl9PTllYSUEiLCJjaGFsbGVuZ2VkYXRhLWVucyIsInNsdW1zLWRldGVjdGlvbiJdLCJpYXQiOjE3MTUxMDc0ODcsImlzcyI6Imh0dHBzOi8vYXV0aC5sYWIuc3NwY2xvdWQuZnIvYXV0aC9yZWFsbXMvc3NwY2xvdWQiLCJqdGkiOiJmYWJkOWYxZS00ZDVhLTRhZWYtOGIzNC03ZjY2OTMzZWFiYjMiLCJsb2NhbGUiOiJlbiIsIm5hbWUiOiJDbMOpbWVudCBHdWlsbG8iLCJwb2xpY3kiOiJzdHNvbmx5IiwicHJlZmVycmVkX3VzZXJuYW1lIjoiY2d1aWxsbyIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBncm91cHMgZW1haWwiLCJzZXNzaW9uX3N0YXRlIjoiM2ExNDQ2YzEtZjQ4Yy00NjExLTliMjItNmJjODJkNjRlNmQ4Iiwic2lkIjoiM2ExNDQ2YzEtZjQ4Yy00NjExLTliMjItNmJjODJkNjRlNmQ4Iiwic3ViIjoiM2IwNmVmYTQtNTlmZS00M2M4LWEwMmItYTk0ZDliNGI1NDRlIiwidHlwIjoiQmVhcmVyIn0.ntdSIEnpvHKJznZw0qmWVuzL3PpwYCK6MVPCQvjncepsjniBDrmE670gJTOIAF28wbS0ZQ2-XhtnzrHyp8QXFg",
           "AWS_S3_ENDPOINT"="minio.lab.sspcloud.fr")


aws.s3::s3write_using(
  x = out,FUN = write.csv,bucket = user,object = paste0(rep_out,nom_fichier),
  opts = list("region" = "")
  
)


# write.csv(out,nom_fichier)
# 
# commande_mc <- paste0("mc cp ",nom_fichier," s3/",user,"/",rep_out, nom_fichier)
# 
# system(commande_mc)  
  
