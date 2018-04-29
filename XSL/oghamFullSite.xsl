<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" name="html"/>
  <xsl:include href="blockAndInlineElements.xsl"/>
  <xsl:template match="/">
    <xsl:call-template name="pageHome"/>
    <xsl:call-template name="pageAbout"/>
    <xsl:call-template name="pageFullView">
      <xsl:with-param name="navType" select="'hierarchy'"/>
    </xsl:call-template>
    <xsl:call-template name="pageFullView">
      <xsl:with-param name="navType" select="'index'"/>
    </xsl:call-template>
    <xsl:call-template name="pageFullView">
      <xsl:with-param name="navType" select="'sequence'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="pageFullView">
    <xsl:param name="navType"/>
    <xsl:for-each select="//ogham">
      <xsl:variable name="itemId" select="@id"/>
      <xsl:result-document href="../html/{$itemId}_{$navType}.html" format="html">
        <html>
          <head>
            <title>
              <xsl:value-of select="/oghamBase/about/title"/>
            </title>
            <meta charset="utf-8">
              <xsl:text> </xsl:text>
            </meta>
            <link href="css/ogham.css" rel="stylesheet">
              <xsl:text> </xsl:text>
            </link>
          </head>
          <body>
            <div class="page">
              <div class="bannerArea">
                <xsl:call-template name="bannerArea"/>
              </div>
              <div class="localNavArea">
                <xsl:call-template name="localNavView">
                  <xsl:with-param name="navType" select="$navType"/>
                </xsl:call-template>
              </div>
              <div class="contentArea">
                <xsl:call-template name="fullViewWithAssoc">
                  <xsl:with-param name="itemId" select="$itemId"/>
                </xsl:call-template>
              </div>
            </div>
          </body>
        </html>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="pageHome">
    <xsl:result-document href="../html/default.html" format="html">
      <html>
        <head>
          <title>
            <xsl:value-of select="/oghamBase/about/title"/>
          </title>
          <meta charset="utf-8">
            <xsl:text> </xsl:text>
          </meta>
          <link href="css/ogham.css" rel="stylesheet">
            <xsl:text> </xsl:text>
          </link>
        </head>
        <body>
          <div class="page">
            <div class="bannerArea">
              <xsl:call-template name="bannerArea"/>
            </div>
            <div class="contentArea">
              <xsl:call-template name="partialViews"/>
            </div>
          </div>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>
  <xsl:template name="pageAbout">
    <xsl:result-document href="../html/about.html" format="html">
      <html>
        <head>
          <title>
            <xsl:value-of select="/oghamBase/about/title"/>
          </title>
          <meta charset="utf-8"/>
          <link href="css/ogham.css" rel="stylesheet"/>
        </head>
        <body>
          <div class="page">
            <div class="bannerArea">
              <xsl:call-template name="bannerArea"/>
            </div>
            <div class="contentArea">
              <h3>About <xsl:value-of select="/oghamBase/about/title"/>:</h3>
              <xsl:apply-templates select="/oghamBase/about/description"/>
              <h4>Sources:</h4>
              <xsl:for-each select="/oghamBase/about/sources/sourceIdRef">
                <xsl:call-template name="sourcesForFullView">
                  <xsl:with-param name="id" select="."/>
                </xsl:call-template>
              </xsl:for-each>
            </div>
          </div>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>
  <xsl:template name="bannerArea">
    <h1>
      <xsl:value-of select="/oghamBase/about/title"/>
    </h1>
    <h2>
      <a href="default.html">Logo</a> | <a href="default.html">Home</a> | <a href="about.html"
        >About</a> | <a href="_A_hierarchy.html">Hierarchy</a> | <a href="_A_index.html">Index</a> |
        <a href="_A_sequence.html">Sequence</a>
    </h2>
  </xsl:template>
  <xsl:template name="fullViewWithAssoc">
    <xsl:param name="itemId"/>
    <xsl:for-each select="//ogham[@id = $itemId]">
      <h1> ᚛     <xsl:value-of select="unicodeCharacter"/>     ᚜ <hr/>
        <xsl:value-of select="letter"/>
        <br/>
        <xsl:for-each select="pronunciation">
          <xsl:value-of select="."/><!-- <xsl:text> </xsl:text>(<xsl:value-of select="@language"/>) -->
          <br/>
         <!-- *How do I get the language attribute to display if there is one?* 
         THE ABOVE COMMENTED CODE GETS THE LANGUAGE, BUT HAS PROBLEMS AND NEEDS FIXING
        Use xsl:if? -->
        </xsl:for-each>
        <hr/>
      </h1>
      <xsl:if test="meaning">
        <xsl:for-each select="meaning">
          <h2>Meaning:&#160;<xsl:value-of select="."/></h2>
        </xsl:for-each>
      </xsl:if>
      <!-- I don't really need "Meaning: " in front of the second meaning if there is one. *How to fix?* -->
      <xsl:for-each select="image[@imageOrientation = 'horizontal']">
        <tr>
          <td>Horizontal&#160;<xsl:value-of select="../letter"/>:&#160;</td>
          <td>
            <xsl:element name="img">
              <xsl:attribute name="src">images/<xsl:value-of select="."/></xsl:attribute>
            </xsl:element>
          </td>
        </tr>
      </xsl:for-each>
      <xsl:for-each select="image[@imageOrientation = 'vertical']">
        <tr>
          <td>Vertical&#160;<xsl:value-of select="../letter"/>:&#160;</td>
          <td>
            <xsl:element name="img">
              <xsl:attribute name="src">images/<xsl:value-of select="."/></xsl:attribute>
            </xsl:element>
          </td>
        </tr>
      </xsl:for-each>
      <h2>Word-Oghams (kennings):</h2>
      <!-- Theoretically, there may be NO kennings if I ever include things like the space Ogham, etc., so I would need to put the above 
            h2 element in an xsl:if element.
            Something to make the verses a little more readable, like maybe some indentation after the "From the" before
            the verses themselves? -->
      <xsl:if test="verseBríatharogamMorainnmacMoín">
        <h3>From the Bríatharogam Morainn mac Moín:</h3>
        <p>
          <xsl:copy-of select="verseBríatharogamMorainnmacMoín"/>
        </p>
      </xsl:if>
      <xsl:if test="verseBríatharogamMaicindÓc">
        <h3>From the Bríatharogam Maic ind Óc:</h3>
        <p>
          <xsl:copy-of select="verseBríatharogamMaicindÓc"/>
        </p>
      </xsl:if>
      <xsl:if test="verseBríatharogamConCulainn">
        <h3>From the Bríatharogam Con Culainn:</h3>
        <p>
          <xsl:copy-of select="verseBríatharogamConCulainn"/>
        </p>
      </xsl:if>
      <h2> Unicode:&#160;U+<xsl:value-of select="unicode"/></h2>
      <xsl:if test="description">
        <h4>Other notes and description:</h4>
        <xsl:apply-templates select="description"/>
        <!-- I put the apply-templates command in without a select attribute at first, and it grabbed
                all of the matching content from the instance, not just the child nodes of description. 
                ALSO, *I could probably incorporate the apply-templates command much more fully into my transform
                for other parts of the instance that use the block and inline groups. -->
      </xsl:if>
      <h3>Related ogham characters:</h3>
      <xsl:call-template name="associations">
        <xsl:with-param name="oghamSeries" select="series"/>
      </xsl:call-template>
      <h2>Sources:</h2>
      <xsl:for-each select="sources/sourceIdRef">
        <xsl:call-template name="sourcesForFullView">
          <xsl:with-param name="id" select="."/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="sourcesForFullView">
    <xsl:param name="id"/>
    <p>
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="//sourceDef[@id = $id]/url"/>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="//sourceDef[@id = $id]/shortDescription"/>
        </xsl:attribute>
        <xsl:value-of select="//sourceDef[@id = $id]/title"/>
      </xsl:element>
      <!-- *Set links to open in a new window/tab* -->
      <br/>
      <xsl:value-of select="//sourceDef[@id = $id]/shortDescription"/>
    </p>
  </xsl:template>
  <xsl:template name="associations">
    <!-- *How to EXCLUDE the image of the character that we are currently looking at in full-view? -->
    <xsl:param name="oghamSeries"/>
    <xsl:for-each select="//ogham[series = $oghamSeries]">
      <tr>
        <td>
          <a href="{@id}_index.html">
            <xsl:element name="img">
              <xsl:attribute name="src">images/<xsl:value-of
                  select="image[@imageOrientation = 'horizontal']"/></xsl:attribute>
            </xsl:element>
          </a>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="localNavView">
    <xsl:param name="navType"/>
    <xsl:choose>
      <xsl:when test="$navType = 'hierarchy'">
        <xsl:call-template name="hierarchyView"/>
      </xsl:when>
      <xsl:when test="$navType = 'index'">
        <xsl:call-template name="indexView"/>
      </xsl:when>
      <xsl:when test="$navType = 'sequence'">
        <xsl:call-template name="sequenceView"/>
      </xsl:when>
      <xsl:otherwise>
        <p>You chose an unknown type: <xsl:value-of select="$navType"/></p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="hierarchyView">
    <!-- See note in doOneLine: How to get an alphabetical sort for each subcategory? 
    ALSO How to get a line break in between multiple same-category meanings for the same character? -->
    <h4>Ogham Character Meanings</h4>
    <xsl:for-each select="//recursiveOutieHierarchy/category">
      <xsl:call-template name="doOneLine">
        <xsl:with-param name="indent" select="'15'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="indexView">
    <!-- Add more families as I add characters to instance. -->
    <p>The Families of Ogham Characters</p>
    <table>
      <xsl:for-each select="//indexSeries">
        <xsl:sort select="seriesName"/>
        <tr>
          <td>
            <xsl:value-of select="seriesName"/>
          </td>
          <td>
            <xsl:for-each select="oghamIdRef">
              <xsl:variable name="oghamRef" select="."/>
              <a href="{$oghamRef}_index.html">
                <xsl:value-of select="//ogham[@id = $oghamRef]/letter"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="//ogham[@id = $oghamRef]/unicodeCharacter"/>
              </a>
              <br/>
            </xsl:for-each>
            <br/>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
  <xsl:template name="sequenceView">
    <xsl:for-each select="//sequence">
      <!-- The above can't be a for-each because if I add more sequences I can't show them all in the sidebar. 
      I guess I should create a few sequences and assign one to each character? Will I need to change my schema? -->
      <xsl:apply-templates select="description"/>
      <xsl:for-each select="oghamIdRef">
        <xsl:variable name="seqIdRef" select="."/>
        <a href="{//ogham[@id=$seqIdRef]/@id}_sequence.html">
        <xsl:element name="img">
          <xsl:attribute name="src">images/<xsl:value-of select="//ogham[@id = $seqIdRef]/image[@imageOrientation = 'vertical']"/>
          </xsl:attribute>
        </xsl:element>
        </a>
        <br/>
      </xsl:for-each>
      <h4>Sources:</h4>
      <xsl:for-each select="sources/sourceIdRef">
        <xsl:variable name="seqSourceIdRef" select="."/>
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="//sourceDef[@id = $seqSourceIdRef]/url"/>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="//sourceDef[@id = $seqSourceIdRef]/shortDescription"/>
          </xsl:attribute>
          <xsl:value-of select="//sourceDef[@id = $seqSourceIdRef]/title"/>
        </xsl:element>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="doOneLine">
    <xsl:param name="indent"/>
    <!-- Okay, how do I get an alphabetical sort within each subcategory? For example, Botanical meanings sorted
            A-Z, Other meanings sorted A-Z, etc. -->
    <p style="margin-left: {$indent}px;margin-top:0px;margin-bottom:0px;">
      <xsl:value-of select="title"/>
    </p>
    <xsl:for-each select="oghamMeaningIdRef">
      <xsl:variable name="currItemId" select="@idRef"/>
      <xsl:variable name="currMeaningType" select="@meaningType"/>
      <p style="margin-left: {number($indent)+15}px;margin-top:0px;margin-bottom:0px;">
        <a href="{$currItemId}_hierarchy.html">
          <xsl:value-of select="//ogham[@id = $currItemId]/unicodeCharacter"/>
          <xsl:text>  </xsl:text>
          <xsl:value-of select="//ogham[@id = $currItemId]/meaning[@meaningType = $currMeaningType]"
          />
        </a>
      </p>
    </xsl:for-each>
    <xsl:for-each select="category">
      <xsl:call-template name="doOneLine">
        <xsl:with-param name="indent" select="number($indent) + 10"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="partialViews">
    <xsl:for-each select="//ogham">
      <div class="partialViewArea">
      <a href="{@id}_hierarchy.html">
        <xsl:element name="img">
        <xsl:attribute name="src">images/<xsl:value-of select="image[@imageOrientation = 'horizontal']"/></xsl:attribute>
      </xsl:element>
      </a>
      <h1>
        <xsl:value-of select="letter"/>
        <br/>
        <xsl:value-of select="pronunciation[position()=1]"/>
        <br/>
        ᚛  <xsl:value-of select="unicodeCharacter"/>  ᚜
      </h1>
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
