//   The Computer Language Shootout
//   http://shootout.alioth.debian.org/
//   contributed by Isaac Gouy

using System;

class partialsums {
   const double twothirds = 2.0/3.0;

   static void Main(string[] args){
      int n = Int32.Parse(args[0]);

      double a1 = 0.0, a2 = 0.0, a3 = 0.0, a4 = 0.0, a5 = 0.0;
      double a6 = 0.0, a7 = 0.0, a8 = 0.0, a9 = 0.0, alt = -1.0;

      for (int k=1; k<=n; k++){
         double k2 = Math.Pow(k,2), k3 = k2*k;
         double sk = Math.Sin(k), ck = Math.Cos(k);
         alt = -alt;

         a1 += Math.Pow(twothirds,k-1);
         a2 += Math.Pow(k,-0.5);
         a3 += 1.0/(k*(k+1.0));
         a4 += 1.0/(k3 * sk*sk);
         a5 += 1.0/(k3 * ck*ck);
         a6 += 1.0/k;
         a7 += 1.0/k2;
         a8 += alt/k;
         a9 += alt/(2.0*k -1.0);
      }
      Console.WriteLine("{0:f9}\t(2/3)^k", a1);
      Console.WriteLine("{0:f9}\tk^-0.5", a2);
      Console.WriteLine("{0:f9}\t1/k(k+1)", a3);
      Console.WriteLine("{0:f9}\tFlint Hills", a4);
      Console.WriteLine("{0:f9}\tCookson Hills", a5);
      Console.WriteLine("{0:f9}\tHarmonic", a6);
      Console.WriteLine("{0:f9}\tRiemann Zeta", a7);
      Console.WriteLine("{0:f9}\tAlternating Harmonic", a8);
      Console.WriteLine("{0:f9}\tGregory", a9);
   }
}
