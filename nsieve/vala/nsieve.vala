/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
   revised by Jürg Billeter
*/
using GLib;

class NSieve {
	
	static int main(string[] args) {
		
		int m = int.parse (args[1]);
		
		for (int i = 0; i < 3; i++)
	        	nsieve(10000 << (m-i));
		
		return 0;
	}
	
	static void nsieve( int m ) {
	
		char[] flags = new char[m];
		
		int count = 0;
		
		for( int i=2; i<m; i++) {
			if( flags[i] == 0 ) {
				for (int j=i << 1; j < m; j+=i) flags[j] = (char) 1;
				++count;	
			}
		}
		
		stdout.printf("Primes up to %8u %8u\n", m, count);
	}
}
