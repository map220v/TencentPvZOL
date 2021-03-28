package com.qq.modules.td.logic.log.data
{
   import tencent.base.utils.StringUtil;
   
   public class TDLog_InitData extends TDBasicLog
   {
       
      
      public function TDLog_InitData()
      {
         super();
         _formatStr = "{0}游戏初始化，地图MD5：{1} 关卡类型：{2}";
      }
      
      override public function toString(param1:Array) : String
      {
         return StringUtil.substitute(_formatStr,getTimeStr(param1),param1[2],param1[3]);
      }
   }
}
