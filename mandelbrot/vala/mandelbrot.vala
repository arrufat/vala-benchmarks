/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
*/
using GLib;

public class Mandelbrot : Object {

	public static int main(string[] args) {
	
		int width = (args.length > 0) ? int.parse (args[1]) : 100;
		
		int height = width;
		int i;
		int m = 50;
		int bits = 0;
		int bitnum = 0;
		
		bool isOverLimit = false;
		double Zr = 0.0;
		double Zi  = 0.0;
		double Cr;
		double Ci;
		double Tr;
		double Ti;
		double limit2 = 4.0;
		
		stdout.printf("P4\n%d %d\n", width,height);
		
		for(int y = 0; y < height; y++) {
			for(int x = 0; x < width; x++){
				
				Zr = 0.0; Zi = 0.0;
				Tr = 0.0; Ti = 0.0;
				Cr = 2.0*x / width - 1.5;
				Ci = 2.0*y / height - 1.0;
				
				i = 0;
				do {
					Tr = Zr*Zr - Zi*Zi + Cr;
					Ti = 2.0*Zr*Zi + Ci;
					Zr = Tr; Zi = Ti;
					isOverLimit = Zr*Zr + Zi*Zi > limit2;
				} while (!isOverLimit && (++i < m));

				bits = bits << 1;
				if (!isOverLimit)
					bits++;
				bitnum++;
				
				if (x == width - 1) {
					bits = bits << (8 - bitnum);
					bitnum = 8;
				}
				
				if (bitnum == 8){
					stdout.putc((char)bits);
					bits = (uint8)0;
					bitnum = 0;
				}
			}
		}
		return 0;
	}
}
