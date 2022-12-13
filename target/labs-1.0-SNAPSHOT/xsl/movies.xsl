<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="shop">
        <html>
            <head>
                <title>MOVIES</title>
                <style>
                    table{
                    border-collapse:collapse;
                    width:30%;
                    }
                    th, td{
                    padding:8px;
                    text-align:left;
                    }
                    th{
                    background-color: green;
                    color: white;
                    font-weight:bold;
                    font-size:20px;
                    }
                    h1, h2, p{
                    background-color:#065381;
                    font-weight:bold;
                    width:30%;
                    color: white;
                    }
                    tr:nth-child(even){background-color:#B0C4DE;}
                    tr:nth-child(odd){background-color:#D2B48C;}
                </style>
            </head>
            <body bgcolor="#9da3a6">
                <xsl:apply-templates/>
                <p class="p">Total Number of Movies: <xsl:value-of select="count(movies/movie)"/></p>
                <p class="p">Average Movie Rating: <xsl:value-of select="sum(movies/movie/rating) div count(movies/movie)" /></p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="shop/name">
        <h1>           
            <xsl:apply-templates/>            
        </h1>
    </xsl:template>
    <xsl:template match="movies">
        <table>
            <thead>
                <th>TITLE</th>
                <th>CDSET</th>
                <th>PRICE</th>
                <th>RATING</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="movies/movie">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:value-of select="cdset"/>
            </td>
            <td>
                <xsl:value-of select="price"/>
            </td>
            <td>
                <div style="width:100px;background:white;height:12px;">
                    <div style="width:{10*rating}px;background:green;height:12px;"></div>                    
                </div>
            </td>
        </tr>
    </xsl:template>
    

</xsl:stylesheet>
