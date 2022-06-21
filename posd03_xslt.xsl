<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:prefix="https://www.posd03-ns.cz/LS2021"
                exclude-result-prefixes="prefix"
                version="2.0">
    
    <xsl:output method="html" version="5" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:result-document href="evidence.html">
            <html lang="cs">
                <head>
                    <title>Evidence občanských průkazů</title>  
                    <link rel="stylesheet" type="text/css" href="styles.css"/>
                    <meta name="author" content="David Poslušný"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                </head>
                <body>
                    <h1>Evidence občanských průkazů</h1>
                    <h3>Obsah evidence</h3>                   
                    <xsl:call-template name="navigace"/>
                    <p class="warning">*Poznámka: odkaz na konkrétní občanský průkaz je tvořen identifikačním číslem průkazu a celým jménem držitele.</p>
                    <h2 class="heading-center">Nestrukturovaný výčet z evidence</h2>
                    <xsl:for-each select="/evidence/soubor">
                        <xsl:apply-templates select="document(@name)/*"/>
                    </xsl:for-each>
                    <table class="evidence">
                        <tr>
                            <th>ID průkazu</th>
                            <th>Rodné číslo</th>
                            <th>Jméno</th>
                            <th>Příjmení</th>
                            <th>Pohlaví</th>
                            <th>Rodinný stav</th>
                            <th>Datum narození</th>
                            <th>Místo narození</th>
                            <th>Občanství</th>
                            <th>Datum vydání</th>
                            <th>Platnost do</th>
                            <th>Adresa</th>
                            <th>Vydavatel</th>
                        </tr>
                        <xsl:for-each select="//soubor">
                            <tr>
                                <td><xsl:value-of select="document(@name)//@id"/></td>
                                <td><xsl:value-of select="document(@name)//@rodne_cislo"/></td>
                                <td><xsl:value-of select="document(@name)//prefix:jmeno"/></td>
                                <td><xsl:value-of select="document(@name)//prefix:prijmeni"/></td>
                                <td><xsl:value-of select="document(@name)//prefix:pohlavi"/></td>
                                <td><xsl:value-of select="document(@name)//prefix:rodinny_stav"/></td>
                                <td>
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='narozeni']/prefix:den"/>. 
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='narozeni']/prefix:mesic"/>. 
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='narozeni']/prefix:rok"/>
                                </td>
                                <td>
                                    <xsl:value-of select="document(@name)//prefix:misto/prefix:mesto"/> -  
                                    <xsl:value-of select="document(@name)//prefix:misto/prefix:obvod"/>                                     
                                </td>
                                <td><xsl:value-of select="document(@name)//prefix:obcanstvi"/></td>
                                <td>
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='vydani']/prefix:den"/>. 
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='vydani']/prefix:mesic"/>. 
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='vydani']/prefix:rok"/>
                                </td>
                                <td>
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='vyprseni']/prefix:den"/>. 
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='vyprseni']/prefix:mesic"/>. 
                                    <xsl:value-of select="document(@name)//prefix:datum[@typ='vyprseni']/prefix:rok"/>                                    
                                </td>
                                <td>
                                    <xsl:value-of select="document(@name)//prefix:adresa/prefix:ulice"/><xsl:text>&#032;</xsl:text>
                                    <xsl:value-of select="document(@name)//prefix:adresa/prefix:cp"/>,  
                                    <xsl:value-of select="document(@name)//prefix:adresa/prefix:mesto"/>, 
                                    <xsl:value-of select="document(@name)//prefix:adresa/prefix:okres"/>
                                </td>
                                <td>
                                    <xsl:value-of select="document(@name)//prefix:vydavatel"/>
                                </td>
                            </tr>                         
                        </xsl:for-each>           
                    </table>
                    <p class="warning">*Poznámka: pro přístup k jednotlivým občanským průkazům využijte navigaci.</p>
                    <h2 class="heading-center">Vzorová ukázka občanského průkazu</h2>
                    <div style="display: block;">
                        <img alt="Vzorová úkázka občanského průkazu" src="img/prukaz_front.png"/>
                        <img alt="Vzorová úkázka občanského průkazu" src="img/prukaz_back.png"/>                        
                    </div>
                </body>
            </html>                     
        </xsl:result-document>
        <xsl:apply-templates/>
    </xsl:template>    
    
    <xsl:template match="prefix:obcansky_prukaz">
            <xsl:result-document href="obcansky_prukaz_{generate-id(.)}.html">
                <html lang="cs">
                    <head>
                        <title><xsl:value-of select="./@id"/></title>
                        <link rel="stylesheet" type="text/css" href="styles.css"/>
                        <meta name="author" content="David Poslušný"/>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    </head>
                    <body>
                        <h1>Občanský průkaz - č. <xsl:value-of select="./@id"/></h1>
                        <xsl:apply-imports/>                      
                        <p style="text-align: center; margin-top: 50px;"><a class="nav-btn" href="evidence.html">Zpět na evidenci</a></p> 
                    </body>
                </html>
            </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="prefix:osobni_udaje">
        <h2 class="heading-center">Osobní údaje</h2>       
        <table class="evidence" style="width: 50%; margin-left: auto; margin-right: auto">
            <tr>
                <th>Jméno</th>
                <th>Příjmení</th>
                <th>Pohlaví</th>
                <th>Rodinný stav</th>
            </tr>
            <tr>
                <td><xsl:value-of select="prefix:jmeno"/></td>
                <td><xsl:value-of select="prefix:prijmeni"/></td>
                <td><xsl:value-of select="prefix:pohlavi"/></td>
                <td><xsl:value-of select="prefix:rodinny_stav"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="prefix:narozeni">
        <h2 class="heading-center">Údaje o narození</h2>
        <div class="flex-container">            
            <div class="flex-child">
                <h3 class="heading-center">Datum narození</h3>
                <h4 class="heading-bold">
                    <xsl:value-of select="prefix:datum/prefix:den"/>. <xsl:value-of select="prefix:datum/prefix:mesic"/>. <xsl:value-of select="prefix:datum/prefix:rok"/>                  
                </h4>
            </div>           
            <div class="flex-child">
                <h3 class="heading-center">Místo narození</h3>
                <h4 class="heading-bold">
                    <xsl:value-of select="prefix:misto/prefix:mesto"/> - <xsl:value-of select="prefix:misto/prefix:obvod"/>               
                </h4>
            </div>            
        </div>
    </xsl:template>
    
    <xsl:template match="prefix:obcanstvi">
        <h2 class="heading-center">Údaje o občanství</h2>
        <div class="flex-container-single">            
            <div class="flex-child">
                <h3 class="heading-center">Občanství</h3>
                <h4 class="heading-bold">
                    <xsl:value-of select="."/>
                </h4>
            </div>                 
        </div>
    </xsl:template>
    
    <xsl:template match="prefix:platnost">
        <h2 class="heading-center">Údaje o platnosti</h2>
        <div class="flex-container">            
            <div class="flex-child">
                <h3 class="heading-center">Datum vydání</h3>
                <h4 class="heading-bold">
                    <xsl:value-of select="prefix:datum[@typ='vydani']/prefix:den"/>. <xsl:value-of select="prefix:datum[@typ='vydani']/prefix:mesic"/>. <xsl:value-of select="prefix:datum[@typ='vydani']/prefix:rok"/>                  
                </h4>
            </div>           
            <div class="flex-child">
                <h3 class="heading-center">Datum vypršení</h3>
                <h4 class="heading-bold">
                    <xsl:value-of select="prefix:datum[@typ='vyprseni']/prefix:den"/>. <xsl:value-of select="prefix:datum[@typ='vyprseni']/prefix:mesic"/>. <xsl:value-of select="prefix:datum[@typ='vyprseni']/prefix:rok"/>
                </h4>
            </div>            
        </div>
    </xsl:template>
    
    <xsl:template match="prefix:adresa">
        <h2 class="heading-center">Údaje o adrese</h2>       
        <table class="evidence" style="width: 50%; margin-left: auto; margin-right: auto">
            <tr>
                <th>Druh</th>
                <th>Ulice</th>
                <th>Číslo popisné</th>
                <th>Město</th>
                <th>Okres</th>
            </tr>
            <tr>
                <td><xsl:value-of select="./@druh"/></td>
                <td><xsl:value-of select="prefix:ulice"/></td>
                <td><xsl:value-of select="prefix:cp"/></td>
                <td><xsl:value-of select="prefix:mesto"/></td>
                <td><xsl:value-of select="prefix:okres"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="prefix:vydavatel">
        <h2 class="heading-center">Údaje o vydavateli průkazu</h2>
        <div class="flex-container-single">            
            <div class="flex-child">
                <h3 class="heading-center">Vydavatel</h3>
                <h4 class="heading-bold">
                    <xsl:value-of select="."/>
                </h4>
            </div>                 
        </div>        
    </xsl:template>
    
    <xsl:template name="navigace">
        <ul>
        <xsl:for-each select="//soubor"> 
            <li class="navbar">
                <a class="nav-btn" href="obcansky_prukaz_{generate-id(document(@name)/prefix:obcansky_prukaz)}.html">
                    <xsl:value-of select="document(@name)//@id"/> - <xsl:value-of select="document(@name)//prefix:jmeno"/><xsl:text>&#032;</xsl:text><xsl:value-of select="document(@name)//prefix:prijmeni"/>
                    <xsl:apply-templates/>
                </a>
                <br/>
            </li>            
        </xsl:for-each>
        </ul>
    </xsl:template>
    
</xsl:stylesheet>