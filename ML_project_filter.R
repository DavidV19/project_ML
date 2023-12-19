library(readxl)
library(xlsx)
library("writexl")


contracts_release_id<- releases_2022_contratos_entre_entidades_publicas_o_sus_subsidiarias$release_id
pag_contratos<- releases_2022_contratos_entre_entidades_publicas_o_sus_subsidiarias
planning_2023<- releases_2022_contratos_entre_entidades_publicas_o_sus_subsidiarias
Awards_2023<- releases_2022_contratos_entre_entidades_publicas_o_sus_subsidiarias 
pag_tender<-releases_2022_contratos_entre_entidades_publicas_o_sus_subsidiarias
Releases_2023<- releases_2022_contratos_entre_entidades_publicas_o_sus_subsidiarias
Pag_AwardSuppliers<- releases_2022_contratos_entre_entidades_publicas_o_sus_subsidiarias
length(contracts_release_id)
length(Releases_2023$id)
presupuesto<-0
EP_contratadas<-0
servicios_solicitados<-0
costo_servicio<-0
servicio_contratado<-0
nombre_EMOfertante<-0
for (i in 1:length(pag_contratos$ocid)){
  id_EP<- pag_contratos$release_idrelease_id...2[i]
  servicio_id<- pag_contratos$awardID[i]
  ocid<- pag_contratos$ocid[i]
  
   for (j in 1:length(Releases_2023$id)){
     if (id_EP == Releases_2023$id[j]){
       EP_contratadas<- c(EP_contratadas,Releases_2023$buyer_name[j])
       presupuesto<- c(presupuesto, planning_2023$budget_amount[j])
       
       print("test")
     }
     
   }  
   for (j in 1:length(pag_tender$id)){
    if(id_EP == pag_tender$release_id[j]){
      servicio_contratado<- c(servicio_contratado,pag_tender$description[j])
      
    }
   }
  for (j in 1:length(Awards_2023$id)){
    if(servicio_id==Awards_2023$id[j]){
      costo_servicio<-c(costo_servicio, Awards_2023$amount[j])
    }
  }
  for (j in 1:length(Pag_AwardSuppliers$id)){
    if (servicio_id == Pag_AwardSuppliers$award_id[j]){
      nombre_EMOfertante<- c(nombre_EMOfertante, Pag_AwardSuppliers$name[j])
       
    }
  }
  
}
       
     
##duplicados

##empresas duplicadas
EP_contratads_SINDUPLICADOS<-0

for (i in 1:length(EP_contratadas)){
  for(j in 1:length(EP_contratadas)){
    if (EP_contratadas[i] == EP_contratadas[j]){
      EP_contratads_SINDUPLICADOS<- c(EP_contratads_SINDUPLICADOS,EP_contratadas[i])
    }
  }
}


tabla<- data.frame(EP_contratadas, presupuesto, nombre_EMOfertante, servicio_contratado, costo_servicio)


Empresas_SINDUPLICAR_2023<-data.frame(EP_contratadas[!duplicated(EP_contratadas)])
Empresas_SINDUPLICAR_2022<-data.frame(EP_contratadas[!duplicated(EP_contratadas)])
Empresas_SINDUPLICAR_2021<-data.frame(EP_contratadas[!duplicated(EP_contratadas)])
Empresas_SINDUPLICAR_2020<-data.frame(EP_contratadas[!duplicated(EP_contratadas)])
Empresas_SINDUPLICAR_2019<-data.frame(EP_contratadas[!duplicated(EP_contratadas)])

write.xlsx(Empresas_SINDUPLICAR, "empresas_2023.xlsx")

hist(tabla)

 write.xlsx(tabla, "datos_2019.xlsx")

 