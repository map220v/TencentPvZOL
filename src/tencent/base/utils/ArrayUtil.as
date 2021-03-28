package tencent.base.utils
{
   public class ArrayUtil
   {
       
      
      public function ArrayUtil()
      {
         super();
      }
      
      public static function toArray(param1:Object) : Array
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc2_:Array = [];
         if(param1)
         {
            if(param1 is Array)
            {
               _loc2_ = param1 as Array;
            }
            else if(param1 is XMLList)
            {
               _loc3_ = XMLList(param1).length();
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc2_.push(XMLList(param1)[_loc4_]);
                  _loc4_++;
               }
            }
            else
            {
               _loc2_ = [param1];
            }
         }
         return _loc2_;
      }
      
      public static function removeValueFromArray(param1:Array, param2:Object) : void
      {
         var _loc3_:uint = param1.length;
         var _loc4_:Number = _loc3_;
         while(_loc4_ > -1)
         {
            if(param1[_loc4_] === param2)
            {
               param1.splice(_loc4_,1);
            }
            _loc4_--;
         }
      }
      
      public static function removeDuplicates(param1:Array) : Array
      {
         return param1.filter(ArrayUtil._removeDuplicatesFilter);
      }
      
      public static function vactorToArray(param1:*) : Array
      {
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      protected static function _removeDuplicatesFilter(param1:*, param2:int, param3:Array) : Boolean
      {
         return param2 == 0 ? true : param3.lastIndexOf(param1,param2 - 1) == -1;
      }
      
      public static function convertToInt(param1:Array) : Array
      {
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = parseInt(param1[_loc4_]);
            _loc2_.push(_loc3_);
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function shuffle(param1:Array) : Array
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Array = param1.slice();
         var _loc3_:int = _loc2_.length;
         while(_loc3_)
         {
            _loc2_.push(_loc2_.splice(int(Math.random() * _loc3_--),1)[0]);
         }
         return _loc2_;
      }
   }
}
