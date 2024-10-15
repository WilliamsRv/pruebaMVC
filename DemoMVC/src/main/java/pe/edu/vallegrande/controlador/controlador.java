package pe.edu.vallegrande.controlador;

import pe.edu.vallegrande.dao.ProductsDAO;
import pe.edu.vallegrande.dto.products;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/controlador") // Mapeo de la URL
public class controlador extends HttpServlet {

    private final ProductsDAO dao = new ProductsDAO();
    private static final String LISTAR = "vistas/Listar.jsp";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = "";

        switch (action) {
            case "listar":
                acceso = LISTAR;
                break;
            case "agregar":
                acceso = agregarProducto(request);
                break;
            case "editar":
                acceso = editarProducto(request);
                break;
            case "Actualizar":
                acceso = actualizarProducto(request);
                break;
            case "Restore":
                acceso = Restore(request);
                break;
            case "eliminar":
                acceso = eliminarProducto(request);
                break;
            default:
                acceso = LISTAR; // Por defecto, redirigir a listar
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = "";

        switch (action) {
            case "agregar":
                acceso = agregarProducto(request);
                break;
            case "Actualizar":
                acceso = actualizarProducto(request);
                break;
            // Agrega otros casos según sea necesario
            default:
                acceso = LISTAR; // Por defecto, redirigir a listar
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    private String agregarProducto(HttpServletRequest request) {
        products prod = new products();

        prod.setName(request.getParameter("txtName"));
        prod.setDescription(request.getParameter("txtDescription"));
        prod.setCategory(request.getParameter("txtCategory"));
        prod.setPurchase_price(new BigDecimal(request.getParameter("txtPpurchase")));
        prod.setSales_price(new BigDecimal(request.getParameter("txtPsale")));
        prod.setUnit(request.getParameter("txtUnit"));
        prod.setStatus(request.getParameter("txtStatus"));
        // Suponiendo que hay un método para setear el ID del proveedor
        dao.add(prod);
        return LISTAR;
    }


    private String editarProducto(HttpServletRequest request) {
        request.setAttribute("products_id", request.getParameter("id"));
        return LISTAR; // Devuelve a la lista, el formulario de edición se debe manejar en la vista
    }

    private String actualizarProducto(HttpServletRequest request) {
        products prod = new products();
        try {
            prod.setProducts_id(Integer.parseInt(request.getParameter("txtId")));
            prod.setName(request.getParameter("txtName"));
            prod.setDescription(request.getParameter("txtDescription"));
            prod.setCategory(request.getParameter("txtCategory"));
            prod.setPurchase_price(new BigDecimal(request.getParameter("txtPpurchase")));
            prod.setSales_price(new BigDecimal(request.getParameter("txtPsale")));
            prod.setUnit(request.getParameter("txtUnit"));
            //prod.setSuppliers_id(Integer.parseInt(getInitParameter("txtProveedor")));

            prod.setStatus(request.getParameter("txtStatus"));
            // Obtener el ID del proveedor

            dao.edit(prod);
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Manejo de excepciones si la conversión falla
        }
        return LISTAR;
    }

    private String eliminarProducto(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.eliminar(id);
        return LISTAR;
    }
    private String Restore(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.Restore(id);
        return LISTAR;
    }

}