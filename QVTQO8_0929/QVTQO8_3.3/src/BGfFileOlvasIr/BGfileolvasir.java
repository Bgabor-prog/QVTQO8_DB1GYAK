package BGfFileOlvasIr;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;


public class BGfileolvasir {

	public static void main(String[] args) {
		 Scanner reader = null;
	        FileWriter writer = null;
	        String szoveg;
	        String fajlnev;
	        
	        Scanner sc1 = new Scanner(System.in);
	        System.out.println("Adja meg a fajl nevet!");
	        fajlnev = sc1.nextLine();

	        try {
	            reader = new Scanner(System.in);
	 	         writer = new FileWriter(fajlnev + ".txt");
	       
	            while (true) {
	            	szoveg = reader.nextLine();
	                if (szoveg.equals("end")) {
	                	System.out.println("Ok!");
	                	System.out.println();
	                    break;
	                }
	                writer.write(szoveg);
	                writer.write("\n");
	            }
	        } catch (IOException e) {
	            System.out.println("Hiba tortent!");
	        } finally {
	            if (reader != null) {
	                reader.close();
	            }
	            try {
	                if (writer != null) {
	                    writer.close();
	                }
	            } catch (IOException e) {
	                System.out.println("Fajl bezarasa sikertelen");
	            }
	        }
	        
	        try {
	            File myObj = new File(fajlnev +".txt");
	            Scanner myReader = new Scanner(myObj);
	            
	            while (myReader.hasNextLine()) {
	              String data = myReader.nextLine();
	              System.out.println(data.toUpperCase());
	            }
	            
	            myReader.close();
	            
	          } catch (FileNotFoundException e) {
	            System.out.println("Hiba tortent!");
	            e.printStackTrace();
	            
	          }
	  }

}



