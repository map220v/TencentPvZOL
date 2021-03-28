package com.qq.modules.td.view.game.layer
{
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.blit.QBlitUI;
   
   public class TDBottomEffectLayerMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDBottomEffectLayer;
      
      public function TDBottomEffectLayerMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TDEffectCommand_AddEffect_BOTTOM,this.onAddEffect,CommonEvent);
         addContextListener(CommandName.TD_Add_UnitToBottomLayer,this.onTD_Add_UnitToBottomLayer,CommonEvent);
         addContextListener(CommandName.TD_InitTDView,this.onTD_InitTDGame,CommonEvent);
      }
      
      private function onTD_Add_UnitToBottomLayer(param1:CommonEvent) : void
      {
         var _loc2_:IGameObject = param1.readCustomParam("object");
         var _loc3_:int = param1.readCustomParam_Number("x");
         var _loc4_:int = param1.readCustomParam_Number("y");
         _loc2_.setLocation(_loc3_,_loc4_);
         this.view.bottomLayer.addGameObjectTolayer(_loc2_);
      }
      
      private function onAddEffect(param1:CommonEvent) : void
      {
         if(param1.param is IBlitDisplayObject)
         {
            this.view.effectsLayer.AddChild(param1.param as IBlitDisplayObject);
         }
         else
         {
            this.view.effectsLayer.AddChild(QBlitUI.createClipFromSource(param1.param));
         }
      }
      
      private function onTD_InitTDGame(param1:CommonEvent) : void
      {
         this.view.bottomLayer.removeAllChild();
         this.view.effectsLayer.RemoveAllChildren();
      }
   }
}
