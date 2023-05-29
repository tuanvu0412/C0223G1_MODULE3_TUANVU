package com.example.demohuy;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CaculatorServlet", value = "/CaculatorServlet")
public class DiscountServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
            double num2 = Double.parseDouble(request.getParameter("num2"));
            double num3 = Double.parseDouble(request.getParameter("num3"));
            double result = num2 * num3 * 0.01;
            double result2= num2-result;
            request.setAttribute("vu", result);
            request.setAttribute("vu2",result2);
            RequestDispatcher r = request.getRequestDispatcher("result.jsp");
            r.forward(request, response);
    }
}