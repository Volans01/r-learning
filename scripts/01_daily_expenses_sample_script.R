library(ggplot2)

data <- read.csv("01_daily_expenses_sample_data.csv", stringsAsFactors = FALSE)

# clean names
colnames(data) <- c("Date", "Type", "Product", "Price")

# ensure numeric
data$Price <- as.numeric(data$Price)

sum_dat <- aggregate(Price ~ Type, data = data, sum)

ggplot(sum_dat, aes(x = Type, y = Price)) +
  geom_bar(stat = "identity")

ggsave("01_daily_expenses_plot.png")
