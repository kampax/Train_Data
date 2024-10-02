
library(tidyverse)

df1 <- read.delim("batch results/test1.csv", sep = ",")
df1 <- df1 %>% select(Class)%>% rename(Class_new1 = Class)

df2 <- read.delim("batch results/test2.csv", sep = ",")#output_gtp_def.csv
df2 <- df2 %>% select(Class) %>% rename(Class_new2 = Class)


df3 <- read.delim("batch results/output_rk.csv", sep = ",")
df3<- df3 %>% select(Class) %>% rename(Class_rk = Class)

df4 <- df2df3 <- read.delim("photos.csv", sep = ",")

#######
#Unir## 
####### 

datos <- bind_cols(df4, df3, df2, df1)

# Vector de categorías
categories <- c("Cultural_Religious", "Fauna_Flora", "Gastronomy", "Nature", "Sports", "Urban_Rural")

# Extraer la categoría presente en cada fila
datos <- datos %>%
  mutate(Rohaifa_category = str_extract(url, paste(categories, collapse = "|")))
# 
# datos <- datos %>%
#   mutate(coincidencia= ifelse(Rohaifa_category == Class_rk, "Coincide", "No coincide"))
# 
# # Count
# resumen_general <- datos %>%
#   group_by(coincidencia) %>%
#   summarise(total = n())
# 
datos <- datos %>%
  mutate(coincidencia2= ifelse(Rohaifa_category == Class_new2, "Coincide", "No coincide"))

# Count
resumen_general2 <- datos %>%
  group_by(coincidencia2) %>%
  summarise(total = n())


write.csv(datos, "results.csv")


######################
##RESUMENES DE TOKENS#
######################

df1 <- read.delim("batch results/output_rk.csv", sep = ",")
sum(df1$response.body.usage.prompt_tokens)
sum(df1$response.body.usage.completion_tokens)

###Precio 
precio_input <- (sum(df1$response.body.usage.prompt_tokens) * 0.075)/1000000
precio_output <- (sum(df1$response.body.usage.completion_tokens) * 0.300)/1000000
precio_input 
precio_output
precio_input + precio_output



df2 <- read.delim("batch results/test2.csv", sep = ",")
sum(df2$response.body.usage.prompt_tokens)
sum(df2$response.body.usage.completion_tokens)
###Precio 
precio_input <- (sum(df2$response.body.usage.prompt_tokens) * 0.075)/1000000
precio_output <- (sum(df2$response.body.usage.completion_tokens) * 0.300)/1000000
precio_input 
precio_output
precio_input + precio_output


df3 <- read.delim("batch results/output_new2.csv", sep = ",")
sum(df3$response.body.usage.prompt_tokens)
sum(df3$response.body.usage.completion_tokens)
###Precio 
precio_input <- (sum(df3$response.body.usage.prompt_tokens) * 0.075)/1000000
precio_output <- (sum(df3$response.body.usage.completion_tokens) * 0.300)/1000000
precio_input 
precio_output
precio_input + precio_output


