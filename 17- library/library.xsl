<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
        <head>
            <title>Library Books</title>

            <style>
                table {
                    width: 70%;
                    border-collapse: collapse;
                    margin: 20px auto;
                }
                th, td {
                    border: 1px solid black;
                    padding: 8px;
                    text-align: center;
                }
                th {
                    background-color: #e0e0e0;
                }
            </style>
        </head>

        <body>
            <h2 style="text-align:center;">Library Book List</h2>

            <table>
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Publisher</th>
                    <th>Year</th>
                </tr>

                <xsl:for-each select="library/book">
                    <tr>
                        <td><xsl:value-of select="BookID"/></td>
                        <td><xsl:value-of select="Title"/></td>
                        <td><xsl:value-of select="Author"/></td>
                        <td><xsl:value-of select="Publisher"/></td>
                        <td><xsl:value-of select="Year"/></td>
                    </tr>
                </xsl:for-each>

            </table>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
