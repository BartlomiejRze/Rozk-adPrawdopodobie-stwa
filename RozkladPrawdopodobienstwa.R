ZAD.1.
Rozkład normalny (tzn. rozkład Gaussa)

#Co oznaczają poszczególne parametry we wzorze (1.1)?
x- zmienna losowa 
μ- wartość oczekiwana
σ- odchylenie standardowe 
σ^2- wariancja

> rnorm(n=10)
 [1] -1.344667957 -0.063780000 -0.831650736  1.038368572  0.076597324  0.298026114  0.001315381  0.350514284  0.665311092  0.414026429
> rnorm(n=10, mean=100, sd=20)
 [1]  81.80963  90.51018 105.01302  90.42464 138.95613 125.76838 117.78451 104.70860 136.67231  81.77468

> randNorm10 <- rnorm(10)
> randNorm10
 [1]  0.9966675 -0.3742352  1.4521518  0.7598700  0.6792385 -0.3138824 -1.4992114  0.2041603  0.1986149 -0.6867014
> dnorm(randNorm10)
 [1] 0.2427771 0.3719616 0.1389959 0.2989019 0.3167568 0.3797662 0.1296708 0.3907141 0.3911507 0.3151464

#Dlaczego nie jest możliwe precyzyjne wyliczenie prawdopodobieństwa dla rozkładu normalnego?
Rozkład normalny jest ciągłym rozkładem prawdopodobieństwa, co oznacza, że istnieje nieskończenie wiele możliwych wartości, 
które mogą być wylosowane z tego rozkładu. Dlatego nie jest możliwe precyzyjne wyliczenie prawdopodobieństwa dla konkretnej wartości w rozkładzie normalnym, 
ponieważ prawdopodobieństwo dla każdej pojedynczej wartości jest niezerowe, ale bardzo małe.
> dnorm(c(-1, 0, 1))
[1] 0.2419707 0.3989423 0.2419707

library (ggplot2)
randNorm <- rnorm(30000) #generujemy zmienne o rozkł. norm.
randDensity <- dnorm(randNorm) # wyliczamy ich gęstości rozkładu
ggplot(data.frame(x=randNorm, y=randDensity)) + aes(x=x, y=y) + geom_point() + labs(x="Random Normal variables", y="Density")

> pnorm(randNorm10)
 [1] 0.2882591 0.8551121 0.3117406 0.3703729 0.2665698 0.8672558 0.5415776 0.9004415 0.2453388 0.7826937
> pnorm(c(-3, 0, 3))
[1] 0.001349898 0.500000000 0.998650102
> pnorm(-1)
[1] 0.1586553
> pnorm(1) - pnorm(0)
[1] 0.3413447
> pnorm(1) - pnorm(-1)
[1] 0.6826895

#Pytanie – przypomnienie, czym jest data.frame, a czym jest geom_line()?
data.frame jest to obiekt w języku R, który służy do przechowywania danych w postaci tabeli.
geom_line() jest to funkcja z pakietu ggplot2, która służy do rysowania liniowej wizualizacji danych. Można jej użyć, aby narysować wykres liniowy na podstawie danych zawartych w data.frame

> neg1Seq <- seq(from=min(randNorm), to=-1, by=.1)
> lessThanNeg1 <- data.frame(x=neg1Seq, y=dnorm(neg1Seq))
> lessThanNeg1 
           x            y
1  -4.251309 4.745396e-05
2  -4.151309 7.223256e-05
3  -4.051309 1.088555e-04
4  -3.951309 1.624146e-04
5  -3.851309 2.399147e-04
6  -3.751309 3.508695e-04
7  -3.651309 5.080323e-04
8  -3.551309 7.282730e-04
9  -3.451309 1.033604e-03
10 -3.351309 1.452349e-03
11 -3.251309 2.020436e-03
12 -3.151309 2.782762e-03
13 -3.051309 3.794585e-03
14 -2.951309 5.122824e-03
15 -2.851309 6.847178e-03
16 -2.751309 9.060891e-03
17 -2.651309 1.187100e-02
18 -2.551309 1.539787e-02
19 -2.451309 1.977384e-02
20 -2.351309 2.514077e-02
21 -2.251309 3.164632e-02
22 -2.151309 3.943890e-02
23 -2.051309 4.866127e-02
24 -1.951309 5.944279e-02
25 -1.851309 7.189057e-02
26 -1.751309 8.607991e-02
27 -1.651309 1.020443e-01
28 -1.551309 1.197657e-01
29 -1.451309 1.391662e-01
30 -1.351309 1.601001e-01
31 -1.251309 1.823504e-01
32 -1.151309 2.056264e-01
33 -1.051309 2.295663e-01

