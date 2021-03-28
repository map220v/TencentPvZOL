package com.qq.modules.td.logic.log.data
{
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import tencent.base.utils.StringUtil;
   
   public class TDLog_KillZombie extends TDBasicLog
   {
       
      
      public function TDLog_KillZombie()
      {
         super();
         _formatStr = "{0}{1}死亡,最大血量{2},死亡前血量{3}";
      }
      
      override public function toString(param1:Array) : String
      {
         var _loc2_:TDZombieStaticInfo = TDDataFactory.instance.getZombieInfoByID(param1[3]);
         var _loc3_:String = "";
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.name;
         }
         if(_loc2_ == null)
         {
            return "";
         }
         return StringUtil.substitute(_formatStr,getTimeStr(param1),_loc2_.name,param1[4],param1[5]);
      }
   }
}
