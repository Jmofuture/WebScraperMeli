# R program to illustrate
# Web Scraping

# Import rvest library
library(rvest)
library(tidyverse)
library(readr)


url <- ("https://listado.mercadolibre.com.uy/iphone-13#D[A:iphone%2013]") %>%
  read_html()

Titles <- html_nodes(url, '.ui-search-item__title') %>%
  html_text()

Price <- html_nodes(url, '.ui-search-price__second-line .price-tag-text-sr-only') %>%
  html_text()

Link <- html_nodes(url, '.ui-search-result__image a') %>%
  html_attr("href")

data <- data.frame(Titles, Price, Link) %>%
  write_excel_csv(file = "C:\\Users\\jeano\\OneDrive\\Escritorio\\WebScrapingfoo.csv")

