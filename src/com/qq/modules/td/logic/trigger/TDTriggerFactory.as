package com.qq.modules.td.logic.trigger
{
   import com.qq.GameGloble;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigCartUse;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigCoconutCannonScoreNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigMGameJewelsExchange;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigMGameJewelsMisstake;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigMGameMissNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigMGameOpenCardNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigMGameScoreNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigMaxUseSun;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigPlantDieNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigPlantDiePos;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigPlantGrowArea;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigPlantGrowNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigPlantLimitNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigProductSun;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigTimeUnuseSun;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigTimeZombieDieNum;
   import com.qq.modules.td.logic.trigger.triggerNode.TrigZombieMoveArea;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.trigger.ITrigger;
   
   public class TDTriggerFactory
   {
       
      
      private var triggerClassDic:Dictionary;
      
      public function TDTriggerFactory()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.triggerClassDic = new Dictionary();
         this.triggerClassDic[1] = TrigProductSun;
         this.triggerClassDic[2] = TrigMaxUseSun;
         this.triggerClassDic[3] = TrigPlantGrowNum;
         this.triggerClassDic[4] = TrigPlantDieNum;
         this.triggerClassDic[5] = TrigZombieMoveArea;
         this.triggerClassDic[6] = TrigCartUse;
         this.triggerClassDic[7] = TrigPlantDiePos;
         this.triggerClassDic[8] = TrigTimeUnuseSun;
         this.triggerClassDic[9] = TrigTimeZombieDieNum;
         this.triggerClassDic[11] = TrigPlantGrowArea;
         this.triggerClassDic[12] = TrigMGameMissNum;
         this.triggerClassDic[13] = TrigMGameScoreNum;
         this.triggerClassDic[14] = TrigMGameOpenCardNum;
         this.triggerClassDic[15] = TrigPlantLimitNum;
         this.triggerClassDic[16] = TrigMGameJewelsExchange;
         this.triggerClassDic[17] = TrigMGameJewelsMisstake;
         this.triggerClassDic[18] = TrigCoconutCannonScoreNum;
         this.triggerClassDic[19] = TrigCoconutCannonScoreNum;
      }
      
      public function createTrigger(param1:int, param2:Array) : ITrigger
      {
         if(!this.triggerClassDic[param1])
         {
            getLogger().error("can\'t create trigger by id: " + param1);
            return null;
         }
         var _loc3_:Class = this.triggerClassDic[param1];
         var _loc4_:ITrigger = new _loc3_();
         GameGloble.injector.injectInto(_loc4_,false);
         _loc4_.setData(param1,param2);
         return _loc4_;
      }
   }
}
