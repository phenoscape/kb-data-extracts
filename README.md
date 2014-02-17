# kb-sparql-queries

Miscellaneous queries which are useful for navigating Phenoscape KB data.

## Submitting queries

SPARQl queries can be submitted from the command line using `curl`:
    curl -X POST --data-binary @search_character_descriptions.rq --header "Content-Type:application/sparql-query" --header "Accept: text/tab-separated-values" http://localhost:8080/bigdata/sparql >result.txt
  
You will need to replace the endpoint URI with the correct location of the SPARQL service.
