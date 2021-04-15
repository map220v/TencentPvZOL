package com.qq.modules.td.logic.log.data
{
   import tencent.base.utils.StringUtil;
   
   public class TDLog_ChangeSun extends TDBasicLog
   {
       
      
      public function TDLog_ChangeSun()
      {
         super();
         _formatStr = "{0}Sun used: {1}{2}, Current sun amount:{3}";
      }
      
      override public function toString(param1:Array) : String
      {
         var _loc2_:String = param1[2] >= 0 ? "Increased by " : "Decreased by ";
         return StringUtil.substitute(_formatStr,getTimeStr(param1),_loc2_,param1[2],param1[3]);
      }
   }
}
