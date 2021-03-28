package com.qq.tooltip
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import flash.events.Event;
   
   public class EmbattleDeckToolTipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:EmbattleDeckToolTip;
      
      public function EmbattleDeckToolTipMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.changeHandler(null);
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
         var _loc4_:int = 0;
         var _loc5_:BattleLineupCardTemp = null;
         var _loc2_:Array = this.view.text as Array;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            if(_loc5_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc4_))
            {
               if(_loc3_.indexOf(_loc5_.tdId) < 0)
               {
                  _loc3_.push(_loc5_.tdId);
               }
            }
         }
         this.view.setInfo(_loc2_,_loc3_);
      }
   }
}
