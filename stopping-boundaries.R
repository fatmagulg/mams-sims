library(ldbounds)

#n = c(rep(30,5))

p_bounds <- commonbounds(looks = 5, iuse = "PK")
obf_bounds <- commonbounds(looks = 5, iuse = "OF")

looks <- seq(length(p_bounds$upper.bounds))

plot(looks, p_bounds$upper.bounds, type = 'o', lty = 3, pch = 16, 
     ylim = c(-6,6), xlim = c(1, 5.5), 
     ylab = "Normal test statistic", xlab = "Interim analysis")

lines(c(5,5), c(-2.41311,2.41311), col = 'darkgray')

lines(looks, p_bounds$lower.bounds, type = 'o', lty = 3, pch = 16)

lines(looks, obf_bounds$upper, type = 'o', lty = 1, pch = 17)
lines(looks, obf_bounds$lower.bounds, type = 'o', lty = 1, pch = 17)

lines(looks, c(rep(3, 4), 1.96), type = 'o', lty = 2, pch = 18)
lines(looks, c(rep(-3, 4), -1.96), type = 'o', lty = 2, pch = 18)



legend('bottomright', legend = c("Haybittle-Peto", "Pocock", "O'Brien-Fleming"), 
       lty = c(2,3,1), pch = c(18, 16,17), bty = 'n')

text(x = 3, y = -5, expression(Reject ~ H[0]))
text(x = 3, y = 5, expression(Reject ~ H[0]))
text(x = 3, y = 0, "Continue")
text(x = 5.3, y = 0.25, "Accept")
text(x = 5.3, y = -0.25, expression(H[0]))

