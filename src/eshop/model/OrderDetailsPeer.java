package eshop.model;

import java.util.Set;
import java.util.HashMap;
import java.sql.SQLException;
import java.sql.Statement;
import eshop.beans.CartItem;

public class OrderDetailsPeer {

	public static void insertOrderDetails(Statement stmt, long orderId, HashMap<String, CartItem> shoppingCart)
			throws SQLException {
		String sql;
		Set<String> claves = shoppingCart.keySet();
		for (String clave : claves) {
			CartItem item = shoppingCart.get(clave);
			sql = "insert into order_details (order_id, book_id, quantity," + " price, title, author) values ('"
					+ orderId + "','" + item.getBook().getId() + "','" + item.getQuantity() + "','"
					+ item.getBook().getPrice() + "','" + item.getBook().getTitle() + "','" + item.getBook().getAuthor()
					+ "')";
			stmt.executeUpdate(sql);
		}
	}
}
