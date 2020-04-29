---
title: "Plagues of the Past and Present"
authors: "Katherine Eaton"
dataset: "http://localhost:4000/plague150Local?d=map&legend=closed"
abstract: "
'The Plague' is a mystifying and devastating disease that has re-emerged multiple times throughout history. From the Plague of Justinian (6th century) to the Madagascar Plague Outbreak (2017), this infectious disease has resulted in exceptional mortality and societal upheaval.

### While our knowledge of plague has grown tremendously, there are many outstanding questions:
<br><br>
1. __Where__ did the ancient pandemics originate?  
<br>
2. __When__ might modern plague foci re-activate?  
<br>
3. __Why__ does plague no longer exist in Western Europe?
<br>
4. __How__ does a city respond to losing 50% of its population?
<br><br>

### The mysteries of plague bring together researchers from a wide variety of disciplines from art history to microbiology. While each field stands to make a unique contribution, there remains a unified fascination over how people are affected and cope with this disease, as well as where, when, and why it suddenly appears...
"
---

<!-- This is left-side text 2 -->
# [Origins: The Ancient Plagues](http://localhost:4000/plague150Local?d=map)
#### The plagues of the ancient world have intriguing geographic origins.

#### Early hypotheses on the 'origins' of the ancient pandemics varied greatly including regions in Central and East Africa, the Middle East, as well as Western and Central Asia [(Dols, 1974](https://www.jstor.org/stable/600071); [Dols, 1979](https://www.jstor.org/stable/3631953); [Benedictow, 2010)](https://books.google.ca/books/about/The_Black_Death_1346_1353.html?id=KjLHAOE7irsC).<br>

# The Power of Maps

#### Iconic maps produced in the mid-20th century have largely influenced the discussion of geographic and temporal spread of plague [(Mengel, 2011)](https://academic.oup.com/past/article-abstract/211/1/3/1381253). The historical sources used to estimate plague mortality consist of documents such as parish records, financial transactions, wills, and local testimonies [(Christakos et al. 2005)](https://www.springer.com/gp/book/9783540257943).

### However, these source documents can be of poor quality or are sparsely found leading to high levels of uncertainty [(Skog and Hauska, 2013)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1467-9671.2012.01369.x). As a result, the historical sources used in the construction of these maps are experiencing renewed critical re-examination  [(Bossak and Welford, 2015)](https://www.taylorfrancis.com/books/e/9781315610252/chapters/10.4324%2F9781315610252-12).

<!-- This is right-side text 2-->
```auspiceMainDisplayMarkdown

<div>
  <a href="https://nextstrain.org/help/coronavirus/human-CoV">
    <img alt="microscopy image of coronaviruses" width="500" src="https://www.researchgate.net/profile/Anne_Laudisoit2/publication/315837122/figure/fig1/AS:652961457897473@1532689551350/a-leftThe-origin-and-spread-of-Justinian-plague.png"/>
      <pre>                    Spread of the Justinian Plague (Laudisoit, 2009)</pre>
  </a>

  <a href="https://nextstrain.org/help/coronavirus/SARS-CoV-2">
    <img alt="illustration of a coronavirus" width="600" src="https://cdn.britannica.com/98/6698-050-B961849A/pandemic-Europe-Black-Death.jpg"/>
      <pre>                          Spread of the Black Death Plague (Laudisoit, 2009)</pre>
  </a>

</div>

```

<!-- This is left-side text 3-->
# [Origins: Through a New Lens](http://localhost:4000/plague150Local?d=map&animate=1400-01-01,2017-01-01,0,1,30000)
#### In contrast to the historical perspective, genetic evidence offers a very different narrative.

### Advances in DNA sequencing have made it possible to rapidly sequence the genome of the plague bacterium, *Yersinia pestis*, from outbreak sources across the globe.

#### By examining the relationships between modern plague outbreaks, researchers demonstrated that plague evolved in or near East Asia with multiple global radiations throughout history [(Morelli et al. 2010)](https://www.nature.com/articles/ng.705).

# [Origins: Ancient DNA](http://localhost:4000/plague150Local?d=map&country=sweden)
#### But the picture grows murkier still. Ancient plague DNA retrieved from victims of past epidemics provides new windows into the past.
<a href="https://www.history.com/news/is-the-black-death-the-ancestor-of-all-modern-plagues">
  <img src="https://www.history.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_686/MTU3ODc4NTk4NjgzOTI4Mjg3/image-placeholder-title.webp" width="70%">
        <pre>     London's East Smithfield "plague pits", 1348-1349.</pre>
</a>

#### A recent study identified the plague bacterium in skeletal remains from Sweden 4,900 years ago [(Rascovan et al. 2019)](https://doi.org/10.1016/j.cell.2018.11.005). This finding yet again prompts alternative hypotheses concerning the spread of plague across Eurasia. The case is anything but closed.
<a href="https://doi.org/10.1016/j.cell.2018.11.005">
  <img src="https://raw.githubusercontent.com/ktmeaton/plague-phylogeography/master/narratives/images/neolithic-map-1.png" width="80%">
        <pre>   The Spread of Neolithic Plague (Rascovan et al. 2019) </pre>
</a>

<!-- This is left-side text 4-->
# [Evolution: A Time Vortex](http://localhost:4000/plague150Local?d=tree&l=clock&m=time)
#### To critique the previous maps on the spread of plague, it is important to consider several statistical problems.

