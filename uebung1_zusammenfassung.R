### Grundrechenarten
3+5
3*5
3-5
3/5
3^5

### Standard-Funktionen
sqrt(5)
log(5)
log(8,2)
sin(2*pi)

### Vektoren
# Definition durch Aufzählen aller Elemente
temp  <- c(7.5, 8.4, 9.1,9.0,10.0,10.7,11.8,11.9,12.8,12.9)
# anderer Zuweisungsoperator
resp = c(122,176,102,162,288,182,196,218,148,218)

# Rechnen mit Vektoren erfolgt komponentenweise
3*temp 
x <- temp
y <- log(resp)

### Grafische Darstellung
plot(temp,resp)
# Verschönern der Grafik durch zusätzliche Argumente 
plot(temp, resp, xlab="Bodentemperatur", ylab="Bodenatmung")

### Vektoren mit Struktur
# aufeinanderfolgende Zahlen
(-7):15

x1 <- 1:10
# äquidistante Zahlenfolgen
seq(11, 19, 2)
# Hilfe zu R-Funktionen 
?seq
# Argumente von Funktionen können in beliebiger Reihenfolge angegeben werden 
seq(to=19, by=2, from=11)
# Verwendung alternativer Argumente
x2 <- seq(11,19, length.out = 10)   
x2

# Volltextsuche in allen verfügbaren Hilfeseiten
??sequence

# Vektoren mit wiederholten Elementen  
rep(2,10)
eins.vec <- rep(1,10)
eins.vec
rep(x,2)
rep(c(1,2,4),3)
rep(c(1,2,4), each=3)

# Vektoren mit Text  
x3 <- rep(c("kalt","warm"),each=5)

### Matrizen
# generische Definition mit matrix()-Funktion  
matrix(data = 1:12, nrow = 3)

# standardmäßig wird spaltenweise aufgefüllt  
A <-  matrix(data = 1:12, nrow = 3, byrow = T)

# was nicht passt, wird passend gemacht: Recycling beim Auffüllen  
matrix(data = 1:12, nrow = 5, byrow = T)

# Matrizen durch Verknüpfen von Vektoren  
X <-cbind(temp, resp)  

### Indizierung von Matrizen
A
A[2,3]
A[1:2,2:3]
A[1,]
A[,2]
X[,2]
X
X[,"resp"]
X[,2]>150
X[ X[,2]>150, ]

# alle Elemente einer Matrix müssen gleichen Typ haben
cbind(x3,x,y)

# dataframes gestatten unterschiedliche Typen in unterschiedliche Spalten 
resp.data <- data.frame(x3,x,y)
str(resp.data)

resp.data[2,3]
resp.data$x

### Matrixmultiplikation 
A
B <- matrix(1:12,3)
B
# komponentenweise  
A*B
# echte Matrixmultiplikation  
A %*% t(B)

### Suche nach der besten Geraden für Bodenatmungsbeispiel  
plot(x,y, xlim=c(0,15), ylim=c(0,8),xlab="Temperatur", ylab="log. Bodenatmung")

# verbinde linken und rechten Extrempunkt  
xwerte <- c(min(x), max(x))
ywerte <- c(y[1],y[length(y)])

lines(xwerte, ywerte, col=3,lwd=3)


### Berechnung der Kriterien für Beispielwerte für b0, b1
# heuristische Wahl der Parameter der Geraden
b1 <- (5.4-4.8)/5 # Anstieg
b0<-4             # Schnittpunkt mit y-Achse
sum((y-(b0+b1*x))^2)
abline(b0,b1, col=2, lwd=3)

# Versuch der Verbesserung  
b1 <- 0.11
sum((y-(b0+b1*x))^2)
abline(b0,b1, col=4, lwd=3)

### systematische Gittersuche
# Kandidatenwerte für b0 und b1   
b0.seq <- seq(3,5, 0.01)
b1.seq <- seq(0,0.15, 0.01)
# Initialisierung einer Ergebnismatrix
result <- matrix(0, length(b0.seq),length(b1.seq))  

### Berechnung des Kriteriums für jede Kombination von Parametern (b0,b1)
for (i in 1:length(b0.seq))  
  for (j in 1: length(b1.seq))
  {
    result[i,j] <- sum((y-(b0.seq[i]+b1.seq[j]*x))^2)
  }

# Identifizierung der optimalen Kombination  
result
min(result)

which( result==min(result), arr.ind=T)
b0.seq[144]
b1.seq[8]
abline(4.43,0.07, col=5,lwd=3)
