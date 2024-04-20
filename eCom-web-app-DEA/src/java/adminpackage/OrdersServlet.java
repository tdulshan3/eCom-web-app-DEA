package adminpackage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Order> orders = fetchOrdersFromDatabase();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("adminorder.jsp").forward(request, response);
    }

    private List<Order> fetchOrdersFromDatabase() {
        List<Order> orders = new ArrayList<>();
        Dbcon db = new Dbcon();

        try {
            db.connect();
            ResultSet rs = db.executeQuery("SELECT `o`.`order_id`, `o`.`cart_id`, `u`.`FirstName`, `u`.`LastName`, `u`.`Phone`, `u`.`email`, `u`.`Address`, `p`.`name`, `o`.`status`, `p`.`price`, `c`.`cart_details`, `p`.`price` * `c`.`cart_details` AS `total` "
                        + "FROM `order` `o` "
                        + "JOIN `cart` `c` ON `o`.`cart_id` = `c`.`cart_id` "
                        + "JOIN `user` `u` ON `c`.`user_id` = `u`.`userid` "
                        + "JOIN `products` `p` ON `c`.`cart_details` LIKE CONCAT('%', `p`.`product_id`, '%')");

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setCartId(rs.getInt("cart_id"));
                order.setUserName(rs.getString("FirstName") + " " + rs.getString("LastName"));
                order.setContactNumber(rs.getString("Phone"));
                order.setEmail(rs.getString("email"));
                order.setAddress(rs.getString("Address"));
                order.setProductName(rs.getString("name"));
                order.setStatus(rs.getString("status"));
                order.setPrice(rs.getDouble("price"));
                order.setQuantity(Integer.parseInt(rs.getString("cart_details").split(":")[1]));
                order.setTotal(rs.getDouble("total"));

                orders.add(order);
            }

            rs.close();
            db.disconnect();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
}
