package data;

import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ProductosGroup;
import java.lang.reflect.Array;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Davfer
 */

public class EVDataAccess implements IDataConstants {
	
	private static EVDataAccess instance;
	private Connection conexion;
	
	private EVDataAccess() {
            try {
		    conexion = DriverManager.getConnection(CONN_STRING);
		} 
                    catch (Exception ex) {
			ex.printStackTrace();
                    }
        }

	public synchronized static EVDataAccess getInstance() {
		if (instance==null) {
			instance = new EVDataAccess();
		}
		return instance;
	}
	
	public ArrayList<ProductosGroup> getFilteredClients(String pFilter) {
            
		ArrayList<ProductosGroup> result = new ArrayList<ProductosGroup>();
		try {
			
			// option de llamada de un query directo
			//Statement stmt = conexion.createStatement();
                        //String SQL = "SELECT nombre, apellido1, apellido2 FROM dbo.Clientes";
                        //ResultSet rs = stmt.executeQuery(SQL);
		    
			// haciendo una llamada a un stored procedure
			PreparedStatement spGetFilteredClients = conexion.prepareStatement("{call InsertarProductosGroup(?)}");
			spGetFilteredClients.setString(1, pFilter);  
                        ResultSet rs = spGetFilteredClients.executeQuery(); 
		
		   
                        while (rs.next()) {
                            ProductosGroup newClient = new ProductosGroup();
                            //newClient.setNombre(rs.getString("nombre"));
                            //newClient.setApellido1(rs.getString("apellido1"));
                            //newClient.setApellido2(rs.getString("apellido2"));
                            //result.add(newClient);
		    }
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
        
        public void registrarVenta(List<ProductosGroup> pListaProdu) throws SQLException { 
            
            SQLServerDataTable sourceDataTable = new SQLServerDataTable();
            System.out.println("TVP preparado");
            
            sourceDataTable.addColumnMetadata("productosGroupID" ,java.sql.Types.VARCHAR);
            sourceDataTable.addColumnMetadata("productoID" ,java.sql.Types.INTEGER);
            sourceDataTable.addColumnMetadata("cantidad" ,java.sql.Types.SMALLINT);
            
            for (ProductosGroup pg : pListaProdu) {
                sourceDataTable.addRow(pg.getProductosGroupID(), pg.getProductoID(), pg.getCantidad());
                System.out.println("producto registrado");
            }
            
            PreparedStatement pStmt = conexion.prepareStatement("{CALL VentasJava(?)}");
            System.out.println("Statament preparado");
            pStmt.setObject(1, sourceDataTable);
            System.out.println("Parametro preparado");
            pStmt.execute();    
            System.out.println("Statament ejecutado");
            
        }
}