#Wyświetlmy jedynie fragment naszej struktury:
Wyświetlam fragment gdzie w kolumnie x wartości są większe od -2
> lessThanNeg1[lessThanNeg1$x > -2,]
           x          y
24 -1.951309 0.05944279
25 -1.851309 0.07189057
26 -1.751309 0.08607991
27 -1.651309 0.10204428
28 -1.551309 0.11976574
29 -1.451309 0.13916615
30 -1.351309 0.16010013
31 -1.251309 0.18235043
32 -1.151309 0.20562644
33 -1.051309 0.22956632

> lessThanNeg1 <- rbind(c(min(randNorm), 0), lessThanNeg1,
+                       c(max(lessThanNeg1$x), 0))
> lessThanNeg1
           x            y
1  -4.251309 0.000000e+00
2  -4.251309 4.745396e-05
3  -4.151309 7.223256e-05
4  -4.051309 1.088555e-04
5  -3.951309 1.624146e-04
6  -3.851309 2.399147e-04
7  -3.751309 3.508695e-04
8  -3.651309 5.080323e-04
9  -3.551309 7.282730e-04
10 -3.451309 1.033604e-03
11 -3.351309 1.452349e-03
12 -3.251309 2.020436e-03
13 -3.151309 2.782762e-03
14 -3.051309 3.794585e-03
15 -2.951309 5.122824e-03
16 -2.851309 6.847178e-03
17 -2.751309 9.060891e-03
18 -2.651309 1.187100e-02
19 -2.551309 1.539787e-02
20 -2.451309 1.977384e-02
21 -2.351309 2.514077e-02
22 -2.251309 3.164632e-02
23 -2.151309 3.943890e-02
24 -2.051309 4.866127e-02
25 -1.951309 5.944279e-02
26 -1.851309 7.189057e-02
27 -1.751309 8.607991e-02
28 -1.651309 1.020443e-01
29 -1.551309 1.197657e-01
30 -1.451309 1.391662e-01
31 -1.351309 1.601001e-01
32 -1.251309 1.823504e-01
33 -1.151309 2.056264e-01
34 -1.051309 2.295663e-01
35 -1.051309 0.000000e+00
> p + geom_polygon(data=lessThanNeg1, aes(x=x, y=y))

> neg1Pos1Seq <- seq(from=-1, to =1, by=.1); neg1Pos1Seq
 [1] -1.0 -0.9 -0.8 -0.7 -0.6 -0.5 -0.4 -0.3 -0.2 -0.1  0.0  0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.0
> neg1To1 <- data.frame(x=neg1Pos1Seq, y=dnorm(neg1Pos1Seq)); neg1To1
      x         y
1  -1.0 0.2419707
2  -0.9 0.2660852
3  -0.8 0.2896916
4  -0.7 0.3122539
5  -0.6 0.3332246
6  -0.5 0.3520653
7  -0.4 0.3682701
8  -0.3 0.3813878
9  -0.2 0.3910427
10 -0.1 0.3969525
11  0.0 0.3989423
12  0.1 0.3969525
13  0.2 0.3910427
14  0.3 0.3813878
15  0.4 0.3682701
16  0.5 0.3520653
17  0.6 0.3332246
18  0.7 0.3122539
19  0.8 0.2896916
20  0.9 0.2660852
21  1.0 0.2419707
> neg1To1 <- rbind(c(min(neg1To1$x), 0), neg1To1, c(max(neg1To1$x), 0))
> neg1To1
      x         y
1  -1.0 0.0000000
2  -1.0 0.2419707
3  -0.9 0.2660852
4  -0.8 0.2896916
5  -0.7 0.3122539
6  -0.6 0.3332246
7  -0.5 0.3520653
8  -0.4 0.3682701
9  -0.3 0.3813878
10 -0.2 0.3910427
11 -0.1 0.3969525
12  0.0 0.3989423
13  0.1 0.3969525
14  0.2 0.3910427
15  0.3 0.3813878
16  0.4 0.3682701
17  0.5 0.3520653
18  0.6 0.3332246
19  0.7 0.3122539
20  0.8 0.2896916
21  0.9 0.2660852
22  1.0 0.2419707
23  1.0 0.0000000
> p + geom_polygon(data=neg1To1, aes(x=x, y=y))

