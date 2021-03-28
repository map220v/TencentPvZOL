package com.qq.modules.td.logic.log.data
{
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import tencent.base.utils.StringUtil;
   
   public class TDLog_CropPlant extends TDBasicLog
   {
       
      
      public function TDLog_CropPlant()
      {
         super();
         _formatStr = "{0}种植{1},x：{2},y:{3}";
      }
      
      override public function toString(param1:Array) : String
      {
         var _loc2_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(param1[2]);
         var _loc3_:String = "";
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.baseInfo.name;
         }
         var _loc4_:* = StringUtil.substitute(_formatStr,getTimeStr(param1),_loc3_,param1[3],param1[4]);
         if(param1[5] == 1)
         {
            _loc4_ += "，是友情植物";
         }
         return _loc4_;
      }
   }
}
