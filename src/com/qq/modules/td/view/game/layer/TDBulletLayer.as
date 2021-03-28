package com.qq.modules.td.view.game.layer
{
   import com.qq.modules.basic.view.MixLayer;
   
   public class TDBulletLayer extends TDBasicLayer
   {
       
      
      public var debugLayer:MixLayer;
      
      public var areaLayer:MixLayer;
      
      public function TDBulletLayer()
      {
         super();
         this.debugLayer = new MixLayer();
         this.areaLayer = new MixLayer();
         this.areaLayer.setEnable(false);
         addMixLayer(this.areaLayer);
         addMixLayer(this.debugLayer);
      }
   }
}
