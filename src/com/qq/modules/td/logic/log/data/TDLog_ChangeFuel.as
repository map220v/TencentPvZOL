package com.qq.modules.td.logic.log.data
{
   import tencent.base.utils.StringUtil;
   
   public class TDLog_ChangeFuel extends TDBasicLog
   {
       
      
      public function TDLog_ChangeFuel()
      {
         super();
         _formatStr = "{0}燃料{1}{2}, 当前燃料:{3}";
      }
      
      override public function toString(param1:Array) : String
      {
         var _loc2_:String = param1[2] >= 0 ? "增加" : "减少";
         return StringUtil.substitute(_formatStr,getTimeStr(param1),_loc2_,param1[2],param1[3]);
      }
   }
}
