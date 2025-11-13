package com.library.servlet;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;

@WebServlet("/books")
public class BookCatalogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private List<Book> readBooksFromXML(String xmlFilePath) {
        List<Book> books = new ArrayList<>();
        try {
            File xmlFile = new File(xmlFilePath);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            NodeList nodeList = doc.getElementsByTagName("book");

            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element e = (Element) node;
                    books.add(new Book(
                        e.getElementsByTagName("title").item(0).getTextContent(),
                        e.getElementsByTagName("author").item(0).getTextContent(),
                        e.getElementsByTagName("category").item(0).getTextContent(),
                        e.getElementsByTagName("availability").item(0).getTextContent()
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String category = request.getParameter("category");
        String author = request.getParameter("author");

        String xmlFilePath = getServletContext().getRealPath("/books.xml");
        List<Book> books = readBooksFromXML(xmlFilePath);

        out.println("<html><head><title>Library Catalog</title></head><body>");
        out.println("<h1>Library Book Catalog</h1>");
        out.println("<form method='get'>");
        out.println("Search by Category: <input type='text' name='category'/> ");
        out.println("or Author: <input type='text' name='author'/> ");
        out.println("<input type='submit' value='Search'/>");
        out.println("</form><hr>");

        if ((category != null && !category.isEmpty()) || (author != null && !author.isEmpty())) {
            out.println("<h3>Search Results:</h3>");
            for (Book book : books) {
                if ((category != null && book.getCategory().equalsIgnoreCase(category)) ||
                    (author != null && book.getAuthor().equalsIgnoreCase(author))) {
                    out.println("<p><b>Title:</b> " + book.getTitle() + "<br>");
                    out.println("<b>Author:</b> " + book.getAuthor() + "<br>");
                    out.println("<b>Category:</b> " + book.getCategory() + "<br>");
                    out.println("<b>Availability:</b> " + book.getAvailability() + "</p><hr>");
                }
            }
        } else {
            out.println("<h3>All Books:</h3>");
            for (Book book : books) {
                out.println("<p><b>Title:</b> " + book.getTitle() + "<br>");
                out.println("<b>Author:</b> " + book.getAuthor() + "<br>");
                out.println("<b>Category:</b> " + book.getCategory() + "<br>");
                out.println("<b>Availability:</b> " + book.getAvailability() + "</p><hr>");
            }
        }

        out.println("</body></html>");
    }

    // Inner class representing a Book
    private static class Book {
        private String title, author, category, availability;
        public Book(String title, String author, String category, String availability) {
            this.title = title;
            this.author = author;
            this.category = category;
            this.availability = availability;
        }
        public String getTitle() { return title; }
        public String getAuthor() { return author; }
        public String getCategory() { return category; }
        public String getAvailability() { return availability; }
    }
}
