package com.hurlant.eval
{
	import com.hurlant.test.ILogger;
	
	public class Debug
	{

		public static var nesting:int = 0;

		static private var _logger:ILogger = null;
		static public function set logger(value:ILogger):void {
			_logger = value;
		}
		
		public static function arrows (c:*): String 
		{
		    var str:String = "";
		    for ( var n:int = nesting; n > 0; n = n - 1 ) {
		        str = str + c;
		    }
		    return nesting + " " + str+" ";
		}
		
		public static function enter (s:*,a:*=""):void
		{
		    nesting = nesting + 1;
		    //print (arrows(">"), s, a);
		}
		
		public static function exit (s:*,a:*=""):void
		{
		    //print (arrows("<"), s, a);
		    nesting = nesting - 1;
		}

		public static function assert (bool:Boolean):void
		{
			if (!bool) {
				throw ("Assert failed.");
			}
		}
		
		public static function print(...args):void {
			var s:String = args.join(" - ");
			if (_logger!=null) {
				_logger.print(s);
			} 
			trace(s);
		}

/*		
		Release function enter (s,a="") { nesting = nesting + 1 }
		Release function exit (s,a="") { nesting = nesting - 1 }
		Release function trace (s) { }
*/

	}
}