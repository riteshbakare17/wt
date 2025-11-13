<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:output method="html" encoding="UTF-8" indent="yes"/>


<xsl:template match="/">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Customer Orders</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
<h1>Customer Orders</h1>
<table class="orders-table">
<thead>
<tr>
<th>Order ID</th>
<th>Customer Name</th>
<th>Product</th>
<th>Quantity</th>
<th>Order Date</th>
</tr>
</thead>
<tbody>
<xsl:for-each select="orders/order">
<tr>
<td><xsl:value-of select="OrderID"/></td>
<td><xsl:value-of select="CustomerName"/></td>
<td><xsl:value-of select="Product"/></td>
<td><xsl:value-of select="Quantity"/></td>
<td><xsl:value-of select="OrderDate"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</body>
</html>
</xsl:template>


</xsl:stylesheet>