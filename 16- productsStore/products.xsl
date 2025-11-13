<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" encoding="UTF-8" indent="yes"/>


<xsl:template match="/">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Product Catalog</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
<h1>Store Product Catalog</h1>
<table class="product-table">
<thead>
<tr>
<th>Product ID</th>
<th>Name</th>
<th>Category</th>
<th>Price (INR)</th>
<th>Quantity</th>
</tr>
</thead>
<tbody>
<xsl:for-each select="products/product">
<tr>
<td><xsl:value-of select="ProductID"/></td>
<td><xsl:value-of select="Name"/></td>
<td><xsl:value-of select="Category"/></td>
<td><xsl:value-of select="format-number(Price, '#,##0.00')"/></td>
<td><xsl:value-of select="Quantity"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</body>
</html>
</xsl:template>


</xsl:stylesheet>