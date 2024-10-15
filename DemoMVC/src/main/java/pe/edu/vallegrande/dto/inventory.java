package pe.edu.vallegrande.dto;

import java.sql.Date;

public class inventory {
    private int inventoryId; // inventory_id
    private int quantity;     // quantity
    private Date updateDate; // update_date
    private int productsId;   // Products_products_id (FK)

    // Constructor
    public void Inventory(int inventoryId, int quantity, Date updateDate, int productsId) {
        this.inventoryId = inventoryId;
        this.quantity = quantity;
        this.updateDate = updateDate;
        this.productsId = productsId;
    }

    // Getters and Setters
    public int getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(int inventoryId) {
        this.inventoryId = inventoryId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getProductsId() {
        return productsId;
    }

    public void setProductsId(int productsId) {
        this.productsId = productsId;
    }

}
