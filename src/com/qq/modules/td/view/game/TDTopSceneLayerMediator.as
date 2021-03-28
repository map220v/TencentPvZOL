package com.qq.modules.td.view.game
{
   import asgui.core.IDisposable;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guide.view.tips.GuideArea;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.display.DisplayObject;
   
   public class TDTopSceneLayerMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDTopSceneLayer;
      
      public function TDTopSceneLayerMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TDEffectCommand_AddMc,this.onAddMc,CommonEvent);
         addContextListener(CommandName.TDAddItemToScreen,this.onLootItem,CommonEvent);
         addContextListener(CommandName.TD_CleanGameSence,this.onClean,CommonEvent);
         addContextListener(CommandName.TDEffectCommand_LightArea,this.onShowLightArea,CommonEvent);
      }
      
      private function onShowLightArea(param1:CommonEvent) : void
      {
         var _loc5_:int = 0;
         var _loc7_:TDMapTileData = null;
         var _loc2_:GuideArea = GuideArea.instance;
         var _loc3_:int = param1.readCustomParam_Number("row");
         var _loc4_:int = param1.readCustomParam_Number("column");
         _loc5_ = param1.readCustomParam_Number("tileW");
         var _loc6_:int = param1.readCustomParam_Number("tileH");
         _loc7_ = TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc3_);
         _loc2_.x = _loc7_.rect.x;
         _loc2_.y = _loc7_.rect.y;
         _loc2_.resize(_loc5_ * _loc7_.rect.width,_loc6_ * _loc7_.rect.height);
         this.view.addChild(_loc2_);
      }
      
      private function onLootItem(param1:CommonEvent) : void
      {
         this.view.itemLayer.addChild(param1.param as DisplayObject);
      }
      
      private function onAddMc(param1:CommonEvent) : void
      {
         this.view.mcLayer.addChild(param1.param as DisplayObject);
      }
      
      private function onClean(param1:CommonEvent) : void
      {
         this.clear();
      }
      
      public function clear() : void
      {
         var _loc1_:Object = null;
         while(this.view.itemLayer.numChildren > 0)
         {
            _loc1_ = this.view.itemLayer.removeChildAt(0);
            if(_loc1_ is IDisposable)
            {
               (_loc1_ as IDisposable).Dispose();
            }
         }
      }
      
      override public function dispose() : void
      {
         this.clear();
         super.dispose();
      }
   }
}
