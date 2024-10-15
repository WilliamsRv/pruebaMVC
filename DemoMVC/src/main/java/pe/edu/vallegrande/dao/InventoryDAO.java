package pe.edu.vallegrande.dao;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.dto.inventory;
import pe.edu.vallegrande.service.spec.inventory_metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InventoryDAO implements inventory_metodos {
    private final AccesoDB db = new AccesoDB();

    @Override
    public List<inventory> listar() {
        List<inventory> list = new ArrayList<>();
        String sql = "SELECT * FROM Inventory"; // Aquí puedes modificar la consulta según necesites

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                inventory inv = new inventory();
                inv.setInventoryId(rs.getInt("inventory_id"));
                inv.setQuantity(rs.getInt("quantity"));
                inv.setUpdateDate(rs.getDate("update_date"));
                inv.setProductsId(rs.getInt("Products_products_id"));
                list.add(inv);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return list;
    }

    @Override
    public inventory list(int id) {
        String sql = "SELECT * FROM Inventory WHERE inventory_id = ?";
        inventory inv = null;

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                inv = new inventory();
                inv.setInventoryId(rs.getInt("inventory_id"));
                inv.setQuantity(rs.getInt("quantity"));
                inv.setUpdateDate(rs.getDate("update_date"));
                inv.setProductsId(rs.getInt("Products_products_id"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }

        return inv;
    }

    @Override
    public boolean add(inventory I) {
        String sql = "INSERT INTO Inventory (quantity, update_date, Products_products_id) VALUES (?, ?, ?)";

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, I.getQuantity());
            ps.setDate(2, new java.sql.Date(I.getUpdateDate().getTime()));
            ps.setInt(3, I.getProductsId());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }

        return false;
    }

    @Override
    public boolean edit(inventory I) {
        String sql = "UPDATE Inventory SET quantity = ?, update_date = ?, Products_products_id = ? WHERE inventory_id = ?";

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, I.getQuantity());
            ps.setDate(2, new java.sql.Date(I.getUpdateDate().getTime()));
            ps.setInt(3, I.getProductsId());
            ps.setInt(4, I.getInventoryId());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }

        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Inventory WHERE inventory_id = ?";

        try (Connection con = db.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }

        return false;
    }
}
