<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:prefix="https://www.posd03-ns.cz/LS2021"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="prefix"
                version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <fo:root language="cs" font-family="Segoe UI">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="pdf-page" 
                                       page-height="297mm" 
                                       page-width="210mm" 
                                       >
                    <fo:region-body margin="15mm"/>
                    <fo:region-before extent="10mm"/>
                    <fo:region-after extent="10mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="pdf-page">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block margin-top="5mm" margin-right="5mm" text-align="right">
                        David Poslušný, posd03
                    </fo:block>
                </fo:static-content>
                
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center">
                        <xsl:text>Strana </xsl:text>
                        <fo:page-number/>
                    </fo:block>                    
                </fo:static-content>              
                
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block text-align="center" font-size="36px">
                        <fo:inline font-weight="bold">Evidence občanských průkazů</fo:inline>
                    </fo:block>
                    
                    <fo:block text-align="center">
                        <fo:external-graphic src="url(img/vse_logo.png)"/>
                    </fo:block>
                    
                    <fo:block text-align="center" font-size="30px" margin-bottom="50px">
                        <fo:inline font-weight="bold">Semestrální práce</fo:inline>
                    </fo:block>
                    
                    <fo:block text-align="center" font-size="24px" margin="30px">
                        <fo:inline>Autor: David Poslušný</fo:inline>
                    </fo:block>
                    
                    <fo:block text-align="center" font-size="24px"  margin="30px">
                        <fo:inline>Předmět: 4IZ238 XML - Teorie a praxe značkovacích jazyků</fo:inline>
                    </fo:block>
                    
                    <fo:block text-align="center" font-size="24px"  margin="30px">
                        <fo:inline>Semestr: LS 2020/2021</fo:inline>
                    </fo:block>                    
                    
                    <fo:block text-align="center" font-size="36px" break-before="page">
                        <fo:inline font-weight="bold">Obsah</fo:inline>
                    </fo:block>
                    
                    <fo:block font-size="20px" margin-top="15px" margin-bottom="15px">
                        <fo:basic-link internal-destination="prukazy">
                            <xsl:text>&#8226;</xsl:text>
                            <xsl:text>&#032;</xsl:text>
                            <fo:inline font-weight="bold">Občanské průkazy</fo:inline>
                        </fo:basic-link>
                    </fo:block>
                    
                    <fo:block font-size="20px"  margin-top="15px" margin-bottom="15px">
                        <fo:basic-link internal-destination="zaznamy">
                            <xsl:text>&#8226;</xsl:text>
                            <xsl:text>&#032;</xsl:text>
                            <fo:inline font-weight="bold">Záznamy o platnosti</fo:inline>
                        </fo:basic-link>
                    </fo:block>
                    
                    <xsl:for-each select="//soubor">
                        <fo:block>                         
                            <fo:basic-link internal-destination="{generate-id(document(@name)/prefix:obcansky_prukaz)}">
                                <xsl:text>&#9642;</xsl:text><xsl:text>&#032;</xsl:text>
                                <xsl:value-of select="document(@name)//@id"/> - <xsl:value-of select="document(@name)//prefix:jmeno"/>
                                <xsl:text>&#032;</xsl:text>
                                <xsl:value-of select="document(@name)//prefix:prijmeni"/>                              
                            </fo:basic-link>
                        </fo:block>
                    </xsl:for-each>                    
                    
                    <fo:block font-size="20px"  margin-top="15px" margin-bottom="15px">
                        <fo:basic-link internal-destination="ukazka">
                            <xsl:text>&#8226;</xsl:text>
                            <xsl:text>&#032;</xsl:text>
                            <fo:inline font-weight="bold">Ukázka občanského průkazu</fo:inline>
                        </fo:basic-link>
                    </fo:block>
                    
                    <fo:block id="zaznamy" text-align="center" font-size="36px" break-before="page">
                        <fo:inline font-weight="bold">Záznamy o platnosti průkazů</fo:inline>
                    </fo:block>                      
                    
                    <fo:table margin-top="20px">
                        <fo:table-column border-style="solid"/>
                        <fo:table-column border-style="solid"/>
                        <fo:table-column border-style="solid"/>
                        <fo:table-column border-style="solid"/>
                        <fo:table-column border-style="solid"/>
                        <fo:table-column border-style="solid"/>
                        <fo:table-header font-weight="bold" border-style="solid" text-align="center">
                            <fo:table-row>
                                <fo:table-cell padding="5px">
                                    <fo:block>
                                        ID průkazu
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5px">
                                    <fo:block>
                                        Rodné číslo
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5px">
                                    <fo:block>
                                        Jméno
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5px">
                                    <fo:block>
                                        Přijmení
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5px">
                                    <fo:block>
                                        Platnost od:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5px">
                                    <fo:block>
                                        Platnost do:
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>                            
                        </fo:table-header>
                        <fo:table-body text-align="center">
                            <xsl:for-each select="//soubor">
                                <fo:table-row>
                                    <fo:table-cell padding="5px">
                                        <fo:block>
                                            <xsl:value-of select="document(@name)//@id"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="5px">
                                        <fo:block>
                                            <xsl:value-of select="document(@name)//@rodne_cislo"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="5px">
                                        <fo:block>
                                            <xsl:value-of select="document(@name)//prefix:jmeno"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="5px">
                                        <fo:block>
                                            <xsl:value-of select="document(@name)//prefix:prijmeni"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="5px">
                                        <fo:block>
                                            <xsl:value-of select="document(@name)//prefix:datum[@typ='vydani']/prefix:den"/>. 
                                            <xsl:value-of select="document(@name)//prefix:datum[@typ='vydani']/prefix:mesic"/>. 
                                            <xsl:value-of select="document(@name)//prefix:datum[@typ='vydani']/prefix:rok"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="5px">
                                        <fo:block>
                                            <xsl:value-of select="document(@name)//prefix:datum[@typ='vyprseni']/prefix:den"/>. 
                                            <xsl:value-of select="document(@name)//prefix:datum[@typ='vyprseni']/prefix:mesic"/>. 
                                            <xsl:value-of select="document(@name)//prefix:datum[@typ='vyprseni']/prefix:rok"/>    
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>                                
                            </xsl:for-each>  
                        </fo:table-body>
                    </fo:table> 
                    
                    <fo:block id="prukazy" text-align="center" font-size="36px" break-before="page">
                        <fo:inline font-weight="bold">Občanské průkazy</fo:inline>
                    </fo:block>
                    
                    <xsl:for-each select="/evidence/soubor">
                        <xsl:apply-templates select="document(@name)/*"/>
                    </xsl:for-each>
                    
                    <fo:block id="ukazka" text-align="center" font-size="36px" break-before="page">
                        <fo:inline font-weight="bold">Ukázka občanského průkazu</fo:inline>
                    </fo:block>
                    
                    <fo:block text-align="center">
                        <fo:external-graphic src="url(img/prukaz_front.png)" content-width="300px" content-height="300px"/>
                    </fo:block>
                    
                    <fo:block text-align="center">
                        <fo:external-graphic src="url(img/prukaz_back.png)" content-width="300px" content-height="300px"/>
                    </fo:block>
                 
                </fo:flow>
                
            </fo:page-sequence>
        </fo:root>
    </xsl:template>   
    
    <xsl:template match="prefix:obcansky_prukaz">
        <fo:block id="{generate-id(.)}" text-align="center" font-size="24px" font-weight="bold" margin-top="15px">
            Občanský průkaz - č. <xsl:value-of select="./@id"/>
        </fo:block>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="prefix:osobni_udaje">
        <fo:block font-size="20px" font-weight="bold" margin-top="15px" margin-bottom="15px">
            Osobní údaje
        </fo:block>
        <fo:block>
            Rodné číslo: <xsl:value-of select="./@rodne_cislo"/>
        </fo:block>
        <fo:block>
            Jméno: <xsl:value-of select="prefix:jmeno"/>
        </fo:block>
        <fo:block>
            Příjmení: <xsl:value-of select="prefix:prijmeni"/>
        </fo:block>
        <fo:block>
            Pohlaví: <xsl:value-of select="prefix:pohlavi"/>
        </fo:block>
        <fo:block>
            Rodinný stav: <xsl:value-of select="prefix:rodinny_stav"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="prefix:narozeni">
        <fo:block font-size="20px" font-weight="bold" margin-top="15px" margin-bottom="15px">
            Údaje o narození
        </fo:block>
        <fo:block>
            Datum narození: <xsl:value-of select="prefix:datum/prefix:den"/>. <xsl:value-of select="prefix:datum/prefix:mesic"/>. <xsl:value-of select="prefix:datum/prefix:rok"/>                  
        </fo:block>
        <fo:block>
            Místo narození: <xsl:value-of select="prefix:misto/prefix:mesto"/> - <xsl:value-of select="prefix:misto/prefix:obvod"/>             
        </fo:block>
    </xsl:template>
    
    <xsl:template match="prefix:platnost">
        <fo:block font-size="20px" font-weight="bold" margin-top="15px" margin-bottom="15px">
            Platnost
        </fo:block>
        <fo:block>
            Platnost od: <xsl:value-of select="prefix:datum[@typ='vydani']/prefix:den"/>. <xsl:value-of select="prefix:datum[@typ='vydani']/prefix:mesic"/>. <xsl:value-of select="prefix:datum[@typ='vydani']/prefix:rok"/>                  
        </fo:block>
        <fo:block>
            Platnost do: <xsl:value-of select="prefix:datum[@typ='vyprseni']/prefix:den"/>. <xsl:value-of select="prefix:datum[@typ='vyprseni']/prefix:mesic"/>. <xsl:value-of select="prefix:datum[@typ='vyprseni']/prefix:rok"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="prefix:obcanstvi">
        <fo:block font-size="20px" font-weight="bold" margin-top="15px" margin-bottom="15px">
            Údaje o občanství
        </fo:block> 
        <fo:block>
            Občanství: <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="prefix:adresa">
        <fo:block font-size="20px" font-weight="bold" margin-top="15px" margin-bottom="15px">
            Adresa
        </fo:block>
        <fo:block>
            Ulice: <xsl:value-of select="prefix:ulice"/>
        </fo:block>
        <fo:block>
            Číslo popisné: <xsl:value-of select="prefix:cp"/>
        </fo:block>
        <fo:block>
            Město: <xsl:value-of select="prefix:mesto"/>
        </fo:block>
        <fo:block>
            Okres: <xsl:value-of select="prefix:okres"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="prefix:vydavatel">
        <fo:block font-size="20px" font-weight="bold" margin-top="15px" margin-bottom="15px">
            Údaje o vydavateli
        </fo:block> 
        <fo:block break-after="page">
            Vydavatel: <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
 
</xsl:stylesheet>