<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
    <title>College Student Records</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .subtitle {
            text-align: center;
            color: #7f8c8d;
            margin-bottom: 40px;
            font-size: 1.2em;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        th {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            font-weight: bold;
            padding: 15px;
            text-align: left;
            font-size: 1.1em;
        }
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #ecf0f1;
            transition: background-color 0.3s ease;
        }
        tr:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        tr:nth-child(even) {
            background-color: #fafafa;
        }
        .gpa-high {
            color: #27ae60;
            font-weight: bold;
            font-size: 1.1em;
        }
        .gpa-medium {
            color: #f39c12;
            font-weight: bold;
        }
        .gpa-low {
            color: #e74c3c;
            font-weight: bold;
        }
        .performance-excellent {
            background-color: #d5f4e6;
            color: #27ae60;
            padding: 5px 10px;
            border-radius: 15px;
            font-weight: bold;
        }
        .performance-good {
            background-color: #fdebd0;
            color: #f39c12;
            padding: 5px 10px;
            border-radius: 15px;
            font-weight: bold;
        }
        .performance-improve {
            background-color: #fadbd8;
            color: #e74c3c;
            padding: 5px 10px;
            border-radius: 15px;
            font-weight: bold;
        }
        .summary {
            background: linear-gradient(135deg, #ecf0f1, #bdc3c7);
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .summary h3 {
            color: #2c3e50;
            margin-top: 0;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 15px;
        }
        .stat-item {
            background: white;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .stat-value {
            font-size: 1.5em;
            font-weight: bold;
            color: #3498db;
        }
        .branch-badge {
            display: inline-block;
            padding: 3px 8px;
            background-color: #3498db;
            color: white;
            border-radius: 12px;
            font-size: 0.9em;
            margin: 2px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> College Student Records</h1>
        <div class="subtitle">Comprehensive Student Information System</div>
        
        <table>
            <thead>
                <tr>
                    <th>Roll No</th>
                    <th>Student Name</th>
                    <th>Branch</th>
                    <th>Academic Year</th>
                    <th>GPA</th>
                    <th>Performance</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="college/student">
                <xsl:sort select="gpa" data-type="number" order="descending"/>
                <tr>
                    <td><strong><xsl:value-of select="rollno"/></strong></td>
                    <td><xsl:value-of select="name"/></td>
                    <td>
                        <span class="branch-badge"><xsl:value-of select="branch"/></span>
                    </td>
                    <td>Year <xsl:value-of select="year"/></td>
                    <td>
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when test="gpa &gt;= 3.7">gpa-high</xsl:when>
                                <xsl:when test="gpa &gt;= 3.0">gpa-medium</xsl:when>
                                <xsl:otherwise>gpa-low</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:value-of select="gpa"/>
                    </td>
                    <td>
                        <xsl:variable name="performanceClass">
                            <xsl:choose>
                                <xsl:when test="gpa &gt;= 3.7">performance-excellent</xsl:when>
                                <xsl:when test="gpa &gt;= 3.0">performance-good</xsl:when>
                                <xsl:otherwise>performance-improve</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <span class="{$performanceClass}">
                            <xsl:choose>
                                <xsl:when test="gpa &gt;= 3.7">Excellent </xsl:when>
                                <xsl:when test="gpa &gt;= 3.0">Good </xsl:when>
                                <xsl:otherwise>Needs Improvement </xsl:otherwise>
                            </xsl:choose>
                        </span>
                    </td>
                </tr>
                </xsl:for-each>
            </tbody>
        </table>
        
        <div class="summary">
            <h3> Institutional Summary</h3>
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-value"><xsl:value-of select="count(college/student)"/></div>
                    <div>Total Students</div>
                </div>
                <div class="stat-item">
                    <xsl:variable name="totalGPA" select="sum(college/student/gpa)"/>
                    <xsl:variable name="studentCount" select="count(college/student)"/>
                    <div class="stat-value"><xsl:value-of select="format-number($totalGPA div $studentCount, '0.00')"/></div>
                    <div>Average GPA</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value"><xsl:value-of select="count(college/student[gpa &gt;= 3.5])"/></div>
                    <div>Students with 3.5+ GPA</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value"><xsl:value-of select="count(college/student[branch = 'Computer Science'])"/></div>
                    <div>Computer Science</div>
                </div>
            </div>
            
            <div style="margin-top: 20px;">
                <strong>Available Branches:</strong><br/>
                <xsl:for-each select="college/student/branch[not(.=preceding::branch)]">
                    <span class="branch-badge"><xsl:value-of select="."/></span>
                    <xsl:text> </xsl:text>
                </xsl:for-each>
            </div>
        </div>
    </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>