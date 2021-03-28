package com.qq.modules.td.logic.log.data
{
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import tencent.base.utils.StringUtil;
   
   public class TDLog_DamageZombie extends TDBasicLog
   {
       
      
      public function TDLog_DamageZombie()
      {
         super();
         _formatStr = "{0}{1}(id:{2})被攻击,最大护甲{3},当前护甲{4},最大血量{5},当前血量{6},伤害{7}";
      }
      
      override public function toString(param1:Array) : String
      {
         var _loc2_:TDZombieStaticInfo = TDDataFactory.instance.getZombieInfoByID(param1[3]);
         var _loc3_:String = "";
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.name;
         }
         return StringUtil.substitute(_formatStr,getTimeStr(param1),_loc3_,param1[2],param1[4],param1[5],param1[6],param1[7],param1[8]);
      }
   }
}
