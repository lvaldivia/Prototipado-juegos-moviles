package xxx.Math 
{
	/**
	 * ...
	 * @author Luis
	 */
	public class Vector2D 
	{
		
		public var x:Number;
		public var y:Number;
		
		public function Vector2D(x:Number, y:Number) 
		{
			this.x = x;
			this.y = y;
		}
		
		static public function add(v1:Vector2D, v2:Vector2D):Vector2D
		{
			return new Vector2D(v1.x + v2.x, v1.y + v2.y);
		}
		
		static public function sub(v1:NVector2D, v2:NVector2D):Vector2D
		{
			return new Vector2D(v1.x - v2.x, v1.y - v2.y);
		}
		
	}

}