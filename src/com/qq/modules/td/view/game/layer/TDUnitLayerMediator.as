package com.qq.modules.td.view.game.layer
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class TDUnitLayerMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDUnitLayer;
      
      public function TDUnitLayerMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_Add_UnitToScreen,this.onAddUnitToScreen,CommonEvent);
         addContextListener(CommandName.TD_Debug_ShowUnitArea,this.debug_showUnitArea,CommonEvent);
         addContextListener(CommandName.TD_Debug_HideUnitArea,this.debug_hideUnitArea,CommonEvent);
         addContextListener(CommandName.TD_ForceSortDepth,this.onForceSortDepth,CommonEvent);
         addContextListener(CommandName.TD_Add_DisplayObjectToScreen,this.onAddDisplayObjectToScreen,CommonEvent);
      }
      
      private function onAddDisplayObjectToScreen(param1:CommonEvent) : void
      {
         this.view.addChild(param1.param as DisplayObject);
      }
      
      private function setUnitLayerEnable(param1:CommonEvent) : void
      {
         var _loc2_:Boolean = param1.readCustomParam("enable");
         this.view.setEnable(_loc2_);
      }
      
      private function onAddUnitToScreen(param1:CommonEvent) : void
      {
         var _loc2_:IGameObject = param1.readCustomParam("object");
         var _loc3_:int = param1.readCustomParam_Number("x");
         var _loc4_:int = param1.readCustomParam_Number("y");
         _loc2_.setLocation(_loc3_,_loc4_);
         this.view.addGameObjectTolayer(_loc2_);
         TDGameInfo.getInstance().addGameobjectToMap(_loc2_);
         if(_loc2_.objectModel.staticInfo.isSort)
         {
            TDGameInfo.getInstance().addToSortList(_loc2_);
         }
         if(_loc2_.needShade)
         {
            _loc2_.addShade();
         }
         if(TDStageInfo.getInstance().isUnderWater && _loc2_.needSplash)
         {
            TDGameObjectCmd.addSeaSplashEffect(_loc2_);
         }
         else
         {
            TDGameObjectCmd.removeSeaSplashEffect(_loc2_);
         }
         CommandDispatcher.send(CommandName.TD_ForceSortDepth);
      }
      
      private function onForceSortDepth(param1:CommonEvent) : void
      {
         TDGameInfo.getInstance().isDepthChange = true;
      }
      
      private function debug_showUnitArea(param1:Event) : void
      {
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         for each(_loc2_ in TDGameInfo.getInstance().gameobjectMap)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.debug_showAreaInfo();
            }
         }
      }
      
      private function debug_hideUnitArea(param1:Event) : void
      {
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         for each(_loc2_ in TDGameInfo.getInstance().gameobjectMap)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.debug_hideAreaInfo();
            }
         }
      }
   }
}
