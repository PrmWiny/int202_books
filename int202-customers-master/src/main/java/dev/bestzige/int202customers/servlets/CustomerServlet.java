package dev.bestzige.int202customers.servlets;

import dev.bestzige.int202customers.models.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {

    List<Customer> customers = new ArrayList<>(); // customers list

    @Override
    public void init() {
        // Initialize customers list
        getServletContext().setAttribute("customers", customers);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        // if id not null = customer detail page
        if(id != null) {
            // find customer by id
            Customer customer = customers.stream().filter(cus -> cus.getId() == Integer.parseInt(id)).findFirst().orElse(null);
            if(customer == null) {
                resp.sendError(404);
            } else {
                req.setAttribute("customer", customer);
                getServletContext().getRequestDispatcher("/customer-details.jsp").forward(req, resp);
            }
            return;
        }

        getServletContext().getRequestDispatcher("/customers.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null) {
            resp.sendError(200);
            return;
        }

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");

        Customer customer = null;
        if(id != null) {
            customer = customers.stream().filter(cus -> cus.getId() == Integer.parseInt(id)).findFirst().orElse(null);
            if(customer == null) {
                resp.sendError(404);
                return;
            }
        }

        if(action.equalsIgnoreCase("addCustomer")) {
            customers.add(new Customer(name, phone));
        }

        if(action.equalsIgnoreCase("updateCustomer")) {
                customer.setName(name);
                customer.setPhone(phone);
        }

        if(action.equalsIgnoreCase("deleteCustomer")) {
            customers.remove(customer);
        }

        getServletContext().setAttribute("customers", customers); // set new customers list to servlet context
        getServletContext().getRequestDispatcher("/customers.jsp").forward(req, resp);
    }
}
