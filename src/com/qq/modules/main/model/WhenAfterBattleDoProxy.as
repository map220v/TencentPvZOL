package com.qq.modules.main.model
{
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.battle.constant.BattleConst;
   import flash.events.Event;
   
   public class WhenAfterBattleDoProxy extends BasicProxy
   {
       
      
      public var delayFuncs:Vector.<Object>;
      
      [Inject]
      public var actorModel:ActorModel;
      
      public function WhenAfterBattleDoProxy()
      {
         super();
         this.delayFuncs = new Vector.<Object>();
      }
      
      public function addDelayFunc(param1:Function, param2:Array) : void
      {
         if(this.actorModel.inBattleAnimate)
         {
            this.delayFuncs.push({
               "func":param1,
               "params":param2
            });
         }
         else
         {
            param1.apply(this,param2);
         }
      }
      
      override public function listMsgInterests() : Array
      {
         return [[BattleConst.BATTLE_END,this.onBattleEnd]];
      }
      
      private function onBattleEnd(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Function = null;
         var _loc4_:Object = null;
         for each(_loc2_ in this.delayFuncs)
         {
            _loc3_ = _loc2_.func;
            _loc4_ = _loc2_.params;
            _loc3_.apply(this,_loc4_);
         }
         this.delayFuncs.length = 0;
      }
   }
}
