/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pe.Interfaz;

import com.pe.model.entity.Trabajador;
import java.util.List;

/**
 *
 * @author Angel Albinagorta
 */
public interface CRUDEmpleado {
     public List ListadoEmpleado();
    public Trabajador list(int id);
    public boolean add(Trabajador pri);
    public boolean Edit(Trabajador pri);
    public boolean Eliminar(int id);
}
