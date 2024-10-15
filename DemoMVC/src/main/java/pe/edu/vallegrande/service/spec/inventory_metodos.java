package pe.edu.vallegrande.service.spec;

import pe.edu.vallegrande.dto.inventory;

import java.sql.SQLException;
import java.util.List;

public interface inventory_metodos {

        // Listar todos los inventarios
        public List listar();

        // Obtener un inventario por ID
        public inventory list(int id);

        // Agregar un nuevo inventario
        public boolean add(inventory I);

        // Editar un inventario existente
        public boolean edit(inventory I);

        // Eliminar un inventario por ID
        public boolean eliminar(int id);
}