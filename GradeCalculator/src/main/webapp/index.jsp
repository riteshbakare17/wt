<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Grade Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f7fa;
            text-align: center;
        }
        form {
            background: white;
            display: inline-block;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
            margin-top: 40px;
        }
        input[type=text], input[type=number] {
            width: 200px;
            padding: 6px;
            margin: 6px;
        }
        input[type=submit] {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type=submit]:hover {
            background: #0056b3;
        }
        h2 { color: #333; }
        table {
            margin: 20px auto;
            border-collapse: collapse;
        }
        td, th {
            padding: 10px 20px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<h2>Student Grade Calculator</h2>
<form method="post">
    <label>Student Name:</label><br>
    <input type="text" name="studentName" required><br>

    <label>Marks in Subject 1:</label><br>
    <input type="number" name="m1" required><br>

    <label>Marks in Subject 2:</label><br>
    <input type="number" name="m2" required><br>

    <label>Marks in Subject 3:</label><br>
    <input type="number" name="m3" required><br>

    <label>Marks in Subject 4 (optional):</label><br>
    <input type="number" name="m4"><br>

    <label>Marks in Subject 5 (optional):</label><br>
    <input type="number" name="m5"><br>

    <input type="submit" value="Calculate Grade">
</form>

<%
    if(request.getMethod().equalsIgnoreCase("post")) {
        String name = request.getParameter("studentName");
        DecimalFormat df = new DecimalFormat("0.00");

        int total = 0, count = 0;
        int[] marks = new int[5];

        for(int i=1; i<=5; i++) {
            String m = request.getParameter("m"+i);
            if(m != null && !m.isEmpty()) {
                marks[i-1] = Integer.parseInt(m);
                total += marks[i-1];
                count++;
            }
        }

        if(count > 0) {
            double percentage = (double) total / count;
            String grade;

            if(percentage >= 90)
                grade = "A";
            else if(percentage >= 75)
                grade = "B";
            else if(percentage >= 60)
                grade = "C";
            else if(percentage >= 45)
                grade = "D";
            else
                grade = "F";
%>

<h2>Result:</h2>
<table>
    <tr><th>Student Name</th><td><%= name %></td></tr>
    <tr><th>Total Marks</th><td><%= total %></td></tr>
    <tr><th>Percentage</th><td><%= df.format(percentage) %> %</td></tr>
    <tr><th>Grade</th><td><%= grade %></td></tr>
</table>

<%
        }
    }
%>
</body>
</html>
