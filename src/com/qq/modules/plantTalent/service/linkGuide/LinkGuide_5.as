package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.card.CardGlobals;
   import com.qq.modules.card.command.CardViewCmd;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.td.logic.talent.constant.TalentAdvancedConditionType;
   import com.qq.utils.CommandDispatcher;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class LinkGuide_5 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      [Inject]
      public var actorModel:ActorModel;
      
      public function LinkGuide_5()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         var _loc4_:CardItemVO = null;
         var _loc5_:BattleLineupCardTemp = null;
         var _loc1_:int = params[0];
         var _loc2_:Vector.<CardItemVO> = this.actorModel.battleCardModel.battleCardList;
         var _loc3_:CardItemVO = _loc2_[0];
         for each(_loc4_ in _loc2_)
         {
            if((_loc5_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc4_.cardId)).tdId == _loc1_)
            {
               _loc3_ = _loc4_;
               break;
            }
         }
         if(_loc3_)
         {
            LinkGuideGloble.matchValue = _loc3_.cardId;
         }
         CardViewCmd.showMainWd(CardGlobals.CARD_SCENE_TYPE_VIEW,_loc3_);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
      
      private function onLinkGuideHandler(param1:CommonEvent) : void
      {
         var disObj:DisplayObject = null;
         var t:int = 0;
         var event:CommonEvent = param1;
         if(event.param.type == TalentAdvancedConditionType.PLANT_LEVEL)
         {
            CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
            disObj = event.param.dis;
            t = setTimeout(function():void
            {
               clearTimeout(t);
               LinkGuideView.instance.showGuide(disObj.parent,new Rectangle(disObj.x,disObj.y,disObj.width,disObj.height),"植物升级",LinkGuideView.DIR_UP);
            },300);
         }
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
   }
}
