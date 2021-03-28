package com.qq.modules.exped
{
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   
   public class ExpedGlobal
   {
      
      public static const SHOW_BOUNDS:uint = 10;
      
      public static const EVENT_GET_CITY_INFO:String = "EVENT_GET_CITY_INFO";
      
      public static const EVENT_CELL_SELECTED:String = "EVENT_CELL_SELECTED";
      
      public static const EVENT_TYPE_CHANGE:String = "EVENT_TYPE_CHANGE";
      
      public static const EVENT_EXPED_TIME_UPDATE:String = "EVENT_EXPED_TIME_UPDATE";
      
      private static var s_vecPayCost:Vector.<ItemVO>;
      
      private static var s_rebuildItemTemplate:BagItemTemplate;
      
      private static var s_buyCallBack:Function = null;
      
      private static var s_buyParams:Array = null;
       
      
      public function ExpedGlobal()
      {
         super();
      }
      
      public static function getExpedPayCost(param1:int) : ItemVO
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(s_vecPayCost == null)
         {
            s_vecPayCost = new Vector.<ItemVO>();
            _loc2_ = ServerConfigTemplateFactory.instance.mapWarSetoutTimesCost;
            _loc3_ = _loc2_.split(";");
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               s_vecPayCost.push(ItemVO.createByString(_loc3_[_loc4_],":"));
               _loc4_++;
            }
         }
         return s_vecPayCost[param1];
      }
      
      public static function get expedNeedDurability() : int
      {
         return ServerConfigTemplateFactory.instance.mapWarSetoutTownDurabilityLimit;
      }
      
      public static function setBuyCallBack(param1:Function, param2:Array = null) : void
      {
         s_buyCallBack = param1;
         s_buyParams = param2;
      }
      
      public static function applyBuyCallBack() : void
      {
         if(s_buyCallBack != null)
         {
            if(s_buyParams)
            {
               s_buyCallBack.apply(null,s_buyParams);
            }
            else
            {
               s_buyCallBack.apply();
            }
         }
         s_buyCallBack = null;
         s_buyParams = null;
      }
      
      public static function get rebuildItemTemplate() : BagItemTemplate
      {
         if(s_rebuildItemTemplate == null)
         {
            s_rebuildItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateBySubType(ItemType.SUB_TYPE_REBUILD)[0];
         }
         return s_rebuildItemTemplate;
      }
   }
}
