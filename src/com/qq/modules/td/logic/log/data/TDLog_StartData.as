package com.qq.modules.td.logic.log.data
{
   import tencent.base.utils.StringUtil;
   
   public class TDLog_StartData extends TDBasicLog
   {
       
      
      public function TDLog_StartData()
      {
         super();
         _formatStr = "{0}游戏开始数据，战力:{1},阳光：{2},叶子:{3},地图产生的叶子总数:{4}";
      }
      
      override public function toString(param1:Array) : String
      {
         return StringUtil.substitute(_formatStr,getTimeStr(param1),param1[2],param1[3],param1[4],param1[5]);
      }
   }
}
