package common;

import java.util.UUID;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

public class ProductosGroup {
    
    private UUID productosGroupID;
    private int productoID;
    private int cantidad;

    public UUID getProductosGroupID() {
        return productosGroupID;
    }

    public void setProductosGroupID(UUID productosGroupID) {
        this.productosGroupID = productosGroupID;
    }

    public int getProductoID() {
        return productoID;
    }

    public void setProductoID(int productoID) {
        this.productoID = productoID;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}