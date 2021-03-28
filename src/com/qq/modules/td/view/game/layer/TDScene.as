package com.qq.modules.td.view.game.layer
{
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   import org.as3commons.logging.api.getLogger;
   
   public class TDScene extends MixLayer
   {
      
      private static var counter:int;
       
      
      public var gameUILayer:TDGameUILayer;
      
      public var groundLayer:TDGroundLayer;
      
      public var effectLayer:TDEffectLayer;
      
      public var unitLayer:TDUnitLayer;
      
      public var topGroundLayer:TDTopGroundLayer;
      
      public var skyLayer:TDSkyLayer;
      
      private var _hasDisposed:Boolean;
      
      public function TDScene()
      {
         super();
      }
      
      override public function Dispose() : void
      {
         if(hasDisposed)
         {
            return;
         }
         TDShadowManager.instance.Dispose();
         getLogger("td").info(this.name + "::Dispose");
         super.Dispose();
      }
      
      override protected function init() : void
      {
         var _loc4_:MixLayer = null;
         super.init();
         this.name = "TDScene_" + ++counter;
         var _loc1_:Array = new Array();
         this.groundLayer = new TDGroundLayer();
         this.groundLayer.name = "TDGroundLayer";
         _loc1_.push(this.groundLayer);
         this.gameUILayer = new TDGameUILayer();
         TDUILayerManager.gameUILayer = this.gameUILayer;
         _loc1_.push(this.gameUILayer);
         var _loc2_:TDBottomEffectLayer = new TDBottomEffectLayer();
         _loc2_.name = "TDBottomEffectLayer";
         _loc1_.push(_loc2_);
         TDShadowManager.instance.Init(_loc2_.shadowLayer);
         this.unitLayer = new TDUnitLayer();
         this.unitLayer.name = "TDUnitLayer";
         _loc1_.push(this.unitLayer);
         var _loc3_:TDBulletLayer = new TDBulletLayer();
         _loc3_.name = "TDBulletLayer";
         _loc1_.push(_loc3_);
         this.effectLayer = new TDEffectLayer();
         this.effectLayer.name = "TDEffectLayer";
         TDUILayerManager.effectLayer = this.effectLayer;
         _loc1_.push(this.effectLayer);
         this.topGroundLayer = new TDTopGroundLayer();
         this.topGroundLayer.name = "TDTopGroundLayer";
         _loc1_.push(this.topGroundLayer);
         this.skyLayer = new TDSkyLayer();
         this.skyLayer.name = "TDSkyLayer";
         _loc1_.push(this.skyLayer);
         for each(_loc4_ in _loc1_)
         {
            addMixLayer(_loc4_);
            getLogger("td").info(_loc4_.name + " parent : " + _loc4_.display.parent);
         }
         getLogger("td").info(this.name + "::init : " + this.display.numChildren);
      }
   }
}
