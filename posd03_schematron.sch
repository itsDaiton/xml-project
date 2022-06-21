<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="https://www.posd03-ns.cz/LS2021" prefix="prefix"/>
    
    <!-- Kontrola, jestli je rozdíl dat 10 let, tj. jestli je platnosti průkazu opravdu 10 let. -->
    <pattern>
        <title>Kontrola platnosti průkazu</title>
        <rule context="prefix:obcansky_prukaz">
            <report test="prefix:platnost[1]/prefix:datum[2]/prefix:rok[1] != (prefix:platnost[1]/prefix:datum[1]/prefix:rok[1]) + 10">
                Průkaz musí být platný 10 let od jeho vydání.
                Současná platnost je: <value-of select="prefix:platnost[1]/prefix:datum[2]/prefix:rok[1] - prefix:platnost[1]/prefix:datum[1]/prefix:rok[1]"/> let.
            </report>
        </rule>
    </pattern>
      
</schema>