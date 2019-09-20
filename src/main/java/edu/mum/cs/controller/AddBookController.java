package edu.mum.cs.controller;

import com.google.gson.Gson;
import edu.mum.cs.model.Book;
import jdk.nashorn.internal.ir.debug.JSONWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addBook")
public class AddBookController extends HttpServlet {
    private List<Book> bookList = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        String title = req.getParameter("title");
        String isbn = req.getParameter("isbn");
        Book book = new Book();
        book.setTitle(title);
        book.setIsbn(isbn);
        bookList.add(book);
//        resp.getWriter().print(new Gson().toJson(bookList));
        resp.getWriter().print(new Gson().toJson(book));
        System.out.println(bookList.size());
    }
}
