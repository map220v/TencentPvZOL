package asgui.modules
{
   import flash.utils.ByteArray;
   
   public final class ModuleSwfRpDecoder implements IModuleSwfDecoder
   {
       
      
      public function ModuleSwfRpDecoder()
      {
         super();
      }
      
      public static function CheckIsSwf(param1:ByteArray) : Boolean
      {
         if(param1 == null || param1.length < 3)
         {
            return false;
         }
         if((param1[0] == 70 || param1[0] == 67) && param1[1] == 87 && param1[2] == 83)
         {
            return true;
         }
         return false;
      }
      
      public function Decode(param1:ByteArray) : ByteArray
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!CheckIsSwf(param1))
         {
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               if(_loc2_ + 1 < param1.length)
               {
                  _loc3_ = param1[_loc2_];
                  param1[_loc2_] = param1[_loc2_ + 1];
                  param1[_loc2_ + 1] = _loc3_;
               }
               _loc2_ += 2;
            }
         }
         return param1;
      }
   }
}
