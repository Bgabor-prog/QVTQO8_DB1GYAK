package BGFileOlvas;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.Scanner;

public class bgfileolvas {

	public static void main(String[] args) throws IOException {
		
		BufferedReader reader = new BufferedReader(new FileReader("bartokgabor.txt"));
		int lines = 0;
		while (reader.readLine() != null) lines++;
		reader.close();
		
		System.out.println("Adatok szama =  " + lines);
	
		LineNumberReader lineNumberReader = null;
	      try
	      {
	       
	         lineNumberReader = new LineNumberReader(new FileReader("bartokgabor.txt"));
	         lineNumberReader.setLineNumber(-1);
	         String line = null;
	         while ((line = lineNumberReader.readLine()) != null)
	         {
	            System.out.println(lineNumberReader.getLineNumber() + ". Adat = " + line);
	         }
	      } 
	      catch (Exception ex)
	      {
	         ex.printStackTrace();
	      } finally
	      
	      {
	         try {
	            if (lineNumberReader != null){
	               lineNumberReader.close();
	            }
	         } catch (IOException ex){
	            ex.printStackTrace();
	         }
	      }
		
		
		 try{
		        File f = new File("bartokgabor.txt");
		        Scanner sc1 = new Scanner(f);
		        int sum = 0;
		        while (sc1.hasNext()){
		            int num = 0;
		            try{
		                num = Integer.parseInt(sc1.nextLine());
		            }catch(NumberFormatException ne){

		            }
		            sum += num;
		        }
		        System.out.println("Osszeg: " + sum); 
		    }catch(Exception err){
		        err.printStackTrace();
		    }
	}

}
