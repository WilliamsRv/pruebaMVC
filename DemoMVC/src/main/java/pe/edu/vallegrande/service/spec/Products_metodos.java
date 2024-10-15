package pe.edu.vallegrande.service.spec;

import pe.edu.vallegrande.dto.products;

import java.util.List;

public interface Products_metodos  {

    public List listar();
    public products list(int id);
    public boolean add(products p);
    public boolean edit(products p);
    public boolean eliminar(int id);
    public boolean Restore(int id);



}
