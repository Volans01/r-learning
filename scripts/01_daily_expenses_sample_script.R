library(ggplot2)

data <- read.csv("/storage/emulated/0/R/daily_expenses_sample.csv", stringsAsFactors = FALSE)

# clean names
colnames(data) <- c("Date", "Type", "Product", "Price")

# ensure numeric
data$Price <- as.numeric(data$Price)

sum_dat <- aggregate(Price ~ Type, data = data, sum)

ggplot(sum_dat, aes(x = Type, y = Price)) +
  geom_bar(stat = "identity")

ggsave("plot.png")