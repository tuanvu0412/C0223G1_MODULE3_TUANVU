package com.example.product;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator-servlet")

public class CaculatorServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        double num2 = Double.parseDouble(request.getParameter("num2"));
        double num3 = Double.parseDouble(request.getParameter("num3"));
        double result = num2 * num3 * 0.01;
        double result2= num2-result;
        request.setAttribute("vu", result);
        request.setAttribute("vu2",result2);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request, response);
    }
}
