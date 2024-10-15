package pe.edu.vallegrande.service.spec;

import java.util.List;

public interface CrudSpec<T> {

    /**
     * Permite leer todos los registros de la tabla.
     * @return Retorna una lista con todos los registros de la tabla.
     */
    List<T> leerTodos();

    /**
     * Permite leer registros en base a un criterio, ideal para hacer busquedas.
     * @param bean Se trata de un objetos con los datos para hacer la busqueda de registros.
     * @return Retorna una lista con los registros encontrados segun el criterio de busqueda.
     */
    List<T> leerTodos(T bean);

    /**
     * Permite consultar un registro de la tabla en función a su ID.
     * @param id Se refiere al valor del ID del registro a consultar.
     * @return Retorna el registro de la tabla en función a su ID.
     */
    T leerPorId(int id);

    T grabar(T bean);

    T actualizar(T bean);

    int eliminar(int id);


}
