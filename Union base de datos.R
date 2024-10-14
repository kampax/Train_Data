
library(tidyverse)

df2 <- read.delim("batch results/train_data.csv", sep = ",")
df2 <- df2 %>% select(Class)%>% rename(Class_new = Class)


df3 <- read.delim("listado_imagenes.csv", sep = ",")


#######
#Unir## 
####### 

df <- bind_cols(df3, df2)

# Crear un diccionario para la clasificación
diccionario_clases <- c(
  "a" = "Cultural_Religious",
  "b" = "Fauna_Flora",
  "c" = "Gastronomy",
  "d" = "Nature",
  "e" = "Sports",
  "f" = "Urban_Rural"
)


# Asignar la clase basada en la letra después de 'main/'
df <- df %>%
  mutate(Class_Original = diccionario_clases[str_sub(url, str_locate(url, "main/")[,1] + 5, str_locate(url, "main/")[,1] + 5)])

# Ver los resultados
print(df)


# # Vector de categorías
# categories <- c("Cultural_Religious", "Fauna_Flora", "Gastronomy", "Nature", "Sports", "Urban_Rural")
# 
# # Extraer la categoría presente en cada fila
# datos <- datos %>%
#   mutate(Rohaifa_category = str_extract(url, paste(categories, collapse = "|")))
#
# df <- df %>%
#   mutate(coincidencia= ifelse(Class_Original == Class_new, "Coincide", "No coincide"))
# 
# # Count
# resumen_general <- df %>%
#   group_by(coincidencia) %>%
#   summarise(total = n())
# 
# 
# 
# # Count
# resumen_general3 <- df %>%
#   group_by(coincidencia) %>%
#   summarise(total = n())

# 
write.csv(df, "results_new.csv")


######################
##RESUMENES DE TOKENS#
######################
# 
# df1 <- read.delim("batch results/output_rk.csv", sep = ",")
# sum(df1$response.body.usage.prompt_tokens)
# sum(df1$response.body.usage.completion_tokens)
# 
# ###Precio 
# precio_input <- (sum(df1$response.body.usage.prompt_tokens) * 0.075)/1000000
# precio_output <- (sum(df1$response.body.usage.completion_tokens) * 0.300)/1000000
# precio_input 
# precio_output
# precio_input + precio_output
# 
# 
# 
# df2 <- read.delim("batch results/test2.csv", sep = ",")
# sum(df2$response.body.usage.prompt_tokens)
# sum(df2$response.body.usage.completion_tokens)
# ###Precio 
# precio_input <- (sum(df2$response.body.usage.prompt_tokens) * 0.075)/1000000
# precio_output <- (sum(df2$response.body.usage.completion_tokens) * 0.300)/1000000
# precio_input 
# precio_output
# precio_input + precio_output
# 
# 
# df3 <- read.delim("batch results/output_new2.csv", sep = ",")
# sum(df3$response.body.usage.prompt_tokens)
# sum(df3$response.body.usage.completion_tokens)
# ###Precio 
# precio_input <- (sum(df3$response.body.usage.prompt_tokens) * 0.075)/1000000
# precio_output <- (sum(df3$response.body.usage.completion_tokens) * 0.300)/1000000
# precio_input 
# precio_output
# precio_input + precio_output
# 
# 
