library(data.table)
library(ggplot2)
library(ggmosaic)
library(readr)

filePath <‐ "C:/Users/victorb/Quantium/Sarah D'oliveiro ‐ InsideSherpa
↪ (internal)/"
transactionData <‐ fread(paste0(filePath,"QVI_transaction_data.csv"))
customerData <‐ fread(paste0(filePath,"QVI_purchase_behaviour.csv"))

str(transactionData)

"Smiths Crinkle Cut Chips Chicken 170g" "Smiths Chip Thinly S/Cream&Onion 175g"

transactionData$DATE <‐ as.Date(transactionData$DATE, origin = "1899‐12‐30")

transactionData[, .N, PROD_NAME]

productWords <‐ data.table(unlist(strsplit(unique(transactionData[,
↪ PROD_NAME]), " ")))
setnames(productWords, 'words')

productWords <‐ productWords[grepl("\\d", words) == FALSE, ]

productWords <‐ productWords[grepl("[:alpha:]", words), ]
↪ appears and

productWords[, .N, words][order(N, decreasing = TRUE)]

summary(transactionData)

transactionData[PROD_QTY == 200, ]

transactionData[LYLTY_CARD_NBR == 226000, ]

transactionData <‐ transactionData[LYLTY_CARD_NBR != 226000, ]

summary(transactionData)
