package adminpackage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class ProductAdd extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String servletPath = getServletContext().getRealPath("/");
        String uploadDirectory = servletPath + File.separator + "uploads";

        Path uploadPath = Paths.get(uploadDirectory).toAbsolutePath().normalize();

        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectories(uploadPath);
            } catch (IOException e) {
                throw new ServletException("Failed to create upload directory", e);
            }
        }

        Part filePart = request.getPart("image");
        String fileName = filePart != null ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : null;
        String filePath = uploadPath.resolve(fileName).toString();
        String name = getValueOrDefault(request.getParameter("name"));
        String description = getValueOrDefault(request.getParameter("description"));
        String specifications = getValueOrDefault(request.getParameter("specifications"));
        double price = Double.parseDouble(getValueOrDefault(request.getParameter("price"), "0.0"));
        int categoryId = Integer.parseInt(getValueOrDefault(request.getParameter("category_id"), "0"));
        int manufacturerId = Integer.parseInt(getValueOrDefault(request.getParameter("manufacturer_id"), "0"));
        int quantity = Integer.parseInt(getValueOrDefault(request.getParameter("quantity"), "0"));

        description = sanitizeInput(description);
        specifications = sanitizeInput(specifications);

        Dbcon dbConnector = new Dbcon();
        PrintWriter out = response.getWriter();

        try (InputStream fileContent = filePart != null ? filePart.getInputStream() : null) {
            if (filePart == null || fileName == null || fileContent == null) {
                out.println("Error: No file uploaded.");
                return; // Exit method if file upload fails
            }

            Files.copy(fileContent, uploadPath.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);

            dbConnector.connect();
            String insertQuery = "INSERT INTO products (name, description, specifications, price, category_id, manufacturer_id, quantity, img_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            int i = dbConnector.executePreparedStatementInt(insertQuery, name, description, specifications, price, categoryId, manufacturerId, quantity, fileName);
            dbConnector.disconnect();
            out.println("Success ");
            response.sendRedirect("./adminProductSpecs.jsp?product_id=" + i);
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }

    }

    private String getValueOrDefault(String value, String defaultValue) {
        return Optional.ofNullable(value).orElse(defaultValue);
    }

    private String getValueOrDefault(String value) {
        return getValueOrDefault(value, "");
    }

    private String sanitizeInput(String input) {
        if (input != null) {

            return input.replaceAll("[^a-zA-Z0-9\\s]", "");
        }
        return input;
    }
}
