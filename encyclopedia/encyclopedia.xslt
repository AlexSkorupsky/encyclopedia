<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>

    <h2><xsl:value-of select="encyclopedia/ename"/></h2>
    <table border="1" style="text-align:center;">
      <tr bgcolor="#cccbbb">
        <th>Name of encyclopedia</th>
        <th>Count of sections</th>
      </tr>
      <tr>
        <td><xsl:value-of select="encyclopedia/ename"/></td>
        <td><xsl:value-of select="encyclopedia/countOfSections"/></td>
      </tr>
    </table>

    <br/>

    <h3>Sections</h3>
    <table border="1" style="text-align:center;">
        <tr bgcolor="#913133">
            <th>Section name</th>
            <th>Count of articles</th>
        </tr>
        <xsl:for-each select="encyclopedia/section">
        <xsl:sort select="sname"/>
        <tr>
            <td><xsl:value-of select="sname"/></td>
            <td><xsl:value-of select="countOfArticles"/></td>
        </tr>
        </xsl:for-each>
    </table>

    <br/>


    <h3>Articles</h3>
    <table border="1" style="text-align:center;">
        <tr bgcolor="#bbbbbb">
        <th>Article name</th>
        <th>Content of article</th>
        <th>Last change date</th>
        </tr>
        <xsl:for-each select="encyclopedia/section/article">
        <xsl:sort select="aname"/>
        <tr>
            <td><xsl:value-of select="aname"/></td>
            <td><xsl:value-of select="content"/></td>
            <td><xsl:value-of select="lastChangeDate"/></td>
        </tr>
        </xsl:for-each>
    </table>

    <br/>

    <h3>Sections with 3 or more articles</h3>
    <table border="1" style="text-align:center;">
        <tr bgcolor="#177883">
            <th>Section name</th>
            <th>Count of articles</th>
        </tr>
        <xsl:for-each select="encyclopedia/section">
            <xsl:if test="countOfArticles=2">
                <tr>
                    <td><xsl:value-of select="sname"/></td>
                    <td><xsl:value-of select="countOfArticles"/></td>
                </tr>
            </xsl:if>
        
        </xsl:for-each>
    </table>

    <br/>


    <h3>Articles with choose</h3>
    <table border="1" style="text-align:center;">
        <tr bgcolor="#bbbbbb">
            
            <th>Content of article</th>
            <th>Article name</th>
            <th>Last change date</th>
        </tr>
        <xsl:for-each select="encyclopedia/section/article">
            <tr>
                <td><xsl:value-of select="content"/></td>
                <xsl:choose>
                    <xsl:when test="aname = 'Article1'">
                    
                        <td bgcolor="#ff00ff"><xsl:value-of select="aname"/></td>
                        <td bgcolor="#ff00ff"><xsl:value-of select="lastChangeDate"/></td>
                       
                    </xsl:when>
                    <xsl:when test="aname ='Article2'">
                        <td bgcolor="#fcc0ff"><xsl:value-of select="aname"/></td>
                        <td bgcolor="#fcc0ff"><xsl:value-of select="lastChangeDate"/></td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td><xsl:value-of select="aname"/></td>
                        <td><xsl:value-of select="lastChangeDate"/></td>
                    </xsl:otherwise>
                </xsl:choose>
            </tr>
        </xsl:for-each>
    </table>

    <br/>

    <h3>Users</h3>
    <table border="1" style="text-align:center;">
      <tr bgcolor="#aaaccc">
        <th>Users</th>
      </tr>
      <xsl:for-each select="encyclopedia/user">
      <xsl:sort select="uname"/>
        <tr>
            <td><xsl:value-of select="uname"/></td>
        </tr>
      </xsl:for-each>
      <tr bgcolor="#aaaccc">
        <th>Users with id "u1"</th>
      </tr>
      <xsl:for-each select="encyclopedia/user[@userID ='u1']">
        <tr>
            <td><xsl:value-of select="uname"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
