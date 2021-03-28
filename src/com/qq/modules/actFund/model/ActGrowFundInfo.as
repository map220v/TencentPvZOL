package com.qq.modules.actFund.model
{
   import PVZ.Cmd.GrowReturnConf;
   import com.qq.GameGloble;
   
   public class ActGrowFundInfo
   {
       
      
      public var actID:int;
      
      public var id:int;
      
      private var _open:int;
      
      public var minLvl:int;
      
      public var mkValue:int;
      
      public var rewardList:Array;
      
      public var isTake:Boolean;
      
      public function ActGrowFundInfo(param1:int, param2:GrowReturnConf)
      {
         super();
         this.actID = param1;
         this.id = param2.id;
         this._open = param2.open;
         this.minLvl = param2.minLvl;
         this.mkValue = param2.mkValue;
         this.rewardList = param2.rewardList;
         this.isTake = true;
      }
      
      public function get hasReward() : Boolean
      {
         if(GameGloble.actorModel.actorLevel < this.minLvl)
         {
            return false;
         }
         return this._open && !this.isTake;
      }
   }
}
