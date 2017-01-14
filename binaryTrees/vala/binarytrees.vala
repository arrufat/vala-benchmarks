/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Clément David
   revised by Jürg Billeter
*/
using GLib;

public class BinaryTrees {
	
	const int minDepth = 4;
	
	public static int main(string[] args)
	{
		int n = (args.length > 0)?args[1].to_int():0;
		
		int maxDepth = (minDepth + 2 > n)?minDepth +2:n;
		int stretchDepth = maxDepth + 1;
		
		long check = (TreeNode.bottomUpTree(0,stretchDepth)).itemCheck();
		stdout.printf("stretch tree of depth %d\t check: %li\n",
						stretchDepth, check);
		
		TreeNode longLivedTree = TreeNode.bottomUpTree(0,maxDepth);
		
		for(int depth = minDepth; depth <= maxDepth; depth += 2)
		{
			double iterations = Math.pow(2, maxDepth - depth + minDepth);
			
			check = 0;
			for(int i =1; i<= iterations; i++)
			{
				check += (TreeNode.bottomUpTree(i,depth)).itemCheck();
				check += (TreeNode.bottomUpTree(-i,depth)).itemCheck();
			}
		
			stdout.printf("%.0f\t trees of depth %d\t check: %li\n",
							iterations*2, depth, check);		
		}
		
		stdout.printf("long lived tree of depth %d\t check: %li\n",
							maxDepth, longLivedTree.itemCheck());
		
		return 0;
	}

	[Compact]
	class TreeNode {

		public long item;
		public TreeNode? left;
		public TreeNode? right;
		
		public TreeNode.create_with_item(long item){
			this.item = item;
			this.left = null;
			this.right = null;
		}
		
		public TreeNode(owned TreeNode left, owned TreeNode right, long item)  {
			this.left = (owned) left;
			this.right = (owned) right;
			this.item = item;
		}
		
		public static TreeNode bottomUpTree (long item, int depth)  {
			if( depth > 0)
			{
				return new TreeNode(
					bottomUpTree(2*item-1, depth-1) , 
					bottomUpTree(2*item, depth-1), 
					item );
			}
			else
			{
				return new TreeNode.create_with_item(item);
			}
		}
		
		public long itemCheck()  {
			if(this.left == null) return item;
			else return item + left.itemCheck() - right.itemCheck();
		}
	}
}

