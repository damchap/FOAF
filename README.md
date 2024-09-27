# TP 1

## Exercice 1

### Consignes

Créer son fichier foaf.rdf et l’associer à sa page « homepage » web (page de
présentation).
Déposer sur github (cf annexe)
(cerise sur le gateau valider sa homepage par le validateur du w3c
« https://www.w3.org/RDF/Validator/ »)

### Réalisation

  le fichier `foaf.rdf` contient les informations suivantes:
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
         xmlns:foaf="http://xmlns.com/foaf/0.1/">

  <foaf:Person>
    <foaf:name>Damien Chapart</foaf:name>
    <foaf:givenName>Damien</foaf:givenName>
    <foaf:familyName>Chapart</foaf:familyName>
    <foaf:mbox rdf:resource="mailto:damien.chapart@etudiant.univ-lr.fr"/>
    <foaf:homepage rdf:resource="http://www.damienchapart.com"/>
    <foaf:workplaceHomepage rdf:resource="http://www.example.com"/>
    <foaf:depiction rdf:resource="http://www.damienchapart.com/photo.jpg"/>
    <foaf:knows>
      <foaf:Person>
        <foaf:name>Damien Chapart</foaf:name>
      </foaf:Person>
    </foaf:knows>
  </foaf:Person>

</rdf:RDF>
```

Il a été vérifier avec le validateur [en ligne de W3C](https://www.w3.org/RDF/Validator/rdfval) et il est valide.

![Validateur W3C](img/validateur.png)

ensuite, j'ai ecire l'`index.html` pour afficher les informations de ce fichier rdf.

ensuite, j'ai utilisé le workflow github pour deployer le site sur github pages.

#### Le status du workflow est le suivant:
![example workflow](https://github.com/damchap/FOAF/actions/workflows/.github/workflows/static.yml/badge.svg)

#### Le site est disponible sur:

Disponible sur [github pages](https://damchap.github.io/FOAF/)


## Exercice 2

### Consignes
Faire une transformation xsl pour visualiser en xhtml la page foaf.rdf. Ecrire au tableau
l’URL de votre page foaf.rdf et ajouter des références aux autres pages (Connaissances).

### Réalisation

J'ai créé un fichier `foaf.xsl` pour utiliser le fichier `foaf.rdf` et le transformer en `xhtml`.


## Exercice 3

### Consignes
Créer un compte sur ORCID et utiliser curl pour récupérer les éléments de votre compte
(en particulier avec les éléments foaf)

### Réalisation

J'ai créé un compte sur [ORCID](https://orcid.org/0000-0002-1825-0097) et j'ai utilisé `curl` pour récupérer les informations de mon compte.

```bash
curl -L -H "Accept: application/rdf+xml" https://orcid.org/0009-0003-8633-0771
```

## Exercice 4

### Consignes
Utiliser le moteur ldspider pour « crawler » vos pages et/ou « http://sixhills-consulting.com/foaf/agueritz/foaf.rdf » pour découvrir d’autres personnes foaf. Conserver
le résultat du crawling pour la suite. (On pourra utiliser tinyproxy pour simplifier l’utilisation
du web sur les vm en salle réseau MSI)

### Réalisation

Avec le jar `ldspider-1.1.0-jar-with-dependencies.jar` j'ai lancé la commande suivante:

```bash
#!/bin/bash
java -jar ldspider-1.3-with-dependencies.jar -c 1 -f rdfxml -o /tmp/ldspider http://sixhills-consulting.com/foaf/agueritz/foaf.rdf
```

```bash
❯ java -jar ldspider-1.3-with-dependencies.jar http://sixhills-consulting.com/foaf/agueritz/foaf.rdf
SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
usage:   [-a <filename[.gz]>] [-accept <MIME Types>] [-any23] [-any23ext <any23
       extractor names>] -b <depth uri-limit pld-limit> | -c <max-uris> | -d
       <directory> [-bl <extensions>]  [-ctIgnore] [-cto <time in ms>]  [-dbfq]
       [-dbfqInput <filename>] [-dbfqSave <basefilename>] [-df <base filename>]
       [-dh <filename>] [-dr] [-ds <filename>] [-e] [-f <uris> | -n | -y <host>]
       [-h] [-hopsplit] [-lfADignore] [-m <frontier-file>] [-mapseed] [-minpld
       <min. # of active PLDs>] [-mr <max. # of redirects>]  [-o <filename[.gz]>
       | -oe <uri>]  [-polite <time in ms>] [-r <filename[.gz]>] [-resumebfc
       <seenfile redirectsfile>] [-rf] -s <file> [-sdf <sort gzip>] [-sto <time
       in ms>] [-t <threads>] [-ul <number>] [-v <filename[.gz]>]
ERROR: Missing required options: s, [-b do strict breadth-first (uri-limit and
pld-limit optional), -c use load balanced crawling strategy, -d download seed
URIs and archive raw data]
 -a <filename[.gz]>                       name of access log file
 -accept <MIME Types>                     Change the HTTP Accept header to the
                                          one supplied
 -any23                                   Use any23 for extending the formats
                                          available to parse.
 -any23ext <any23 extractor names>        Override the defaultly selected
                                          extractors that are to be loaded with
                                          any23. Leave empty to use all any23
                                          has available. Default: [html-rdfa11,
                                          rdf-xml, rdf-turtle, rdf-nt, rdf-nq,
                                          html-script-turtle]
 -b <depth uri-limit pld-limit>           do strict breadth-first (uri-limit and
                                          pld-limit optional)
 -bl <extensions>                         overwrite default suffixes of files
                                          that are to be ignored in the crawling
                                          with the ones supplied. Note: no
                                          suffix is also an option. Default:
                                          [.txt, .html, .xhtml, .json, .ttl,
                                          .nt, .jpg, .pdf, .htm, .png, .jpeg,
                                          .gif]
 -c <max-uris>                            use load balanced crawling strategy
 -ctIgnore                                Parse and fetch disrespective of
                                          content-type
 -cto,--connection-timeout <time in ms>   Set connection timeout. Default:
                                          32000ms
 -d <directory>                           download seed URIs and archive raw
                                          data
 -dbfq                                    Uses the on-disk BreadthFirstQueue if
                                          crawling breadth-first. Doesn't
                                          support uri-limit and pld-limit (see
                                          -b). Needs -sdf sort to be set. Ranks
                                          URIs on the PLDs according to their
                                          in-link count.
 -dbfqInput <filename>                    For the on-disk breadth-first queue
                                          (-dbfq), use this file as input for
                                          the eternal in-link count.
 -dbfqSave <basefilename>                 For the on-disk breadth-first queue
                                          (-dbfq), save the eternal in-link
                                          count per URI after each hop to this
                                          file.
 -df <base filename>                      Dump frontier after each round to file
                                          (only breadth-first). File name
                                          format: <base filename>-<round number>
 -dh <filename>                           Dump header information to a separate
                                          file. It makes no sense to set -e at
                                          the same time.
 -dr                                      Don't use Redirects.class for
                                          Redirects handling
 -ds <filename>                           Choose the on-disk Seen
                                          implementation. Argument: basefilename
 -e                                       omit header triple in data
 -f,--follow <uris>                       only follow specific predicates
 -h,--help                                print help
 -hopsplit                                split output hopwise
 -lfADignore                              Make No difference between A and T box
                                          in crawling
 -m <frontier-file>                       memory-optimised (puts frontier on
                                          disk)
 -mapseed                                 Sets if the minimum active plds should
                                          already be taken into account
                                          downloading the seedlist.
 -minpld <min. # of active PLDs>          In order to avoid PLD starvation, set
                                          the minimum number of active plds for
                                          each breadth first queue round. The
                                          seedlist is always downloaded
                                          completely (see -mapseed).
 -mr <max. # of redirects>                Specify the length a redirects (30x)
                                          is allowed to have at max. (default:
                                          4; with seq.strategy: 1).
 -n                                       do not extract links - just follow
                                          redirects
 -o <filename[.gz]>                       name of NQuad file with output
 -oe <uri>                                SPARQL/Update endpoint for output
 -polite <time in ms>                     Time to wait between two requests to a
                                          PLD.
 -r <filename[.gz]>                       write redirects.nx file
 -resumebfc <seenfile redirectsfile>      Resume an interrupted breadth-first
                                          crawl. Requires a seen file and a
                                          redirects file. The old frontier
                                          should be the seedlist.
 -rf,--rankFrontier                       If set, the URIs in frontier are
                                          ranked according to their number of
                                          in-links, and alphabetically as second
                                          ordering. Use this option for
                                          something like a priority queue.
 -s <file>                                location of seed list
 -sdf <sort gzip>                         Use SortingDiskFrontier as frontier.
                                          If URIs are to be returned sorted, add
                                          "sort" as value, if all temp files
                                          involved are to be gzipped, add
                                          "gzip".
 -sto,--socket-timeout <time in ms>       Set socket timeout. Default: 32000ms
 -t <threads>                             number of threads (default 2)
 -ul <number>                             Sets a limit for the Uris downloaded
                                          overall containing >0 stmts. Hits the
                                          interval [limit;limit+#threads]. Not
                                          necessarily intended for load-balanced
                                          crawling.
 -v <filename[.gz]>                       name of file logging rounds
 -y,--stay <host>                         stay on host with given name

Error occured! Please see the error message above
❯ java -jar ldspider-1.3-with-dependencies.jar -b 10 -s foaf.rdf
SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Main run
INFO: reading seeds from /Users/damchap/Documents/Perso_Damien/Cours/niort/M2/WebSementique/FOAF/foaf.rdf
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Main run
INFO: loading seedlist into frontier
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Main run
INFO: frontier done
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Main run
INFO: init crawler
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.internal.CloseIdleConnectionThread <init>
INFO: Initialised CloseIdleConnectionThread with sleepTime 60000 ms
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.internal.CloseIdleConnectionThread run
INFO: Starting CloseIdleConnectionThread
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.internal.CloseIdleConnectionThread run
INFO: Closing expired and idle connections
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Main run
INFO: breadth-first crawl with 2 threads, depth 10 maxuris -1 maxplds -1 minActivePlds unspecified
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 1 ms. This was schedule No. 1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 0 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 0 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 0 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 1 ms. This was schedule No. 2
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 1 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 1 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 1 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 1 ms. This was schedule No. 3
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 2 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 2 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 2 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 0 ms. This was schedule No. 4
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 3 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 3 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 3 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 0 ms. This was schedule No. 5
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 4 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 4 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 4 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 0 ms. This was schedule No. 6
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 5 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 5 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 5 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 1 ms. This was schedule No. 7
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 6 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 6 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 6 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 0 ms. This was schedule No. 8
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 7 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 7 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 7 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 0 ms. This was schedule No. 9
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 8 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 8 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 8 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 1 ms. This was schedule No. 10
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 9 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 9 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 9 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 0 ms. This was schedule No. 11
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.

Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Starting threads round 10 with 0 uris
LT-0
LT-1
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: starting thread ...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.LookupThread run
INFO: finished thread after fetching 0 uris; 0 in all threads overall until now (0 with non-empty RDF).
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: ROUND 10 DONE with 0 uris remaining in queue
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.Crawler evaluateBreadthFirst
INFO: Last non-empty context of this hop (# 10 ): null
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: start scheduling...
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: sorted pld list (sorted only if maximum for plds or uris has been set) []
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: scheduling 0 plds done (0 URIs) in 0 ms. This was schedule No. 12
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.queue.BreadthFirstQueue schedule
INFO: Plus 0 redirects.


Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.internal.CloseIdleConnectionThread shutdown
INFO: Stopping CloseIdleConnectionThread
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.http.internal.CloseIdleConnectionThread run
INFO: Stopped CloseIdleConnectionThread
time elapsed 199 ms 0.0 lookups/sec
Sep 26, 2024 1:21:30 PM com.ontologycentral.ldspider.CloseablesCloser run
INFO: Closing down some closeables...
```