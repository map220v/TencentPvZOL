package tencent.data
{
   public class ArgData
   {
       
      
      private var _head:String;
      
      private var _arg:Array;
      
      public function ArgData(param1:String, param2:Array)
      {
         super();
         this._head = param1;
         this._arg = param2;
      }
      
      public static function createByString(param1:String, param2:String = ":") : ArgData
      {
         var _loc3_:Array = param1.split(param2);
         return new ArgData(_loc3_.shift(),_loc3_);
      }
      
      public static function createVectorByString(param1:String, param2:String = ";", param3:String = ":") : Vector.<ArgData>
      {
         var _loc4_:Vector.<ArgData> = new Vector.<ArgData>();
         var _loc5_:Array;
         var _loc6_:int = (_loc5_ = param1.split(param2)).length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            if(!(_loc5_[_loc7_] == null || _loc5_[_loc7_] == ""))
            {
               _loc4_.push(createByString(_loc5_[_loc7_] as String,param3));
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public static function createListByString(param1:String, param2:String = ";", param3:String = ":") : Array
      {
         var _loc4_:Array = [];
         var _loc5_:Array;
         var _loc6_:int = (_loc5_ = param1.split(param2)).length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_.push(createByString(_loc5_[_loc7_] as String,param3));
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function get head() : String
      {
         return this._head;
      }
      
      public function get arg() : Array
      {
         return this._arg;
      }
      
      public function get head_int() : Number
      {
         return Number(this._head);
      }
   }
}
