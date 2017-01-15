/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
*/
using GLib;

public class SumCol {

	public static int main(string [] args)
	{
		int MAXLINELEN = 128;
		
		int sum = 0;
		char[] str = new char [MAXLINELEN];
		
		while(stdin.gets(str) != null)
		{
			sum += int.parse ((string) str);
		}
		
		stdout.printf("%d\n",sum);
		return 0;
	}
}
