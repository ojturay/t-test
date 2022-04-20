immediate <- c(7.4, 46.6, 11.1, 12.3, 21.8, 279.6, 43, 8.9, 39.6)
cooled <- c(6.3, 44.2, 10.3, 11.3, 20.7, 254.8, 38.7, 7.9, 36.8)
samples <- data.frame(immediate, cooled)

# boxplot with outliers 
boxplot(samples, use.cols=TRUE, xlab="analysis time", las=1,
        ylab="concentration inµmol/L", main= "Analysis of Samples ")

#boxplot without outliers 
boxplot(samples, use.cols=TRUE, outline=FALSE, xlab="analysis time", las=1,
        ylab="concentration inµmol/L",main= "Analysis of Samples ")

#paired t-test 
#H0: µ1 = µ2  vs H1: µ1 != µ2
t.test(immediate, cooled, paired=TRUE,
       conf.level = 0.95)

#result
#data:  immediate and cooled
#t = 1.6902, df = 8, p-value = 0.1295
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:  -1.591007 10.324340
#sample estimates: mean of the differences: 4.366667 

#we fail to reject the H0

#sample size not large enough to detect difference if its present.Desired 
#power cannot be achieved

#paired t-test assumes normal distribution which might not be justified with the
#sample size used in this example

#use the wilcoxon signed-ranked test to test for the location 
#difference since test is assumed to not be normally distributed 

#wilcoxon signed rank test 
#H0: µ = 0 vs H1: µ != 0 ; where µ is the median of the differences 
wilcox.test(immediate, cooled, alternative = "two.sided",
            paired=TRUE, conf.level = 0.95)

#result
#Wilcoxon signed rank test with continuity correction
#data:  immediate and cooled
#V = 45, p-value = 0.009091
#alternative hypothesis: true location shift is not equal to 0

# we reject H0 at 0.05 significance level as there is significant difference 
#in the analysis of the two different samples 