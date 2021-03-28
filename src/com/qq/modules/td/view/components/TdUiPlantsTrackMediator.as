package com.qq.modules.td.view.components
{
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDTrackGameConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDInsertCardTrackData;
   import com.qq.modules.td.model.TDMoveCardTrackData;
   import com.qq.modules.td.model.TDMoveEnergyTileCardTrackData;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.model.vo.TDFriendCardInfo;
   import com.qq.modules.td.model.vo.TDInsertCardVO;
   import com.qq.modules.td.model.vo.TDMoveEnergyTileCardVO;
   
   public class TdUiPlantsTrackMediator extends BasicScreenMediator implements IAnimatable
   {
       
      
      [Inject]
      public var view:TdUiPlantsTrack;
      
      private var passedTimeAll:Number = 0;
      
      private var addedPlantCount:int;
      
      private var _cardDuration:int;
      
      public function TdUiPlantsTrackMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.x = 128 + 250;
         WorldClock.clock.add(this);
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc5_:int = 0;
         this.passedTimeAll += param1;
         this.view.advanceTime(param1);
         var _loc2_:int = TDMoveCardTrackData.getInstance().randomTime;
         this._cardDuration = _loc2_ * 0.001;
         var _loc3_:TDMoveEnergyTileCardVO = TDMoveEnergyTileCardTrackData.instance.findIncomingTile(TDGameInfo.getInstance().getCurGameTime());
         if(_loc3_)
         {
            _loc3_.appeared = true;
            this.addEnergyTile(_loc3_.type);
            ++this.addedPlantCount;
         }
         var _loc4_:TDInsertCardVO;
         if(_loc4_ = TDInsertCardTrackData.instance.findIncomingCard(TDGameInfo.getInstance().getCurGameTime()))
         {
            _loc4_.appeared = true;
            this.addCard(_loc4_.id);
            ++this.addedPlantCount;
         }
         while(int(this.passedTimeAll / this._cardDuration) > this.addedPlantCount)
         {
            if(this.view.cMain.numChildren < TDTrackGameConstant.MAX_CARD_ON_TRACK)
            {
               do
               {
                  _loc5_ = TDMoveCardTrackData.getInstance().getRandomPlant();
               }
               while(this.view.getSomeCardNum(_loc5_) > TDMoveCardTrackData.getInstance().getPlantMax(_loc5_));
               
               if(_loc5_ != 0)
               {
                  this.addCard(_loc5_);
               }
            }
            ++this.addedPlantCount;
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_AddTrackCard,this.onAddTrackCard,CommonEvent);
         addContextListener(CommandName.TD_StartCardCooldown,this.onDoCropPlant,CommonEvent);
      }
      
      private function onAddTrackCard(param1:CommonEvent) : void
      {
         this.addCard(int(param1.param));
      }
      
      private function onDoCropPlant(param1:CommonEvent) : void
      {
         TDMoveCardTrackData.getInstance().changeCardNum(-1);
      }
      
      private function addCard(param1:int, param2:TDFriendCardInfo = null) : void
      {
         this.view.addCard(new TDCardData(GameGloble.actorModel.getUnlockPlant(param1),param2));
         TDMoveCardTrackData.getInstance().changeCardNum(1);
      }
      
      private function addEnergyTile(param1:uint) : void
      {
         this.view.addEnergyTile(param1);
         TDMoveCardTrackData.getInstance().changeCardNum(1);
      }
      
      override public function dispose() : void
      {
         WorldClock.clock.remove(this);
         super.dispose();
      }
   }
}
