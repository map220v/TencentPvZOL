package com.qq.modules.td.logic.log.data
{
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import tencent.base.utils.StringUtil;
   
   public class TDLog_ChoosePlantList extends TDBasicLog
   {
       
      
      public function TDLog_ChoosePlantList()
      {
         super();
         _formatStr = "{0}:Player choose plants：{1}";
      }
      
      override public function toString(param1:Array) : String
      {
         var _loc5_:int = 0;
         var _loc6_:TDPlantStaticInfo = null;
         var _loc7_:String = null;
         var _loc2_:String = "";
         var _loc3_:int = 2;
         while(_loc3_ < param1.length > 0)
         {
            _loc5_ = param1[_loc3_];
            _loc6_ = TDDataFactory.instance.getPlantInfoByID(_loc5_);
            _loc7_ = "";
            if(_loc6_ != null)
            {
               _loc7_ = _loc6_.baseInfo.name;
               _loc2_ = _loc2_.concat(_loc7_,",");
            }
            _loc3_++;
         }
         return StringUtil.substitute(_formatStr,getTimeStr(param1),_loc2_);
      }
   }
}
