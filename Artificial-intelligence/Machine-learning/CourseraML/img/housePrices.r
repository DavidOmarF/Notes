# Include libraries
library(ggplot2)
 
# Read data
df = read.csv(file = "./housePrices.csv", header = TRUE)

# Create pdf file
pdf("housePrices.pdf", width=4, height=2)

# Create plot base
#   (source data, labels and axis limits)
base = ggplot(df, aes(x=sqft, y=price)) + 
        labs(x = "Size (square feet)", y = "Price (1000s dollars)") +
        ylim(0, 500) +
        xlim(0, 3000)

# Create and plot fig1 (scatter plot)
fig1 = base +
    geom_point(colour = "#4FC1BB", alpha = 0.6, size = 2)

plot(fig1)

# Create and plot fig2 (add prediction event)
fig2 = fig1 + 
    geom_vline(xintercept=1250, colour = "#FF4D48", linetype="dashed")

plot(fig2)

# Create and plot fig3 (scatter with fit regression line)
fig3 = base + 
    geom_point(colour = "#4FC1BB", alpha = 0.3, size = 2) +
    geom_smooth(method = "lm", se = FALSE, colour = "#4FC1BB") +
    geom_vline(xintercept=1250, colour = "#FF4D48", linetype="dashed") +
    geom_point(x = 1250, y = 250, alpha = 0.8, size = 2, colour = "#FF4D48", shape=4)

plot(fig3)
