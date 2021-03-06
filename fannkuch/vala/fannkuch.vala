/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
*/
using GLib;

class Fannkuch
{
   public static int fannkuch(int n) {
      int check = 0;
      int[] perm = new int[n];
      int[] perm1 = new int[n];
      int[] count = new int[n];
      int[] maxPerm = new int[n];
      int maxFlipsCount = 0;
      int m = n - 1;
 
      for(int i=0; i<n; i++) perm1[i] = i;
      int r = n;

      while (true) {
         // write-out the first 30 permutations 
         if (check < 30){
           for(int i=0; i<n; i++) stdout.printf("%d", perm1[i]+1); 
           stdout.putc('\n');
           check++;
         }

         while (r != 1){ count[r-1] = r; r--; } 
         if (! (perm1[0]==0 || perm1[m] == m)){       
            for(int i=0; i<n; i++) perm[i] = perm1[i]; 
            int flipsCount = 0;
            int k;

            while ( !((k=perm[0]) == 0) ) {
               int k2 = (k+1) >> 1;
               for(int i=0; i<k2; i++) {
                  int temp = perm[i]; perm[i] = perm[k-i]; perm[k-i] = temp;
               }
               flipsCount++;
            }

            if (flipsCount > maxFlipsCount) {
               maxFlipsCount = flipsCount;
               for(int i=0; i<n; i++) maxPerm[i] = perm1[i];
            }
         } 

         // Use incremental change to generate another permutation
         while (true) {        
            if (r == n) return maxFlipsCount;
            int perm0 = perm1[0];
            int i = 0;
            while (i < r) {
               int j = i + 1;
               perm1[i] = perm1[j];
               i = j;
            }
            perm1[r] = perm0;

            count[r] = count[r] - 1;
            if (count[r] > 0) break;
            r++;
         }
      }
   }

	public static int main(string[] args){
		int n = (args.length > 0) ? int.parse (args[1]) : 7;
		
		stdout.printf("Pfannkuchen(%d) = %d\n", n, fannkuch(n));

		return 0;
   }
}
