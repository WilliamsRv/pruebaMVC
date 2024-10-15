<%--
  Created by IntelliJ IDEA.
  User: willi
  Date: 12/10/2024
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="d-flex">
    <div id="sidebar-container" class="bg-primary" style="width: 250px; height: 100vh;">
        <div class="logo">
            <h4 class="text-light font-weight-bold">AGROZAM</h4>
        </div>
        <div class="menu">
            <a href="index.jsp?page=dashboard" class="d-block text-light p-3"><i
                    class="icon ion-md-albums me-2 lead"></i>Tablero Principal</a>
            <a href="#" class="d-block text-light p-3" data-bs-toggle="collapse" data-bs-target="#productosMenu"
               aria-expanded="false" aria-controls="productosMenu">
                <i class="icon ion-md-contacts me-2 lead"></i>Productos
            </a>
            <div class="collapse" id="productosMenu">
                <a href="inventoryController?accion=listar" class="d-block text-light p-3 ps-5"><i
                        class="icon ion-md-inventory me-2 lead"></i>Inventario</a>
                <a href="#" class="d-block text-light p-3 ps-5"><i class="icon ion-md-add-circle me-2 lead"></i>Carga
                    Masiva</a>
                <a href="#" class="d-block text-light p-3 ps-5"><i class="icon ion-md-list me-2 lead"></i>Categoría</a>
            </div>
            <a href="" class="d-block text-light p-3"><i class="icon ion-md-podium me-2 lead"></i>Ventas</a>
            <a href="" class="d-block text-light p-3"><i class="icon ion-md-contact me-2 lead"></i>Compras</a>
            <a href="" class="d-block text-light p-3"><i class="icon ion-md-settings me-2 lead"></i>Reportes</a>
            <a href="" class="d-block text-light p-3"><i class="icon ion-md-settings me-2 lead"></i>Configuraciones</a>
        </div>
    </div>

    <div class="flex-grow-1">
        <nav class="navbar navbar-expand-lg bg-blanco">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse align-items-center" id="navbarSupportedContent">
                    <form class="d-flex me-auto position-relative" role="search">
                        <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-search position-absolute" type="submit"
                                style="right: 10px; top: 50%; transform: translateY(-50%);">
                            <i class="icon ion-md-search"></i>
                        </button>
                    </form>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="./img/descarga.jpg" class="img-fluid rounded-circle mgin"
                                     style="width: 30px; height: 30px; object-fit: cover;">
                                <span class="ms-2">Admin</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Perfil</a>
                                <a class="dropdown-item" href="#">#######</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Cerrar Sesion</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <c:choose>
            <c:when test="${param.page == 'dashboard' || param.page == null}">
                <div class="container mt-4">
                    <h2 class="text-center">Tablero Principal</h2>
                </div>
                <div class="container mt-4">
                    <div class="row">
                        <div class="col-md-2 mb-3">
                            <div class="p-5" style="background-color: #ffcccc; height: 150px;">Elemento 1</div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <div class="p-5" style="background-color: #ccffcc; height: 150px;">Elemento 2</div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <div class="p-5" style="background-color: #ccccff; height: 150px;">Elemento 3</div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <div class="p-5" style="background-color: #ffffcc; height: 150px;">Elemento 4</div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <div class="p-5" style="background-color: #ffccff; height: 150px;">Elemento 5</div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <div class="p-5" style="background-color: #ccffff; height: 150px;">Elemento 6</div>
                        </div>
                    </div>
                </div>

                <div class="row mt-4" style="margin:20px">
                    <div class="col-md-12">
                        <h4>Total Ventas del Mes</h4>
                        <div class="bg-info text-white p-4" style="border-radius: 5px; max-width: 400px; margin: auto;">
                            <h1>${totalVentas}</h1>
                        </div>
                    </div>
                </div>

                <div class="row mt-4" style="margin: 20px">
                    <div class="col-md-6">
                        <h4>Top de Productos Más Vendidos</h4>
                        <div class="bg-success text-white p-4" style="border-radius: 5px; max-width: 800px;">
                            <ul class="list-unstyled">
                                <li>Producto A - 300 unidades</li>
                                <li>Producto B - 250 unidades</li>
                                <li>Producto C - 200 unidades</li>
                                <li>Producto D - 150 unidades</li>
                                <li>Producto E - 100 unidades</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4>Productos con Poco Stock</h4>
                        <div class="bg-warning text-dark p-4" style="border-radius: 5px; max-width: 800px;">
                            <ul class="list-unstyled">
                                <li>Producto X - 5 unidades</li>
                                <li>Producto Y - 3 unidades</li>
                                <li>Producto Z - 2 unidades</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${param.page == 'inventory'}">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <h4>Inventario</h4>
                        <div class="bg-light p-4" style="border-radius: 5px;">
                            <h5>Detalles del Inventario</h5>
                            <ul class="list-unstyled">
                                <c:forEach var="producto" items="${inventario}">
                                    <li>${producto.nombre} - ${producto.cantidad} unidades</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <h4>Filtros de Consulta</h4>
                            <div class="row">
                                <div class="col-md-2 mb-3">
                                    <div class="p-4"
                                         style="background-color: #e7f3fe; height: 150px; border-radius: 5px;">
                                        <label for="codigo" class="form-label">Búsqueda por Código</label>
                                        <input type="text" id="codigo" class="form-control" placeholder="Código">
                                    </div>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <div class="p-4"
                                         style="background-color: #e7f3fe; height: 150px; border-radius: 5px;">
                                        <label for="categoria" class="form-label">Búsqueda por Categoría</label>
                                        <select id="categoria" class="form-select">
                                            <option value="">Seleccionar categoría</option>
                                            <!-- Opciones de categorías aquí -->
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <div class="p-4"
                                         style="background-color: #e7f3fe; height: 150px; border-radius: 5px;">
                                        <label for="producto" class="form-label">Búsqueda por Producto</label>
                                        <input type="text" id="producto" class="form-control"
                                               placeholder="Nombre del Producto">
                                    </div>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <div class="p-4"
                                         style="background-color: #e7f3fe; height: 150px; border-radius: 5px;">
                                        <label for="precioDesde" class="form-label">Precio de Venta Desde</label>
                                        <input type="number" id="precioDesde" class="form-control" placeholder="Desde">
                                    </div>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <div class="p-4"
                                         style="background-color: #e7f3fe; height: 150px; border-radius: 5px;">
                                        <label for="precioHasta" class="form-label">Precio de Venta Hasta</label>
                                        <input type="number" id="precioHasta" class="form-control" placeholder="Hasta">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12 d-flex justify-content-between align-items-center">
                            <div>
                                <button type="button" class="btn btn-primary me-2" data-bs-toggle="modal"
                                        data-bs-target="#agregarProductoModal">
                                    Agregar Producto
                                </button>
                                <button class="btn btn-secondary me-2">Modificar Producto</button>
                                <button class="btn btn-danger me-2">Eliminar Producto</button>
                                <div class="dropdown d-inline">
                                    <button class="btn btn-success dropdown-toggle" type="button"
                                            id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                        Opciones
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <li><a class="dropdown-item" href="#">Opción 1</a></li>
                                        <li><a class="dropdown-item" href="#">Opción 2</a></li>
                                        <li><a class="dropdown-item" href="#">Opción 3</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="agregarProductoModal" tabindex="-1"
                                 aria-labelledby="agregarProductoModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="agregarProductoModalLabel">Agregar Producto</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="controlador" method="post">
                                                <div class="form-group">
                                                    <label>Nombre:</label>
                                                    <input type="text" name="txtName" class="form-control" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Descripción:</label>
                                                    <input type="text" name="txtDescription" class="form-control"
                                                           required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Categoría:</label>
                                                    <input type="text" name="txtCategory" class="form-control" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Precio Compra:</label>
                                                    <input type="text" name="txtPpurchase" class="form-control"
                                                           required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Precio Venta:</label>
                                                    <input type="text" name="txtPsale" class="form-control" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Unidad:</label>
                                                    <input type="text" name="txtUnit" class="form-control" required>
                                                </div>
                                                <button type="submit" name="accion" value="agregar"
                                                        class="btn btn-success">Agregar
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <c:if test="${not empty param.accion and param.accion == 'add'}">
                                <h2>Agregar Producto</h2>
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
                                    <button type="submit" name="accion" value="agregar" class="btn btn-success">
                                        Agregar
                                    </button>
                                </form>
                            </c:if>
                            <div>
                                <form class="d-flex">
                                    <input class="form-control me-2" type="search" placeholder="Buscar producto"
                                           aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">Buscar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <h4>Lista de Inventario</h4>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Código</th>
                                        <th>Nombre del Producto</th>
                                        <th>Categoría</th>
                                        <th>Cantidad</th>
                                        <th>Precio de Venta</th>
                                        <th>ID Proveedor</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="producto" items="${inventario}">
                                        <tr>
                                            <td>${producto.inventoryId}</td>       <!-- Cambia según tu DTO -->
                                            <td>${producto.name}</td>               <!-- Nombre del producto -->
                                            <td>${producto.category}</td>           <!-- Categoría -->
                                            <td>${producto.quantity}</td>           <!-- Cantidad -->
                                            <td>${producto.salePrice}</td>          <!-- Precio de venta -->
                                            <td>${producto.suppliers_id}</td>      <!-- ID del proveedor -->
                                            <td>
                                                <a href="controlador?accion=editar&id=${producto.inventoryId}"
                                                   class="btn btn-warning">Editar</a>
                                                <a href="controlador?accion=eliminar&id=${producto.inventoryId}"
                                                   class="btn btn-danger">Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </c:when>
        </c:choose>
    </div>
</div>
</body>
</html>
