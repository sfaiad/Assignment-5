---
title: "Assignment-5"
author: "Sara Faiad"
date: "2/17/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Getting the Data 

I created a data folder locally and downloaded "siscowet.csv". 

```
siscowet<- read.csv("data/siscowet.csv")

head(siscowet)
```

## The Plot 

# load ggplot2
library(ggplot2)

# A basic scatterplot showing the relationship between len and wgt. Points are colored depending on locID. 

ggplot(siscowet, aes(x=age, y=len, color=locID)) + 
    geom_point(size=6) 

That looks pretty bad, but it's a start. Time to refine. 

#Refining the plot 

#PNW color pallette 

install.packages("PNWColors")
library(PNWColors)

siscowet_expository_plot<- ggplot(data = siscowet, 
       aes(x = age, 
       y= len)) + 
  geom_point(aes(color = locID, 
                 shape = locID),
             size = 3) +
  scale_color_manual(values = pnw_palette("Cascades",4)) +
  labs(title = "Siscowet Lake Trout from Michigan waters of Lake Superior",
       subtitle = "Length and weight from four locations: Blind Sucker, Deer Park, Grand Marais, and  Little Lack Harbor",
       x = "Assigned Ages (years)",
       y = "Total Length (mm)",
       color = "Location ID",
       shape = "Location ID") +
  theme_classic()
  
Better, but still not great. Many of the points overlap and extending the x-axis could help, but there are a few wgt outliers that would need to be excluded from the plot. Additionally, the colors are not colorblind friendly. I'm going to switch up tactics and attempt a violin plot. 

#Violin Plot 

ggplot(data = siscowet, 
       aes(x = wgt, 
       y= len)), aes(x=dose, y=len, fill=dose)) + 
 geom_violin(trim=FALSE)+
 geom_boxplot(width=0.1, fill="white")+
 labs(title="Plot of length  by dose",x="Dose (mg)", y = "Length")+
 scale_fill_manual(values=pal)+
 theme_classic()
    
