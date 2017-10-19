3+5
# Ctrl+enter: ausführung von Befehlen im Skriptfenster

# Vektoren
temp <- c(7.5, 8.4, 9.1, 9.0, 10.0, 10.7, 11.8, 11.9, 12.8, 12.9)
resp <- c(122, 176, 102, 162, 288, 182, 196, 218, 148, 218)

3*temp
  x <- temp
  y <- log(resp)

plot(temp, resp, xlab = "Bodentemperatur", ylab = "Bodenatmung")

# Vektoren mit Struktur
(-7):15


x1 <- 1:10
  seq(11, 19, 2)
  ?seq
  seq(to=19, by=2, from=11)
x2 <- seq(11,19,length.out = 10)
  x2
  seq()
  seq() # tabulatortaste zeigt die attribute der funktion an (Cursor an position nach klammer auf)
  
  ??sequence # wirft eine Übersicht von Hilfeseiten, wo der Suchbegriff auftaucht
  
  rep(2, 10)
  eins.vec <- rep(1,10)
  rep(x, 2)
  rep(c(1,2,4), 3)
  rep(c(1,2,4), each = 3)
  
  x3 <- rep(c("kalt", "warm"), each = 5)
  
  # Matrizen
  
  matrix(data = 1:12, nrow = 3)
  
  
A <- matrix(data = 1:12, nrow = 3, byrow = T)
  
  matrix(data = 1:12, nrow = 5, byrow = TRUE)
  
X <- cbind(temp, resp)

A
A[2,3]
A[1:2, 2:3]
A[1,]
A[,2]
X[,2]
X[,"resp"]
X[,2]>150
X[X[,2]>150, ]

cbind(x3, x, y)


resp.data <- data.frame(x3, x, y)
str(resp.data)

resp.data[2,3]
resp.data$x

 A
 B <- matrix(1:12,3)
 B
 A*B
 
 A %*% t(B)
 
 
 plot(x,y, xlab = "Temperatur", ylab = "log. Bodenatmung")
 # siehe VOrlesung 16.10.17: y_i \approx \beta_0 + \beta_1*x_i
 # gesucht sind die besten Werte für \beta_0, \beta_1
 
 # einfache Gerade von Minimum zum Maximum
 xwerte <- c(min(x), max(x))
 ywerte <- c(y[1],   y[length(y)]) # wie mit sort() und order() für komplexere Datensätze machen?
 
 lines(xwerte, ywerte, col = 3, lwd = 3)
 
 # Kriterien: \item Verbinde die "Extrempunkte" (s.o.)
 #            \item \min{\limits_{\beta_0, \beta_1}} \Sum{\limits_{i=1}^{n}} (y_i - (\beta_0+ \beta_1*x_1))^2
 #            \item \min{\limits_{\beta_0, \beta_1}} \Sum{\limits_{i=1}^{n}} (y_i - (\beta_0+ \beta_1*x_1))
 ### Berechnung der Kriterien für Beispielwerte für \beta_0 (b1), \beta_1 (b2)
 # \beta_1 = Anstieg der Geraden: \frac{y_2 - y_1}{x_2 - x_1}
 b1 <- (5.4 - 4.8)/5
 
 plot(x,y, xlim = c(0, 15), ylim = c(0,8), xlab = "Temperatur", ylab = "log. Bodenatmung")
 lines(xwerte, ywerte, col = 3, lwd = 3)
 b0 <- 4
 sum((y-(b0+b1*x))^2)
 abline(b0, b1, col = 2, lwd = 3)
 
 b1 <- 0.1
 sum((y-(b0+b1*x))^2)
 abline(b0, b1, col = 1, lwd = 3)
 
 b1 <- 0.11
 sum((y-(b0+b1*x))^2)
 abline(b0, b1, col = 4, lwd = 3)
 
 
 # grid search
 
  b0.seq <- seq(3, 5, 0.01)
  b1.seq <- seq(0, 0.15, 0.01)
  result <- matrix(0, length(b0.seq), length(b1.seq))
  for (i in 1:length(b0.seq)) {
    for (j in 1:length(b1.seq)) {
      result[i,j] <- sum((y-(b0.seq[i]+b1.seq[j]*x))^2)
      #abline(b0, b1, col = 2, lwd = 3)
    }
  }
  
  result
  min(result)
  which( result == min(result), arr.ind = T)
  b0.seq[144]
  b1.seq[8]
  # beste Gerade hinsichtlich dieses Kriteriums:
  abline(4.43, 0.07, col = 5, lwd = 4)
  
  # Hausaufgabe: beste Gerade nach einem anderen Kriterium finden.