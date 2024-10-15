package pe.edu.vallegrande.controlador;

import pe.edu.vallegrande.dao.InventoryDAO;
import pe.edu.vallegrande.dto.inventory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/inventoryController") // Mapeo de la URL
public class controladorinventario extends HttpServlet {

    private final InventoryDAO dao = new InventoryDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        if (action == null || action.isEmpty()) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                List<inventory> inventarios = dao.listar(); // Obtiene todos los inventarios
                request.setAttribute("inventario", inventarios);
                break;
            case "agregar":
                agregarInventario(request);
                break;
            case "editar":
                editarInventario(request);
                break;
            case "actualizar":
                actualizarInventario(request);
                break;
            case "eliminar":
                eliminarInventario(request);
                break;
            default:
                break;
        }

        // Redirigir a index.jsp con la sección de inventario
        RequestDispatcher vista = request.getRequestDispatcher("index.jsp?page=inventory");
        vista.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        if ("agregar".equals(action)) {
            agregarInventario(request);
        } else if ("actualizar".equals(action)) {
            actualizarInventario(request);
        }
        // Redirigir a la lista de inventarios
        response.sendRedirect("inventoryController?accion=listar");
    }

    private void agregarInventario(HttpServletRequest request) {
        inventory inv = new inventory();
        inv.setQuantity(Integer.parseInt(request.getParameter("txtQuantity")));
        inv.setUpdateDate(new Date(System.currentTimeMillis()));
        inv.setProductsId(Integer.parseInt(request.getParameter("txtProductId")));
        dao.add(inv);
    }

    private void editarInventario(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        //inventory inv = dao.obtener(id); // Obtiene el inventario por ID
        //request.setAttribute("inventario", inv);
    }

    private void actualizarInventario(HttpServletRequest request) {
        inventory inv = new inventory();
        inv.setInventoryId(Integer.parseInt(request.getParameter("txtId")));
        inv.setQuantity(Integer.parseInt(request.getParameter("txtQuantity")));
        inv.setUpdateDate(new Date(System.currentTimeMillis()));
        inv.setProductsId(Integer.parseInt(request.getParameter("txtProductId")));
        dao.edit(inv);
    }

    private void eliminarInventario(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.eliminar(id);
    }
}
