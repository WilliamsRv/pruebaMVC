<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="pe.edu.vallegrande.dao.ProductsDAO" %>
<%@ page import="pe.edu.vallegrande.dto.products" %>
<%@ page import="java.util.List" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">

    <h1>Productos</h1>
    <a href="#" data-toggle="modal" data-target="#addProductModal"
       data-accion="add" class="btn btn-primary mb-3" >Agregar
    </a>

    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Categoría</th>
            <th>Precio Compra</th>
            <th>Precio Venta</th>
            <th>Unidad</th>
            <th>Cantidad</th> <!-- Nueva columna para cantidad -->
            <th>ID Proveedor</th> <!-- Cambiado a ID Proveedor -->
            <th>Estado</th>
            <th>Acciones</th>

        </tr>
        </thead>
        <tbody>
        <%
            ProductsDAO dao = new ProductsDAO();
            List<products> list = dao.listar();
            for (products product : list) {
        %>
        <tr>
            <td><%= product.getProducts_id() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getCategory() %></td>
            <td><%= product.getPurchase_price() %></td>
            <td><%= product.getSales_price() %></td>
            <td><%= product.getUnit() %></td>
            <td><%= product.getQuantity() %></td> <!-- Mostrar cantidad -->
            <td><%= product.getSuppliers_id() %></td> <!-- Mostrar el ID del proveedor -->
            <td><%= product.getStatus() %></td>
            <td>
                <a href="#" data-toggle="modal" data-target="#addProductModal"
                   data-accion="add" data-id="<%= product.getProducts_id() %>">
                    <i class="icon ion-md-add"></i>
                </a>
                <a href="controlador?accion=editar&id=<%= product.getProducts_id() %>">
                    <i class="icon ion-md-create"></i>
                </a>
                <!--<a href="controlador?accion=add&id=<%= product.getProducts_id() %>"><i class="icon ion-md-add"></i></a>-->
                <!--<a href="controlador?accion=editar&id=<%= product.getProducts_id() %>" ><i class="icon ion-md-create"></i></a>-->
                <a href="controlador?accion=eliminar&id=<%= product.getProducts_id() %>" ><i class="icon ion-md-trash"></i></a>
                <a href="controlador?accion=Restore&id=<%= product.getProducts_id() %>" ><i class="icon ion-md-refresh"></i></a>

            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">Agregar Producto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="controlador" method="post">
                        <div class="form-group">
                            <label>Nombre:</label>
                            <input type="text" name="txtName" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Descripción:</label>
                            <input type="text" name="txtDescription" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Categoría:</label>
                            <input type="text" name="txtCategory" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Precio Compra:</label>
                            <input type="text" name="txtPpurchase" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Precio Venta:</label>
                            <input type="text" name="txtPsale" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Unidad:</label>
                            <input type="text" name="txtUnit" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Estado:</label>
                            <input type="text" name="txtStatus" class="form-control" required>
                        </div>
                        <button type="submit" name="accion" value="agregar" class="btn btn-success">Agregar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty param.accion and param.accion == 'editar'}">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            products productToEdit = dao.list(id);
        %>
        <div class="modal fade show" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true" style="display: block;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editProductModalLabel">Editar Producto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="window.location.href='controlador?accion=listar'">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="controlador" method="post">
                            <input type="hidden" name="txtId" value="<%= productToEdit.getProducts_id() %>" readonly>
                            <div class="form-group">
                                <label>Nombre:</label>
                                <input type="text" name="txtName" class="form-control" value="<%= productToEdit.getName() %>" required>
                            </div>
                            <div class="form-group">
                                <label>Descripción:</label>
                                <input type="text" name="txtDescription" class="form-control" value="<%= productToEdit.getDescription() %>" required>
                            </div>
                            <div class="form-group">
                                <label>Categoría:</label>
                                <input type="text" name="txtCategory" class="form-control" value="<%= productToEdit.getCategory() %>" required>
                            </div>
                            <div class="form-group">
                                <label>Precio Compra:</label>
                                <input type="text" name="txtPpurchase" class="form-control" value="<%= productToEdit.getPurchase_price() %>" required>
                            </div>
                            <div class="form-group">
                                <label>Precio Venta:</label>
                                <input type="text" name="txtPsale" class="form-control" value="<%= productToEdit.getSales_price() %>" required>
                            </div>
                            <div class="form-group">
                                <label>Unidad:</label>
                                <input type="text" name="txtUnit" class="form-control" value="<%= productToEdit.getUnit() %>" required>
                            </div>
                            <div class="form-group">
                                <label>ID Proveedor:</label>
                                <input type="text" name="txtProveedor" class="form-control" value="<%= productToEdit.getSuppliers_id() %>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Estado:</label>
                                <input type="text" name="txtStatus" class="form-control" value="<%= productToEdit.getStatus() %>" required>
                            </div>

                            <button type="submit" name="accion" value="Actualizar" class="btn btn-primary">Actualizar</button>
                            <a href="controlador?accion=listar" class="btn btn-secondary">Regresar</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
