/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
*/
using GLib;

public class Recursive : Object {
	static int main (string[] args)
	{
		int n = args[1].to_int();
		
		stdout.printf("Ack(3,%d): %d\n", n, ack(3, n));
		stdout.printf("Fib(%.1f): %.1f\n", 27.0+n, fibFP(27.0+n));
		n--;  stdout.printf("Tak(%d,%d,%d): %d\n", 3*n,2*n,n, tak(3*n,2*n,n));
		
		stdout.printf("Fib(3): %d\n", fib(3));
		stdout.printf("Tak(3.0,2.0,1.0): %.1f\n",takFP(3.0,2.0,1.0));
		return 0;
	}
	
	public static int ack(int m, int n) {
		if (m == 0) return n + 1;
		if (n == 0) return ack(m-1, 1);
		else return ack(m-1, ack(m, n-1));
	}

	public static int fib(int n) {
		if (n < 2) return 1;
		else return fib(n-2) + fib(n-1);
	}

	public static int tak(int x, int y, int z) {
		if (y < x) return tak(tak(x-1,y,z), tak(y-1,z,x), tak(z-1,x,y));
		else return z;
	}

	public static double fibFP(double n) {
		if (n < 2.0) return 1.0;
		else return fibFP(n-2.0) + fibFP(n-1.0);
	}

	public static double takFP(double x, double y, double z) {
		if (y < x) return takFP(takFP(x-1.0,y,z), takFP(y-1.0,z,x), takFP(z-1.0,x,y));
		else return z;
	}
}
