package com.example.profile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Receives the profile form (HTTP POST), reads the submitted values,
 * stores them as request attributes and forwards to profile.jsp.
 * Mapped to /profile in WEB-INF/web.xml.
 */
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Make sure non-ASCII characters are read correctly
        request.setCharacterEncoding("UTF-8");

        // Parameter names must match the "name" attributes in index.html
        String name      = clean(request.getParameter("name"));
        String studentId = clean(request.getParameter("studentId"));
        String programme = clean(request.getParameter("programme"));
        String email     = clean(request.getParameter("email"));
        String hobbies   = clean(request.getParameter("hobbies"));
        String intro     = clean(request.getParameter("intro"));

        // Split hobbies on commas so the JSP can show them as tags
        List<String> hobbyList = new ArrayList<>();
        if (!hobbies.isEmpty()) {
            for (String h : hobbies.split(",")) {
                String trimmed = h.trim();
                if (!trimmed.isEmpty()) {
                    hobbyList.add(trimmed);
                }
            }
        }

        // Pass the data to the JSP
        request.setAttribute("name", name);
        request.setAttribute("studentId", studentId);
        request.setAttribute("programme", programme);
        request.setAttribute("email", email);
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("hobbyList", hobbyList);
        request.setAttribute("intro", intro);

        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    /** Opening the servlet URL directly (GET) just sends the user back to the form. */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + "/index.html");
    }

    private static String clean(String value) {
        return value == null ? "" : value.trim();
    }
}
