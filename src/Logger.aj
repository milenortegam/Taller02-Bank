
public aspect Logger {
	
	 pointcut success() : call(* create*(..) );
	    after() : success() {
	    /*Muestra este mensaje después de haber creado un usuario */
	    	System.out.println("**** Usuario creado ****");
	    }
	    
	
	
	

}
