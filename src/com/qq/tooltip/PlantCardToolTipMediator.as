package com.qq.tooltip
{
   import PVZ.Cmd.Dto_CardFullInfo;
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.Dto_CardPower;
   import PVZ.Cmd.Dto_FightCardInfo;
   import PVZ.Cmd.E_PowerEle;
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.card.model.vo.CardItemVO;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class PlantCardToolTipMediator extends BasicScreenMediator
   {
       
      
      public function PlantCardToolTipMediator()
      {
         super();
      }
      
      override public function onRemove() : void
      {
         this.view.removeEventListener(Event.CHANGE,this.changeHandler);
      }
      
      override public function onRegister() : void
      {
         this.view.addEventListener(Event.CHANGE,this.changeHandler);
      }
      
      protected function changeHandler(param1:Event) : void
      {
         if(this.view.text is CardItemVO)
         {
            this.updateSelfBattleCard(this.view.text as CardItemVO);
         }
         else if(this.view.text is Dto_CardPosInfo)
         {
            this.updateSelfBattleCardByPosInfo(this.view.text as Dto_CardPosInfo);
         }
         else if(this.view.text is Dto_CardFullInfo)
         {
            this.updateByDto(this.view.text as Dto_CardFullInfo);
         }
         else if(this.view.text is Dto_FightCardInfo)
         {
            this.updateBattleCard(this.view.text as Dto_FightCardInfo);
         }
         else
         {
            getLogger().warn("PlantCardToolTipMediator:  无法解析ToolTip参数!");
         }
      }
      
      protected function updateSelfBattleCard(param1:CardItemVO) : void
      {
         this.view.updatePower(param1.dto.powerEle);
         this.view.update(param1.dto);
      }
      
      protected function updateSelfBattleCardByPosInfo(param1:Dto_CardPosInfo) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Dto_CardPower = null;
         this.view.updatePower(param1.powerEle);
         var _loc2_:Dto_CardFullInfo = GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(param1.uid).dto;
         var _loc3_:int = -1;
         if(_loc2_.base.health != 100)
         {
            _loc4_ = param1.powerEle.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if((_loc6_ = param1.powerEle[_loc5_]).ele == E_PowerEle.E_PowerEle_health)
               {
                  _loc3_ = _loc6_.value.toNumber();
                  break;
               }
               _loc5_++;
            }
         }
         this.view.update(_loc2_,_loc3_);
         this.view.updateHp(param1.curHp.toNumber(),param1.maxHp.toNumber());
      }
      
      protected function updateByDto(param1:Dto_CardFullInfo) : void
      {
         this.view.update(param1);
      }
      
      protected function updateBattleCard(param1:Dto_FightCardInfo) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Dto_CardPower = null;
         this.view.updatePower(param1.powerEle);
         var _loc2_:int = -1;
         if(param1.health != 100)
         {
            _loc3_ = param1.powerEle.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if((_loc5_ = param1.powerEle[_loc4_]).ele == E_PowerEle.E_PowerEle_health)
               {
                  _loc2_ = _loc5_.value.toNumber();
                  break;
               }
               _loc4_++;
            }
         }
         this.view.updateWithFightCard(param1,_loc2_);
      }
      
      public function get view() : PlantCardToolTip
      {
         return getViewComponent() as PlantCardToolTip;
      }
   }
}
