package com.qq.modules.td.view.game.layer
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class TDGroundLayerMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDGroundLayer;
      
      private var bitmapData:BitmapData;
      
      private var flagArea:Object;
      
      public function TDGroundLayerMediator()
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
         addContextListener(CommandName.TD_InitGround,this.onInitGround,CommonEvent);
         addContextListener(CommandName.TD_CleanGround,this.onCleanGround,CommonEvent);
         addContextListener(CommandName.TD_ShowSkillArea,this.onShowSkillArea,CommonEvent);
         addContextListener(CommandName.TD_HideSkillArea,this.onHideSkillArea,CommonEvent);
         addContextListener(CommandName.TD_Add_UnitToGroundLayer,this.onAddUnitToScreen,CommonEvent);
      }
      
      override public function dispose() : void
      {
         TDFloorManager.instance.Dispose();
         super.dispose();
      }
      
      private function onInitGround(param1:Event) : void
      {
         var _loc2_:Bitmap = TDFactory.getRes(TDConstant.TDRes_MapImg) as Bitmap;
         if(_loc2_)
         {
            TDGameInfo.getInstance().groundW = _loc2_.width;
            TDGameInfo.getInstance().groundH = _loc2_.height;
            this.view.bgLayer.addComponentToLayer(_loc2_);
         }
         getLogger("td").info("ground : onInitGround");
         TDFloorManager.instance.init(this.view.mudLayer);
      }
      
      private function onCleanGround(param1:Event) : void
      {
         this.view.bgLayer.removeAllChild();
         this.view.areaLayer.removeAllChild();
      }
      
      private function onShowSkillArea(param1:CommonEvent) : void
      {
      }
      
      private function onHideSkillArea(param1:CommonEvent) : void
      {
         this.view.areaLayer.removeAllChild();
      }
      
      private function onAddUnitToScreen(param1:CommonEvent) : void
      {
         var _loc2_:IGameObject = param1.readCustomParam("object");
         var _loc3_:int = param1.readCustomParam_Number("x");
         var _loc4_:int = param1.readCustomParam_Number("y");
         _loc2_.setLocation(_loc3_,_loc4_);
         this.view.bgLayer.addComponentToLayer(_loc2_.frontLayer);
         TDGameInfo.getInstance().addGameobjectToMap(_loc2_);
      }
   }
}
