## Type I error probability vs information fraction for alpha spending functions
library(ldbounds)

# unequal intervals/group sizes
n = c(1, 31,24,46,13, 32)  # set the first sample size to 1 so that plot starts close to origin

obf_bounds <- ldBounds(t = cumsum(n)/sum(n), alpha = 0.05/4 , sides = 1, iuse = 1)
p_bounds <- ldBounds(t = cumsum(n)/sum(n), alpha = 0.05/4 , sides = 1, iuse = 2)

plot(obf_bounds$time, obf_bounds$exit.pr, type = 'o', lty = 3, pch = 16, 
     ylim = c(0, bounds$alpha), 
     ylab = 'Type I error probability', xlab = 'Information fraction')
lines(p_bounds$time, p_bounds$exit.pr, type = 'o', lty = 1, pch = 16)
abline(h = obf_bounds$alpha, lty = 2, col = 'darkblue')

legend(x = 0.75, y = 0.003, legend = c("Overall alpha","Pocock", "O'Brien-Fleming"), 
       lty = c(2,1,3), pch = c(NA, 16, 16), col = c('darkblue', 'black', 'black'),
       bty = 'n')


# at equal intervals/group sizes
n = c(1, rep(20,5))  # set the first sample size to 1 so that plot starts close to origin

obf_bounds <- ldBounds(t = cumsum(n)/sum(n), alpha = 0.05/4 , sides = 1, iuse = 1)
p_bounds <- ldBounds(t = cumsum(n)/sum(n), alpha = 0.05/4 , sides = 1, iuse = 2)

plot(obf_bounds$time, obf_bounds$exit.pr, type = 'o', lty = 3, pch = 16, 
     ylim = c(0, bounds$alpha), 
     ylab = 'Type I error probability', xlab = 'Information fraction')
lines(p_bounds$time, p_bounds$exit.pr, type = 'o', lty = 1, pch = 16)
abline(h = obf_bounds$alpha, lty = 2, col = 'darkblue')

legend(x = 0.75, y = 0.003, legend = c("Overall alpha","Pocock", "O'Brien-Fleming"), 
       lty = c(2,1,3), pch = c(NA, 16, 16), col = c('darkblue', 'black', 'black'),
       bty = 'n')