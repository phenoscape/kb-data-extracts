#!/usr/bin/env bash

#SPARQL_ENDP=http://kb-dev.phenoscape.org/bigsparql
SPARQL_ENDP=https://stars-app.renci.org/phenoscape/sparql
OWLERY=https://kb.phenoscape.org/owlery
queries=$@

if [ -z $queries ] ; then
  queries=$(ls *.rq)
fi

for query in $queries ; do
  if grep -v "^#" ${query} | grep "\^\^ow:omn" > /dev/null ; then
    echo "Expanding OWL expression embedded in ${query}"
    curl -X POST --data-binary "@"${query} \
                 --header "Content-type: application/sparql-query" \
                 -s ${OWLERY}/kbs/phenoscape/expand > ${query}.expanded.rq
    rq=${query}.expanded.rq
  else
    rq=${query}
  fi
  echo "Running ${query}"
  curl -X POST --data-binary "@"${rq} \
               --header "Content-Type: application/sparql-query" \
               --header "Accept: text/tab-separated-values" \
               $SPARQL_ENDP > $query.result.txt
done
