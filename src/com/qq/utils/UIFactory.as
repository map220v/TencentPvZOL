package com.qq.utils
{
   import com.qq.utils.ui.MixTextField;
   import com.qq.utils.ui.PTextField;
   
   public class UIFactory
   {
       
      
      public function UIFactory()
      {
         super();
      }
      
      public static function createMixTextField(param1:int, param2:int, param3:int = 52, param4:int = 20, param5:String = null, param6:uint = 0, param7:int = 12, param8:String = null) : MixTextField
      {
         return new MixTextField(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public static function createTextField(param1:int, param2:int, param3:int = 52, param4:int = 20, param5:String = null, param6:uint = 0, param7:int = 12, param8:String = null) : PTextField
      {
         return new PTextField(param1,param2,param3,param4,param5,param6,param7,param8);
      }
   }
}
