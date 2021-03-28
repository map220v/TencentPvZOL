package com.qq.modules.td.logic
{
   import com.qq.modules.td.view.game.TDTopEffectLayer;
   import com.qq.modules.td.view.game.TDTopSceneLayer;
   import com.qq.modules.td.view.game.layer.TDBasicLayer;
   import com.qq.modules.td.view.game.layer.TDBottomEffectLayer;
   import com.qq.modules.td.view.game.layer.TDGameUILayer;
   import flash.display.Sprite;
   
   public class TDUILayerManager
   {
      
      public static var effectLayer:TDBasicLayer;
      
      public static var topEffectLayer:TDTopEffectLayer;
      
      public static var bottomEffectLayer:TDBottomEffectLayer;
      
      public static var topSceneLayer:TDTopSceneLayer;
      
      public static var uiPanel:Sprite;
      
      public static var gameUILayer:TDGameUILayer;
       
      
      public function TDUILayerManager()
      {
         super();
      }
      
      public static function clean() : void
      {
         if(effectLayer)
         {
            effectLayer.Dispose();
            effectLayer = null;
         }
         if(topEffectLayer)
         {
            topEffectLayer.Dispose();
            topEffectLayer = null;
         }
         if(topSceneLayer)
         {
            topSceneLayer.Dispose();
            topSceneLayer = null;
         }
         if(bottomEffectLayer)
         {
            bottomEffectLayer.Dispose();
            bottomEffectLayer = null;
         }
         if(gameUILayer)
         {
            gameUILayer.Dispose();
            gameUILayer = null;
         }
         uiPanel = null;
      }
   }
}
