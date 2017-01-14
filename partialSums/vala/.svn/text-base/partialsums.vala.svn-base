/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
*/
using GLib;

public class PartialSums : Object {
	
	const double twothirds = 2.0/3.0;
	
	public static int main(string[] args)
	{
		int n = args[1].to_int();
		int k;
		
		double sum;
		double a;
		
		sum = 0.0;
		for (k = 0; k <= n; k++) sum += Math.pow(twothirds, ((double)k));
		stdout.printf("%.9f\t(2/3)^k\n", sum);

		sum = 0.0;
		for (k = 1 ; k <= n; k++) sum += 1/Math.sqrt(((double)k));  /* aka pow(((double)k), -0.5) */
		stdout.printf("%.9f\tk^-0.5\n", sum);

		sum = 0.0;
		for (k = 1; k <= n; k++) sum += 1.0/(((double)k)*(((double)k)+1.0));
		stdout.printf("%.9f\t1/k(k+1)\n", sum);

		sum = 0.0;
		for (k = 1; k <= n; k++) {
			double sk = Math.sin(((double)k));
			sum += 1.0/(((double)k)*((double)k)*((double)k)*sk*sk);
		}
		stdout.printf("%.9f\tFlint Hills\n", sum);

		sum = 0.0;
		for (k = 1; k <= n; k++) {
		    double ck = Math.cos(((double)k));
		    sum += 1.0/(((double)k)*((double)k)*((double)k)*ck*ck);
		}
		stdout.printf("%.9f\tCookson Hills\n", sum);

		sum = 0.0;
		for (k = 1; k <= n; k++) sum += 1.0/((double)k);
		stdout.printf("%.9f\tHarmonic\n", sum);

		sum = 0.0;
		for (k = 1; k <= n; k++) sum += 1.0/(((double)k)*((double)k));
		stdout.printf("%.9f\tRiemann Zeta\n", sum);

		sum = 0.0; a = -1.0;
		for (k = 1; k <= n; k++) sum += (a = -a)/((double)k);
		stdout.printf("%.9f\tAlternating Harmonic\n", sum);

		sum = 0.0;  a = -1.0;
		for (k = 1; k <= n; k++) sum += (a = -a)/(2.0*((double)k) - 1.0);
		stdout.printf("%.9f\tGregory\n", sum);

		return 0;
	}	
}
