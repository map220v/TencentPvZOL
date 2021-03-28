package com.qq.modules.td.view.game.layer
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.GraphicsUtils;
   import flash.events.Event;
   
   public class TDBulletLayerMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDBulletLayer;
      
      public function TDBulletLayerMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_Add_UnitToBulletLayer,this.onAddUnitToScreen,CommonEvent);
         addContextListener(CommandName.TD_Debug_ShowRoad,this.debug_showRoad,CommonEvent);
         addContextListener(CommandName.TD_Debug_HideRoad,this.debug_hideRoad,CommonEvent);
         addContextListener(CommandName.TD_Debug_ShowGameArea,this.debug_showGameArea,CommonEvent);
         addContextListener(CommandName.TD_Debug_HideGameArea,this.debug_hideGameArea,CommonEvent);
      }
      
      private function onAddUnitToScreen(param1:CommonEvent) : void
      {
         var _loc2_:IGameObject = param1.readCustomParam("object");
         var _loc3_:int = param1.readCustomParam_Number("x");
         var _loc4_:int = param1.readCustomParam_Number("y");
         _loc2_.setLocation(_loc3_,_loc4_);
         var _loc5_:Boolean;
         if((_loc5_ = TDStageInfo.getInstance().isUnderWater) && _loc2_.needSplash)
         {
            TDGameObjectCmd.addSeaSplashEffect(_loc2_);
         }
         else
         {
            TDGameObjectCmd.removeSeaSplashEffect(_loc2_);
         }
         if(param1.hasCustmeParam("param"))
         {
            _loc2_.setRunningProp(TDConstant.Gameobject_Prop_InitUnitParam,param1.readCustomParam("param"));
         }
         this.view.addGameObjectTolayer(_loc2_);
         TDGameInfo.getInstance().addGameobjectToMap(_loc2_);
      }
      
      private function debug_showRoad(param1:Event) : void
      {
         var _loc2_:TDMapRoadData = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:TDMapTileData = null;
         GraphicsUtils.cleanContainer(this.view.debugLayer.display);
         for each(_loc2_ in TDGameInfo.getInstance().roadList)
         {
            _loc3_ = (_loc2_.endX - _loc2_.startX) / _loc2_.tileList.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_.tileList.length)
            {
               _loc5_ = _loc2_.tileList[_loc4_];
               GraphicsUtils.drawRect(this.view.debugLayer.display,_loc5_.rect.x,_loc5_.rect.y,_loc5_.rect.width,_loc5_.rect.height,0,0.4,16711680);
               _loc4_++;
            }
         }
         GraphicsUtils.drawLine(this.view.debugLayer.display,TDGameInfo.getInstance().passWarfieldPosX,TDGameInfo.getInstance().gameArea.top,TDGameInfo.getInstance().passWarfieldPosX,TDGameInfo.getInstance().gameArea.bottom,16776960);
         GraphicsUtils.drawLine(this.view.debugLayer.display,TDGameInfo.getInstance().toycarPosX,TDGameInfo.getInstance().gameArea.top,TDGameInfo.getInstance().toycarPosX,TDGameInfo.getInstance().gameArea.bottom,16711680);
      }
      
      private function debug_hideRoad(param1:Event) : void
      {
         GraphicsUtils.cleanContainer(this.view.debugLayer.display);
      }
      
      private function debug_showGameArea(param1:Event) : void
      {
         GraphicsUtils.cleanContainer(this.view.debugLayer.display);
         GraphicsUtils.drawRect(this.view.debugLayer.display,TDGameInfo.getInstance().gameArea.x,TDGameInfo.getInstance().gameArea.y,TDGameInfo.getInstance().gameArea.width,TDGameInfo.getInstance().gameArea.height,0,0.4);
      }
      
      private function debug_hideGameArea(param1:Event) : void
      {
         GraphicsUtils.cleanContainer(this.view.debugLayer.display);
      }
   }
}
