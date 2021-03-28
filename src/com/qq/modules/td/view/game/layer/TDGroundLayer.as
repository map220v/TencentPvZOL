package com.qq.modules.td.view.game.layer
{
   import com.qq.modules.basic.view.MixLayer;
   
   public class TDGroundLayer extends MixLayer
   {
       
      
      public var bgLayer:MixLayer;
      
      public var mudLayer:MixLayer;
      
      public var areaLayer:MixLayer;
      
      public function TDGroundLayer()
      {
         super();
         this.bgLayer = new MixLayer();
         this.mudLayer = new MixLayer();
         this.areaLayer = new MixLayer();
         this.areaLayer.setEnable(false);
         addMixLayer(this.bgLayer);
         addMixLayer(this.mudLayer);
         addMixLayer(this.areaLayer);
         setEnable(false);
      }
   }
}
