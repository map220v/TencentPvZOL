package com.qq.display
{
   import PVZ.Cmd.Dto_CardPosInfo;
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import flash.events.Event;
   
   public class EmbattlePlantMediator extends BasicScreenMediator
   {
       
      
      public var _view:EmbattlePlant;
      
      public function EmbattlePlantMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._view = viewComponent as EmbattlePlant;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this._view,Event.CHANGE,this.onDataChange);
      }
      
      protected function onDataChange(param1:Event) : void
      {
         var _loc2_:CardItemVO = null;
         var _loc3_:Dto_CardPosInfo = null;
         var _loc4_:CardItemVO = null;
         var _loc5_:BattleLineupCardTemp = null;
         if(this._view.data == null)
         {
            this._view.setBattleCardAssetUrl(null,0);
         }
         else if(this._view.data is CardItemVO)
         {
            _loc2_ = this._view.data as CardItemVO;
            this._view.setBattleCardAssetUrl(_loc2_.pvpPlantTemplate,_loc2_.avatarId);
            this._view.updateCardEffect(-1,_loc2_.DNALevel,_loc2_.plantArmorViewID);
         }
         else if(this._view.data is Dto_CardPosInfo)
         {
            _loc3_ = this._view.data as Dto_CardPosInfo;
            if(_loc4_ = GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(_loc3_.uid))
            {
               this._view.setBattleCardAssetUrl(_loc4_.pvpPlantTemplate,_loc4_.avatarId);
               this._view.updateCardEffect(-1,_loc4_.DNALevel,_loc4_.plantArmorViewID);
            }
         }
         else if(this._view.data is int)
         {
            _loc5_ = SettingsModel.instance.battleCardSettings.getBattleCardTempById(int(this._view.data));
            this._view.setBattleCardAssetUrl(_loc5_,0);
         }
      }
   }
}
