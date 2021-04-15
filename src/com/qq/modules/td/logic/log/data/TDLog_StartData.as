package com.qq.modules.td.logic.log.data
{
   import tencent.base.utils.StringUtil;
   
   public class TDLog_StartData extends TDBasicLog
   {
       
      
      public function TDLog_StartData()
      {
         super();
         _formatStr = "{0}Game start data，Combat power:{1},Sun：{2},Plant Food:{3},Total amount of plant food produced by map:{4}";
      }
      
      override public function toString(param1:Array) : String
      {
         return StringUtil.substitute(_formatStr,getTimeStr(param1),param1[2],param1[3],param1[4],param1[5]);
      }
   }
}