#czym jest nasze prawdopodobieństwo?
jest to przybliżona wartość prawdopodobieństwa, ponieważ nie da się obliczyć dokładnej wartości


> randProb <- pnorm(randNorm)
> ggplot(data.frame(x=randNorm, y=randProb)) + aes(x=x, y=y) + geom_point() + labs(x = 'Random Normal Variables', y='Probability')

> randNorm10
 [1] -0.5584778  1.0586137 -0.4909225 -0.3308658 -0.6232205  1.1135125  0.1044090  1.2840715 -0.6892314  0.7813228
> all.equal(randNorm, qnorm(pnorm(randNorm)))
[1] TRUE

#Co uzyskaliśmy? 0,1,T,F…?
Uzyskana wartość: True


ZAD.2.
Rozkład dwumianowy, czyli rozkład Bernoulliego

> rbinom(n=1, size=10, prob=.4)
[1] 2
> rbinom(n=1, size=10, prob=.4)
[1] 4
> rbinom(n=5, size=10, prob=.4)
[1] 3 2 3 6 5
> rbinom(n=10, size=10, prob=.4)
 [1] 5 4 5 6 3 4 8 1 8 7
> rbinom(n=1, size=1, prob=.4)
[1] 1
> rbinom(n=5, size=1, prob=.4)
[1] 0 0 1 0 0
> rbinom(n=10, size=1, prob=.4)
 [1] 1 0 0 0 0 0 0 1 0 1
> binomData <- data.frame(Successes=rbinom(n=10000, size=10, prob=.3))
> ggplot(binomData, aes(x=Successes)) + geom_histogram(binwidth=1)
> Binom5 <- data.frame(Successes=rbinom(n=10000, size=5, prob=.3), Size=5)
> dim(Binom5)
[1] 10000     2
> head(Binom5)
  Successes Size
1         1    5
2         1    5
3         3    5
4         0    5
5         1    5
6         0    5

> Binom10 <- data.frame(Successes=rbinom(n=10000, size=10, prob=.3), Size=10)
> dim(Binom10)
[1] 10000     2
> head(Binom10)
  Successes Size
1         3   10
2         2   10
3         6   10
4         3   10
5         4   10
6         3   10

> Binom100 <- data.frame(Successes=rbinom(n=10000, size=100, prob=.3), Size=100)
> dim(Binom100)
[1] 10000     2
> head(Binom100)
  Successes Size
1        35  100
2        29  100
3        31  100
4        28  100
5        26  100
6        34  100

> Binom1000 <- data.frame(Successes=rbinom(n=10000, size=1000, prob=.3), Size=1000)
> binomAll <- rbind(Binom5, Binom10, Binom100, Binom1000)
> dim(binomAll)
[1] 40000     2

> ggplot(binomAll, aes(x=Successes)) + geom_histogram() + facet_wrap(~ Size, scales='free')
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

> dbinom(x=3, size=10, prob=.3)
[1] 0.2668279
> pbinom(q=3, size=10, prob=.3)
[1] 0.6496107
> dbinom(x=1:10, size=10, prob=.3)
 [1] 0.1210608210 0.2334744405 0.2668279320 0.2001209490 0.1029193452
 [6] 0.0367569090 0.0090016920 0.0014467005 0.0001377810 0.0000059049
> pbinom(q=1:10, size=10, prob=.3)
 [1] 0.1493083 0.3827828 0.6496107 0.8497317 0.9526510 0.9894079
 [7] 0.9984096 0.9998563 0.9999941 1.0000000
> qbinom(p=.3, size=10, prob=.3)
[1] 2
> qbinom(p=c(.3, .35, .4, .5, .6), size=10, prob=.3)
[1] 2 2 3 3 3
ZAD.3.
Rozkład Poissona

> pois1 <- rpois(n=10000, lambda=1)
> pois2 <- rpois(n=10000, lambda=2)
> pois5 <- rpois(n=10000, lambda=5)
> pois10 <- rpois(n=10000, lambda=10)
> pois20 <- rpois(n=10000, lambda=20)
> pois <- data.frame(Lamda.1=pois1, Lamda.2=pois2,
+                    Lamda.5=pois5, Lambda.10=pois10, Lambda.20=pois20)

> pois <- melt(data=pois, variable.name='Lambda', value.name='x')
> library(stringr)
> pois$Lambda <- as.factor(as.numeric(str_extract(string=pois$Lambda, pattern="\\d+")))
> head(pois)
  Lambda x
