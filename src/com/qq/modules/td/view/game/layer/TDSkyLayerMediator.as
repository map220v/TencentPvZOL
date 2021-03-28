package com.qq.modules.td.view.game.layer
{
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class TDSkyLayerMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDSkyLayer;
      
      public function TDSkyLayerMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_AddObjectToScreen,this.onAddObjectToScreen,CommonEvent);
         addContextListener(CommandName.TDEffectCommand_AddEffect_TOP,this.onAddEffect,CommonEvent);
      }
      
      private function onAddObjectToScreen(param1:CommonEvent) : void
      {
         var _loc2_:IGameObject = param1.readCustomParam("object");
         this.view.addGameObjectTolayer(_loc2_);
         TDGameInfo.getInstance().addGameobjectToMap(_loc2_);
      }
      
      private function onAddEffect(param1:CommonEvent) : void
      {
         this.view.effectsLayer.AddChild(param1.param as IBlitDisplayObject);
      }
   }
}
