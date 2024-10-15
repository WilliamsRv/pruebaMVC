package pe.edu.vallegrande.dao;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.dto.products;
import pe.edu.vallegrande.service.spec.Products_metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO implements Products_metodos {
    private final AccesoDB db = new AccesoDB();

    @Override
    public List<products> listar() {
        List<products> list = new ArrayList<>();
        String sql = "SELECT " +
                "p.products_id, " +
                "p.name, " +
                "p.description, " +
                "p.purchase_price, " +
                "p.category, " +
                "p.sale_price, " +
                "p.unit, " +
                "p.Suppliers_suppliers_id, " +
                "p.Status, "+
                "i.quantity " + // Agregar la cantidad aquí
                "FROM Products p " + // Cambié aquí, primero Products y luego Inventory
                "LEFT JOIN Inventory i ON i.Products_products_id = p.products_id"; // Uso de LEFT JOIN para incluir todos los productos

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                products pro = new products();
                pro.setProducts_id(rs.getInt("products_id"));
                pro.setName(rs.getString("name"));
                pro.setDescription(rs.getString("description"));
                pro.setCategory(rs.getString("category"));
                pro.setPurchase_price(rs.getBigDecimal("purchase_price"));
                pro.setSales_price(rs.getBigDecimal("sale_price"));
                pro.setUnit(rs.getString("unit"));
                pro.setSuppliers_id(rs.getInt("Suppliers_suppliers_id")); // Asegúrate de que esta columna exista en tu base de datos
                pro.setQuantity(rs.getInt("quantity"));
                pro.setStatus(rs.getString("Status"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return list;
    }

    @Override
    public products list(int id) {
        String sql = "SELECT * FROM products WHERE products_id = ?";
        products p = null;

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new products();
                p.setProducts_id(rs.getInt("products_id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategory(rs.getString("category"));
                p.setPurchase_price(rs.getBigDecimal("purchase_price"));
                p.setSales_price(rs.getBigDecimal("sale_price"));
                p.setSuppliers_id(rs.getInt("Suppliers_suppliers_id"));
                p.setUnit(rs.getString("unit"));
               // Asegúrate de que esta columna exista en tu base de datos
                p.setStatus(rs.getString("Status"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }

        return p;
    }

    @Override
    public boolean add(products p) {
        String sql = "INSERT INTO Products (name, description, category, purchase_price, sale_price, unit ) VALUES ( ?, ?, ?, ?, ?, ?)";

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {


            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getCategory());
            ps.setBigDecimal(4, p.getPurchase_price());
            ps.setBigDecimal(5, p.getSales_price());
            ps.setString(6, p.getUnit());
             // Suponiendo que hay un método para obtener el ID del proveedor
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }

        return false;
    }

    @Override
    public boolean edit(products p) {
        String sql = "UPDATE Products SET name = ?, description = ?, category = ?, purchase_price = ?, sale_price = ?, unit = ?, Status= ? WHERE products_id = ?";

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getCategory());
            ps.setBigDecimal(4, p.getPurchase_price());
            ps.setBigDecimal(5, p.getSales_price());
            ps.setString(6, p.getUnit());
             // Suponiendo que hay un método para obtener el ID del proveedor
            ps.setInt(8, p.getProducts_id());
            ps.setString(7, p.getStatus());
           // ps.setInt(9, p.getSuppliers_id());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }

        return false;
    }


    @Override
    public boolean eliminar(int id) {
        String sql = "UPDATE Products SET Status = ? WHERE products_id = ?";

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // Establece el estado para indicar que el producto está "eliminado" (por ejemplo, 0 o "eliminado")
            ps.setString(1, "I"); // o usa un valor específico según tu lógica
            ps.setInt(2, id);

            int filasActualizadas = ps.executeUpdate();
            return filasActualizadas > 0; // Devuelve verdadero si se actualizó al menos una fila

        } catch (Exception e) {
            e.printStackTrace(); // Considera usar un marco de logging
        }

        return false;
    }

    @Override
    public boolean Restore(int id) {
        String sql = "UPDATE Products SET Status = ? WHERE products_id = ?";

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // Establece el estado para indicar que el producto está "eliminado" (por ejemplo, 0 o "eliminado")
            ps.setString(1, "A"); // o usa un valor específico según tu lógica
            ps.setInt(2, id);

            int filasActualizadas = ps.executeUpdate();
            return filasActualizadas > 0; // Devuelve verdadero si se actualizó al menos una fila

        } catch (Exception e) {
            e.printStackTrace(); // Considera usar un marco de logging
        }


        return false;
    }
}
