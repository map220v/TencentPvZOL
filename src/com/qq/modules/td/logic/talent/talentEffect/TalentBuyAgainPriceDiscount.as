package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.utils.CommandDispatcher;
   
   public class TalentBuyAgainPriceDiscount extends TalentEffect implements ITalentEffect
   {
       
      
      private var _plantId:int;
      
      private var _discount:Number = 1;
      
      private var _useCnt:int = 0;
      
      private var _calCnt:int;
      
      public function TalentBuyAgainPriceDiscount()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._plantId = param1[0];
         this._discount = param1[1];
         this._calCnt = param1[2];
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_StartCardCooldown,this.startCardCoolDownHandler);
      }
      
      private function startCardCoolDownHandler(param1:CommonEvent) : void
      {
         var _loc2_:Object = param1.param;
         var _loc3_:int = _loc2_.plantType;
         if(_loc3_ == this._plantId)
         {
            ++this._useCnt;
         }
      }
      
      public function getDiscount() : Number
      {
         if(this._useCnt < this._calCnt)
         {
            return 1;
         }
         return 1 - this._discount;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_StartCardCooldown,this.startCardCoolDownHandler);
         super.dispose();
      }
   }
}
