<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link href="stileBellini.css" rel="stylesheet" type="text/css"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script>
                    $(document).ready(function(){
                        $(".sourceDesc").hide();
                        $("#mostra").click(function(){
                            $(".sourceDesc").toggle();
                        });
                        $("#persInt").hide();
                        $("#mostra2").click(function(){
                            $("#persInt").toggle();
                        });
                        $("#placeInt").hide();
                        $("#mostra3").click(function(){
                            $("#placeInt").toggle();
                        });
                        $("#workInt").hide();
                        $("#mostra4").click(function(){
                            $("#workInt").toggle();
                        });
                            $('#sezioni').click(function(){
                            $("#fronteImgPic").attr('src',"LL1.14_0001s.jpg");
                            $("#retroImgPic").attr('src',"LL1.14_0002s.jpg");
                            $("#part_1f").css("background-color", "#bf988b");
                            $("#part_2f").css("background-color", "#c3bc8e");
                            $("#part_3f").css("background-color", "#9db991");
                        });
                            $('#originale').click(function(){
                            $("#fronteImgPic").attr('src',"LL1.14_0001.jpg");
                            $("#retroImgPic").attr('src',"LL1.14_0002.jpg");
                            $("#part_1f").css("background-color", "#bbb4a2");
                            $("#part_2f").css("background-color", "#bbb4a2");
                            $("#part_3f").css("background-color", "#bbb4a2");    
                        });


                    });
                </script>
            </head>
             <body>
                <xsl:apply-templates/>    
                <script src="https://raw.githubusercontent.com/davidjbradshaw/imagemap-resizer/master/js/imageMapResizer.min.js"></script> 
                <script>
                    $('map').imageMapResize();
                </script>
            </body> 
        </html>
                                                        <!--teiheader-->
    </xsl:template>
    <xsl:template match="tei:teiHeader">
        <div id="teiHeader">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="//tei:titleStmt/tei:title">
        <div id="titolo">
            <h1 class="center">
                <xsl:value-of select="." />
            </h1>
        </div>
    </xsl:template>

    <xsl:template match="//tei:titleStmt/tei:author">
        <div id="autore">
            <h1 class="center">
                <xsl:value-of select="."/>
            </h1>
        </div>
    </xsl:template>

    <xsl:template match="//tei:titleStmt/tei:respStmt|//tei:editionStmt">
        <h4 class="center">
            <xsl:apply-templates/>
        </h4>
    </xsl:template>

    <xsl:template match="//tei:sourceDesc">
        <div class="sourceDesc">  
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="//tei:licence">
        <h4 class="center">Licenza
            <xsl:value-of select="//tei:availability" />;
            </h4>
            <button id="mostra">Informazioni Lettera &#128070;</button>
    </xsl:template>

    <xsl:template match="tei:sourceDesc/tei:bibl">
        <h4 class="underline">Pagine Seminara:</h4> <p>
            <xsl:value-of select="//tei:citedRange" />;
        </p>
    </xsl:template>

    <xsl:template match="tei:msIdentifier">
        <div id="msIdentifier">
            <h4 class="underline">Luogo di conservazione</h4><p>
            <li><span class="bold">Paese: </span><xsl:value-of select="//tei:country" />; <span class="bold">Regione: </span><xsl:value-of select="//tei:settlement" />;<br /></li>
            <li><span class="bold">Museo: </span><xsl:value-of select="//tei:repository"/>; <span class="bold">Numero identificativo: </span> <xsl:value-of select="//tei:idno"/>;<br /></li>
            <li><span class="bold">Collocazione: </span><xsl:value-of select="//tei:altIdentifier"/>;</li>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="tei:msContents">
        <div id="msContents">
            <h4 class="underline">Informazioni lettera e Attribuzione</h4><p>
                <li><span class="bold">Info lettera: </span><xsl:value-of select="//tei:title" />;<br /></li>
                <li><span class="bold">Linguaggio: </span><xsl:value-of select="//tei:textLang" />;<br /></li>
                <li><span class="bold">Attribuzione: </span><xsl:value-of select="//tei:note" />;</li>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <div id="physDesc">
            <h4 class="underline">Descrizione fisica e stato della lettera</h4><p>
            <li><span class="bold">Materiale e struttura: </span><xsl:value-of select="//tei:material" />; <xsl:value-of select="//tei:p"/>;<br /></li>
            <li><span class="bold">Numero fogli: </span> <xsl:value-of select="//tei:measure" />;<br /></li>
            <li><span class="bold">Dimensioni in millimetri: </span> <xsl:value-of select="//tei:height" />-<xsl:value-of select="//tei:width" />;<br/></li>
            <li><span class="bold">Piegature: </span> <xsl:value-of select="//tei:foliation"/>;<br /></li>
            <li><span class="bold">Condizioni: </span> <xsl:value-of select="//tei:condition"/>;<br /></li>
            <li><span class="bold">Grafie presenti: </span> <xsl:value-of select="//tei:handDesc"/>;</li>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="tei:additional">
        <div id="additional">
            <h4 class="underline">Note addizionali</h4><p>
            <xsl:value-of select="//tei:adminInfo/tei:note"/>
            </p>
        </div>
    </xsl:template>     
                                                            <!--text-->
    <xsl:template match="tei:text">
        <h1 class="center">Testo della minuta</h1>
        <xsl:apply-templates/>
    </xsl:template>
                                                            <!--back-->
    <xsl:template match="tei:back">
        <div id="appendici">
            <h1>Appendici</h1>
        <xsl:apply-templates/>
        </div>
    </xsl:template>

                                                            <!--div-->
    
    <xsl:template match="tei:div">
        <for-each select="@xml:id">
            <xsl:variable name="divid">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
                <div>
                    <xsl:attribute name="id"><xsl:value-of select="$divid" /></xsl:attribute>
                        <xsl:apply-templates/> 
                </div> 
        </for-each> 

    </xsl:template>
                                                            <!--page-->
    <xsl:template match="tei:ab">
        <for-each select="./@n">
            <xsl:variable name="part">
                <xsl:value-of select="./@n"/>
            </xsl:variable> 
        <h5 class="underline">Sezione minuta numero <xsl:value-of select="$part" /></h5>
        <p>
            <xsl:apply-templates/>
        </p> 
        </for-each> 
    </xsl:template>

    <xsl:template match="tei:pb">
        <xsl:if test="@n=1">
                <div id="img-fronte">
                    <button id="originale">Originale</button><button id="sezioni">Sezioni</button>
                    <img id="fronteImgPic" src="LL1.14_0001.jpg" alt="Fronte lettera"/>-->
                <!--   <img src="{//tei:graphic/@url}" /> -->
                </div>
        </xsl:if>
        <xsl:if test="@n=2">
            <div id="img-retro">
                       <img id="retroImgPic" src="LL1.14_0002.jpg" alt="Fronte lettera"/>
                <!-- <img src="{//tei:graphic[@url='LL1.14_0002.jpg']}" />-->
            </div>
        </xsl:if>

    </xsl:template>
                                                            <!--righe e ptr-->                                                 
    <xsl:template match="tei:lb">
        <br /><xsl:if test="./@n">
        <span class="line">
            <xsl:value-of select="current()/@n" />
        </span>
        </xsl:if>
    </xsl:template> 

    <xsl:template match="tei:ptr">
        <xsl:if test="./@n">
            <sup>
                <span class="note_sup">
                    [<xsl:value-of select="current()/@n" />]
                </span>
            </sup>
        </xsl:if>
    </xsl:template> 
                                                            <!--enfasi e grassetto-->
    <xsl:template match="tei:ab//tei:term">
        <i><xsl:apply-templates/></i>
    </xsl:template>

    <xsl:template match="tei:ab//tei:persName|tei:ab//tei:orgName">
        <b><xsl:apply-templates/></b>
    </xsl:template> 

    <xsl:template match="*[@rend='strikethrough']">
       <del><xsl:apply-templates/></del>
    </xsl:template>

    <xsl:template match="tei:gap">
        <xsl:if test="./@reason='deleted'">
            <xsl:choose>   
                <xsl:when test="./@extent>1">
                    <span class="bold">
                        (<xsl:value-of select="current()/@extent" />  parole cancellate)
                    </span>
                </xsl:when>
                <xsl:otherwise>
                    <span class="bold">
                        (<xsl:value-of select="current()/@extent" />  parola cancellata)
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="./@reason='illegibile'">
            <xsl:choose>   
                <xsl:when test="./@extent>1">
                    <span class="bold">
                        (<xsl:value-of select="current()/@extent" />  parole illeggibili)
                    </span>
                </xsl:when>
                <xsl:otherwise>
                    <span class="bold">
                        (<xsl:value-of select="current()/@extent" />  parola illeggibile)
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="@reason">
            <xsl:if test="parent::*[@type='opener']">
                <span class="italic">
                    (apertura omessa nell'originale)
                </span>
            </xsl:if>
            <xsl:if test="parent::*[@type='closer']">
                <span class="italic">
                    (chiusura omessa nell'originale)
                </span><br />
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:add[@hand='#h1']|tei:ab[@hand='#h1']">
        <br/><span>
            <xsl:attribute name="class">blue</xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>  

    <xsl:template match="tei:add[@place='above']">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>

    <xsl:template match="tei:unclear">
        <xsl:choose>
            <xsl:when test="@reason='eccentric_ductus'">
                <span class="eccentric">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@reason='ink blot'">
                <span class="ink">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="other">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

                                                            <!--note e bibliografia nel back-->
    
    <xsl:template match="tei:div[@type='notes']">
        <h4>Note</h4>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='ann_notes']//tei:note">
    <xsl:if test="./@n">
            <span class="note_sup">
                [<xsl:value-of select="current()/@n" />]
            </span>
            <xsl:apply-templates/>
            <br />
    </xsl:if>
    </xsl:template>

    <xsl:template match="tei:listOrg">
        <div id="org">
        <h4>Organizzazioni</h4>
        <xsl:for-each select="//tei:org">
            <xsl:sort select="tei:orgName" data-type="text" order="ascending"/>
            <li>  
                <span class="bold">Organizzazione: </span> <span class="italic"> <xsl:value-of select="tei:orgName" />; </span>
                <span class="bold">Descrizione: </span> <span class="italic"> <xsl:value-of select="tei:desc" />; </span>  
            </li>            
        </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="tei:listPerson">
        <div id="pers">
        <button id="mostra2">Indice dei nomi &#128100; &#128070;</button>
        <div id="persInt">
            <xsl:for-each select="//tei:person">
            <xsl:sort select="tei:persName" data-type="text" order="ascending"/>
                <xsl:value-of select="tei:persName" /><br />
            </xsl:for-each>
        </div>
        </div>
    </xsl:template>

    <xsl:template match="tei:listBibl">
        <div id="bibl">
        <h4>Bibliografia</h4>
        <xsl:for-each select="//tei:listBibl/tei:bibl">
             <xsl:sort select="tei:author" data-type="text" order="ascending"/>
            <li>  
                <span class="bold">autore: </span> <span class="italic"> <xsl:value-of select="tei:author" />; </span>
                <span class="bold">data pubblicazione: </span> <span class="italic"> <xsl:value-of select="tei:date" />; </span> 
                <span class="bold">pagine citate: </span> <span class="italic"> <xsl:value-of select="tei:citedRange" />; </span> 
            </li>
        </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="//tei:listPlace">
        <div id="place">
        <button id="mostra3">Indice dei luoghi &#127750; &#128070;</button>
        <div id="placeInt">
            <xsl:for-each select="//tei:place">
            <xsl:sort select="tei:placeName" data-type="text" order="ascending"/>
                <xsl:value-of select="tei:placeName" /><br />

            </xsl:for-each>
        </div>
        </div>
    </xsl:template>

    <xsl:template match="//tei:list[@type='work']">
        <div id="work">
        <button id="mostra4">Indice delle opere &#127932; &#128070;</button>
        <div id="workInt">
            <xsl:apply-templates/>
        </div>  
        </div>
    </xsl:template>

    <xsl:template match="//tei:list[@type='work']/tei:label/tei:rs">
        <li><b>
            <xsl:apply-templates/>
        </b>
        </li>
        
    </xsl:template>

    <xsl:template match="//tei:list[@type='terminology']">
        <div id="terminology">
            <h4>Glossario termini</h4>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="//tei:list[@type='terminology']/tei:label/tei:term">
        <li><b>
            <xsl:apply-templates/>
        </b>
        </li>
    </xsl:template>

</xsl:stylesheet>