package com.qq.modules.td.logic.miniGame.jewels
{
   import com.gems.GemBase;
   import com.gems.GemNode;
   import com.gems.GemWar;
   import com.gems.utils.GemCreaterUtils;
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.model.TDMiniGameJewelsData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class TDMiniGameJewelsControler
   {
      
      public static var instance:TDMiniGameJewelsControler;
       
      
      public var gemWar:GemWar;
      
      public var mouseCtr:TDMiniGameJewelsMouseCtr;
      
      public var gemTypeVec:Vector.<GemBase>;
      
      private var _disposed:Boolean = false;
      
      public function TDMiniGameJewelsControler()
      {
         super();
         instance = this;
         CommandDispatcher._dispatcher.addEventListener(CommandName.TDGameEvent_StartTDGame,this.startJewelsGameHandler);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TDGameEvent_RandomJewel,this.randomJewelHandler);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TDGameEvent_RandomFixHole,this.randomFixHoleHandler);
      }
      
      public function reset() : void
      {
         if(!this.gemWar)
         {
            this.gemWar = new GemWar();
         }
         if(!this.mouseCtr)
         {
            this.mouseCtr = new TDMiniGameJewelsMouseCtr(this);
         }
         this.mouseCtr.reset();
      }
      
      private function randomJewelHandler(param1:Event) : void
      {
         var cacheResult:Vector.<GemBase> = null;
         var callBackHandler:Function = null;
         var event:Event = param1;
         callBackHandler = function():void
         {
            if(_disposed)
            {
               return;
            }
            var _loc1_:Vector.<GemBase> = gemWar.getAddGemByRemoveGem(cacheResult);
            var _loc2_:Vector.<GemBase> = gemWar.exchangeAdd(cacheResult,_loc1_,new JewelsEffector(),mouseCtr.addedCallBack);
            mouseCtr.autoCheckGemVec = _loc2_;
         };
         TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Plant_Crash_Help_Useless);
         cacheResult = this.gemWar.disappearAllGem(new JewelsEffector(),callBackHandler);
      }
      
      private function randomFixHoleHandler(param1:Event) : void
      {
         TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Plant_Crash_Help_Useless);
         var _loc2_:Vector.<GemNode> = this.gemWar.getEmptyGemNode();
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:int = Math.floor(Math.random() * _loc2_.length);
         var _loc4_:GemNode;
         (_loc4_ = _loc2_[_loc3_]).gem.empty = false;
         var _loc5_:Vector.<GemBase>;
         (_loc5_ = new Vector.<GemBase>()).push(_loc4_.gem);
         var _loc6_:Vector.<GemBase> = this.gemWar.getAddGemByRemoveGem(_loc5_);
         var _loc7_:Vector.<GemBase> = this.gemWar.exchangeAdd(_loc5_,_loc6_,new JewelsEffector(),this.mouseCtr.addedCallBack);
         this.mouseCtr.autoCheckGemVec = _loc7_;
      }
      
      private function startJewelsGameHandler(param1:Event) : void
      {
         this.gemTypeVec = this.createJewelsTypeVec();
         var _loc2_:Vector.<GemBase> = GemCreaterUtils.randomGemBox(this.jewelsModel.colNum,this.jewelsModel.rowNum,this.gemTypeVec);
         this.gemWar.create(this.jewelsModel.colNum,this.jewelsModel.rowNum,this.gemTypeVec,_loc2_);
         this.mouseCtr.start();
      }
      
      private function createJewelsTypeVec() : Vector.<GemBase>
      {
         var _loc1_:Vector.<GemBase> = new Vector.<GemBase>();
         var _loc2_:int = this.jewelsModel.jewelTypeList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(new JewelBase(this.jewelsModel.jewelTypeList[_loc3_],10,TDStageInfo.getInstance().tileWidth,TDStageInfo.getInstance().tileHeight));
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function get jewelsModel() : TDMiniGameJewelsData
      {
         return TDMiniGameJewelsData.instance;
      }
      
      public function dispose() : void
      {
         this._disposed = true;
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TDGameEvent_StartTDGame,this.startJewelsGameHandler);
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TDGameEvent_RandomJewel,this.randomJewelHandler);
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TDGameEvent_RandomFixHole,this.randomFixHoleHandler);
         if(this.mouseCtr)
         {
            this.mouseCtr.dispose();
            this.mouseCtr = null;
         }
         if(this.gemWar)
         {
            this.gemWar.dispose();
            this.gemWar = null;
         }
      }
   }
}
