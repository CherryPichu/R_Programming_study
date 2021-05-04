install.packages("plotly")
library(plotly)
df = read.csv("C:/Users/uskaw/R프로그래밍 실습/feeds (4).csv")
df$created_at <- as.POSIXct(df$created_at)
fig <- plot_ly(df, x = ~created_at, y = ~field1, type = 'scatter', mode = 'lines')
fig

