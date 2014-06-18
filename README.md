# kb-sparql-queries

Miscellaneous queries (in [SPARQL]) for browsing and extracting data reports from the RDF graph in the Phenoscape KB.

## Submitting queries

SPARQl queries can be submitted from the command line using `curl`:


    $ curl -X POST --data-binary @search_character_descriptions.rq \
                   --header "Content-Type:application/sparql-query" \
                   --header "Accept: text/tab-separated-values" \
                   http://localhost:8080/bigdata/sparql > result.txt
  
You will need to replace the endpoint URI (`http://localhost:8080/bigdata/sparql` in the command line above) with the correct location of the SPARQL service.

[SPARQL]: http://www.w3.org/TR/sparql11-overview/
