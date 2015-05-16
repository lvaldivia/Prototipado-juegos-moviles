package xxx.Math 
{
	import flash.automation.AutomationAction;
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
		
		static public function sub(v1:Vector2D, v2:Vector2D):Vector2D
		{
			return new Vector2D(v1.x - v2.x, v1.y - v2.y);
		}
		
		static public function sqtr(v1:Vector2D, v2:Vector2D):Number {
			var rest:Number = distance(v1, v2);
			return Math.sqrt(rest);
		}
		
		static public function distance(v1:Vector2D, v2:Vector2D):Number {
			var dx:Number = v1.x - v2.x;
			var dy:Number = v1.y - v2.y;
			return (dx * dx) + (dy * dy);
		}
		
	}

}