/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
*/
using GLib;

class SpectralNorm
{
   public static int main(string[] args) {        
      int n = (args.length > 0)?args[1].to_int():100;

      stdout.printf("%0.9f\n", Approximate(n));
      return 0;
   }

   static double Approximate(int n) {
      // create unit vector
      double[] u = new double[n];       
      for (int i=0; i<n; i++) u[i] =  1;

      // 20 steps of the power method
      double[] v = new double[n];  
      for (int i=0; i<n; i++) v[i] = 0;

      for (int i=0; i<10; i++) {
         MultiplyAtAv(n,u,v);
         MultiplyAtAv(n,v,u);
      }

      // B=AtA         A multiplied by A transposed
      // v.Bv /(v.v)   eigenvalue of v 
      double vBv = 0, vv = 0;
      for (int i=0; i<n; i++) {
         vBv += u[i]*v[i];
         vv  += v[i]*v[i];
      }

      return Math.sqrt(vBv/vv);
   }


   /* return element i,j of infinite matrix A */
   static double A(int i, int j){
      return 1.0/((i+j)*(i+j+1)/2 +i+1); 
   }

   /* multiply vector v by matrix A */
   static void MultiplyAv(int n, double[] v, double[] Av){
      for (int i=0; i<n; i++){
         Av[i] = 0;
         for (int j=0; j<n; j++) Av[i] += A(i,j)*v[j];
      }
   }

   /* multiply vector v by matrix A transposed */
   static void MultiplyAtv(int n, double[] v, double[] Atv){
      for (int i=0;i<n;i++){
         Atv[i] = 0;
         for (int j=0; j<n; j++) Atv[i] += A(j,i)*v[j];
      }
   }

   /* multiply vector v by matrix A and then by matrix A transposed */
   static void MultiplyAtAv(int n, double[] v, double[] AtAv){
      double[] u = new double[n];
      MultiplyAv(n,v,u);
      MultiplyAtv(n,u,AtAv);
   }
}