#### To model the past using genetic data, we make and test theories about how evolution proceeds over time.

#### Unfortunately, plague does not follow the rules of a **"molecular clock"**, where evolution should occur at a constant rate. Under this model, a 'younger' strain (ex. collected in 2000) should have more mutations than an 'older' strain (ex. collected in 1950).

#### Instead, there are dramatic fluctuations where the bacterium may "speed up" or "slow down" it's pace and mode of evolution [(Cui et al. 2013)](https://www.pnas.org/content/110/2/577.long).

# Regression

#### The visual to the right compares time on the X-axis (the date) with the mutations that have occurred on the Y-axis (divergence). The dots represent plague samples, and ideally they should fall close to the dark black line.

#### The bubbles above the black line have **more** mutations than expected, and those below the black line have **fewer** mutations than expected.

#### How can we a reconstruct geographic spread over time, with evidence that behaves so chaotically?

<!-- This is left-side text 5-->
# [Ecology: Plague's Not Picky](http://localhost:4000/plague150Local?d=tree&c=host&legend=open)
#### The solution could be in understanding **why** this disease does not evolve in a "clock-like" manner. And a clue may lie in considering the ecology of plague.

#### Although plague is primarily a disease of rodents, virtually all mammals are capable of becoming infected when exposed [(Gage and Kosoy, 2006)](http://reviverestore.org/wp-content/uploads/2015/02/Gage-and-Kosoy_USGS-Blk-footed-ferret-symp_2006-copy.pdf). The movement of plague between novel hosts and environments may be a key factor in explaining why the rate of evolution changes so suddenly.

#### The accompanying visual is a **phylogenetic tree**, where the bubbles again represent plague samples and the connecting lines show their degree of relatedness. The color indicates what mammalian host or flea vector the bacteria was isolated from.
#### [How to read a phylogeny](https://nextstrain.org/narratives/trees-background/).

#### No obvious patterns emerge as the colors appear 'randomly' distributed. But perhaps the [rodent subfamily Arvicolinae](http://localhost:4000/plague150Local?c=host&d=tree&f_host=Microtus,Neodon,Lasiopodomys) is tentatively associated with extra-long branch lengths (ie. excessive mutation).

#### New perspectives on exploratory data analysis that are ecologically-grounded have great potential to yield greater insight.

<!-- This is left-side text 6-->
# [Ecology: Human Spillover](http://localhost:4000/plague150Local?c=host&d=tree,map&f_host=Homo&legend=closed)
General text that introduce how plague easily moves between species. Especially humans!

<!-- This is left-side text 7-->
# [Future: Digital Scholarship](http://localhost:4000/plague150Local?d=map)
Digital scholarship paving the way to new understanding!

# [References (Update Zotero)](http://localhost:4000/plague150Local?d=tree,map&legend=closed)
Bossak, B. H. & Welford, M. R. (2015). [Spatio-Temporal Characteristics of the Medieval Black Death](https://www.taylorfrancis.com/books/e/9781315610252/chapters/10.4324%2F9781315610252-12). In E. Delmelle, A. Páez, & P. Kanaroglou (Eds.), Spatial Analysis in Health Geography. Surrey, England: Ashgate Publishing Limited.
<br><br>
Christakos, G., Olea, R. A., Serre, M. A., Yu, H.-L., & Wang, L.-L. (2005). [Interdisciplinary Public Health Reasoning and Epidemic Modelling: The Case of the Black Death](https://www.springer.com/gp/book/9783540257943). Springer-Verlag Berlin Heidelberg.
<br><br>
Cui, Y., Yu, C., Yan, Y., Li, D., Li, Y., Jombart, T., . . . Yang, R. (2013). [Historical variations in
mutation rate in an epidemic pathogen, *Yersinia pestis*](https://www.pnas.org/content/110/2/577.long). *PNAS*, 110 (2), 577–582.
<br><br>
Dols, M. (1974). [Plague in Early Islamic History](https://www.jstor.org/stable/600071). *Journal of the American Oriental Society*, 94(3), 371-383. doi:10.2307/600071
<br><br>
Dols, M. (1979). [The Second Plague Pandemic and Its Recurrences in the Middle East: 1347-1894](https://www.jstor.org/stable/3631953). *Journal of the Economic and Social History of the Orient*, 22(2), 162-189. doi:10.2307/3631953
<br><br>
Gage, K. & Kosoy, M. (2006). [Recent trends in plague ecology](http://reviverestore.org/wp-content/uploads/2015/02/Gage-and-Kosoy_USGS-Blk-footed-ferret-symp_2006-copy.pdf). *USG Survey*, 213–231.
<br><br>
Skog, L. & Hauska, H. (2013). [Spatial modeling of the Black Death in Sweden](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1467-9671.2012.01369.x). *Transactions in GIS*, 17 (4), 589–611.
<br><br>
Laudisoit 2009
<br><br>
Mengel 2011
<br><br>
Morelli, G., Song, Y., Mazzoni, C. J., Eppinger, M., Roumagnac, P., Wagner, D. M., . . . Achtman, M. (2010). [*Yersinia pestis* genome sequencing identifies patterns of global phylogenetic diversity](https://www.nature.com/articles/ng.705). *Nature Genetics*, 42, 1140–1143.