1      1 0
2      1 0
3      1 3
4      1 0
5      1 3
6      1 0
> tail(pois)
      Lambda  x
49995     20 18
49996     20 20
49997     20 21
49998     20 24
49999     20 22
50000     20 15
> ggplot(pois, aes(x=x)) + geom_histogram(binwidth=1) + facet_wrap(~ Lambda) + ggtitle("Probability Mass Function")
> ggplot(pois, aes(x=x)) + geom_density(aes(group=Lambda, color=Lambda, fill=Lambda), adjust=4, alpha=1/2) + scale_color_discrete() + scale_fill_discrete() + ggtitle("Probability Mass Function")

ZAD.4. 
1.1 Co to jest hipoteza statystyczna?
Dowolne przypuszczenie dotyczące rozkładu populacji – postaci funkcyjnej lub wartości parametru rozkładu.
1.2 Jakie są podstawowe rodzaje hipotez statystycznych?
Parametrzyczne i nieprarametryczne.
1.3 Co to jest weryfikacja hipotezy? Kiedy się odbywa?
Wyznaczenie poziomu istotności obszaru krytycznego.
1.4 Czym są testy statystyczne parametryczne, a czym nieparametryczne?
Testy hipotez parametrycznych to testy istotności, a testy hipotez nieparametrycznych to testami zgodności. 
1.5 Co to jest hipoteza zerowa?
Hipoteza wynikająca z pytania badawczego, którą weryfikujemy.
1.6 Co to jest hipoteza alternatywna?
Zaprzeczenie hipotezy zerowej.
1.7 Co rozstrzyga test statystyczny?
weryfikuje prawdziwość hipotez.
1.8 Co to jest błąd I rodzaju?
Polega na tym, że prawdziwa hipoteza została odrzucona
1.9 Co to jest błąd II rodzaju?
Polega na tym, że fałszywa hipoteza nie została odrzucona
1.10 Co to jest test istotności, a czym poziom istotności?
metoda statystyczna, która służy do oceny, czy różnica między dwoma badanymi zjawiskami lub grupami 
jest istotna statystycznie czy też jest to zbieg okoliczności. Poziom istotności to prawdopodobieństwo, 
że różnica między dwoma badanymi zjawiskami lub grupami jest istotna, a wynik badania jest tylko przypadkowy. 
Wartość poziomu istotności jest określana przez badacza przed rozpoczęciem badania i oznacza ona 
prawdopodobieństwo błędu typu I, czyli prawdopodobieństwo, że badanie wykazało istotną różnicę, 
chociaż w rzeczywistości takiej różnicy nie ma.
1.11 Co to jest moc testu?
Prawdopodobieństwo uniknięcia przyjęcia hipotezy zerowej, gdy jest fałszywa.
1.12 Wymień etapy weryfikacji hipotez.
- Określenie hipotezy badawczej 
- Przygotowanie i przeprowadzenie badania
- Analiza danych 
- Weryfikacja hipotezy 
- Publikacja wyników 
1.13 Czym jest obszar krytyczny testu?
Obszar krytyczny testu to zakres wartości statystycznych, które są uważane za istotne różnice w wynikach badania.

Zadanie:
Wzrost pewnej grupy osób opisany jest rozkładem normalnym o wartości oczekiwanej 173 cm i odchyleniu standardowym 6 cm
• Jakie jest prawdopodobieństwo, że losowo wybrana osoba ma nie więcej, niż 179 cm wzrostu?
• Jaka jest frakcja osób mających wzrost pomiędzy 167 i 180 cm?
• Jakie jest prawdopodobieństwo, że losowo wybrana osoba ma więcej, niż 181 cm wzrostu?
• Wyznacz wartość wzrostu, której nie przekracza 60% badanej populacji

1)
> pnorm(179, mean=173, sd=6)
[1] 0.8413447
2)
> fraction <- pnorm(180, 173, 6) - pnorm(167, 173, 6)
> print(fraction)
[1] 0.7196722
3)
p <- pnorm(181, mean=173, sd=6)
# dzielę wynik przez 2, aby obliczyć prawdopodobieństwo, że losowo wybrana osoba ma więcej niż 181 cm wzrostu
result <- p / 2
print(result)
[1] 0.4543944
4)
> qnorm(p = 0.6, mean = 173, sd = 6)
[1] 174.5201
