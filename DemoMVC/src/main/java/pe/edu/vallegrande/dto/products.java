package pe.edu.vallegrande.dto;

import java.math.BigDecimal;

public class products {
    private int products_id;
    private String name;
    private String description;
    private String category;
    private BigDecimal purchase_price;
    private BigDecimal sales_price;
    private String unit;
    private int suppliers_id; // Nuevo campo para el ID del proveedor
    private int quantity;
    private String status; // Cambiado a minúscula

    public products() {
    }

    public products(int products_id, String name, String description, String category, BigDecimal purchase_price, BigDecimal sales_price, String unit, int suppliers_id, int quantity, String status) { // Cambiado a minúscula
        this.products_id = products_id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.purchase_price = purchase_price;
        this.sales_price = sales_price;
        this.unit = unit;
        this.suppliers_id = suppliers_id;
        this.quantity = quantity;
        this.status = status; // Cambiado a minúscula
    }

    public int getProducts_id() {
        return products_id;
    }

    public void setProducts_id(int products_id) {
        this.products_id = products_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public BigDecimal getPurchase_price() {
        return purchase_price;
    }

    public void setPurchase_price(BigDecimal purchase_price) {
        this.purchase_price = purchase_price;
    }

    public BigDecimal getSales_price() {
        return sales_price;
    }

    public void setSales_price(BigDecimal sales_price) {
        this.sales_price = sales_price;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getSuppliers_id() {
        return suppliers_id;
    }

    public void setSuppliers_id(int suppliers_id) {
        this.suppliers_id = suppliers_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() { // Cambiado a minúscula
        return status; // Cambiado a minúscula
    }

    public void setStatus(String status) { // Cambiado a minúscula
        this.status = status; // Cambiado a minúscula
    }
}
