#!/bin/bash

counter=1
while [ $counter -le 20 ]
do
	./run_synthea -p 2000
	find ./output/fhir -name "*\'*" -exec rm -rf "{}" \; && grep -i Asthma ./output/fhir/* -l | xargs -I {} cp {} ./output/asthma-patients/ && rm -rf ./output/fhir/*
done

ls ./output/asthma-patients | wc -l 
