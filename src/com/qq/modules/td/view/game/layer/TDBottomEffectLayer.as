package com.qq.modules.td.view.game.layer
{
   import asgui.blit.Blit;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.starling.IBlitDisplayStarling;
   import com.qq.modules.td.logic.TDUILayerManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDBottomEffectLayer extends TDBasicLayer
   {
       
      
      public var bottomLayer:TDBasicLayer;
      
      public var effectsLayer:IBlitDisplayContainer;
      
      public var shadowLayer:IBlitDisplayContainer;
      
      public function TDBottomEffectLayer()
      {
         super();
         this.bottomLayer = new TDBasicLayer();
         this.addComponentToLayer(this.bottomLayer);
         this.effectsLayer = Blit.factory.CreateBlitContainer();
         this.shadowLayer = Blit.factory.CreateBlitContainer({"batch":false});
         getLogger("debug","alen").info("effectsLayer : " + this.effectsLayer);
         getLogger("debug","alen").info("shadowLayer : " + this.shadowLayer);
         getLogger("debug","alen").info("TDBottomEffectLayer.display is Sprite : " + (this.display is Sprite));
         if(this.effectsLayer is DisplayObject)
         {
            (this.effectsLayer as Sprite).mouseChildren = false;
            (this.effectsLayer as Sprite).mouseEnabled = false;
            this.addChild(this.effectsLayer as DisplayObject);
         }
         else
         {
            this.effectsLayer.x = this.x;
            this.addComponentToLayer((this.effectsLayer as IBlitDisplayStarling).asset);
         }
         this.addComponentToLayer(this.shadowLayer);
         TDUILayerManager.bottomEffectLayer = this;
         RobotlegExtendCmd.registerMapView(TDBottomEffectLayer,TDBottomEffectLayerMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      override public function Dispose() : void
      {
         if(!hasDisposed)
         {
            RobotlegExtendCmd.removeMediatorByView(this);
            if(this.effectsLayer)
            {
               while(this.effectsLayer.numChildren > 0)
               {
                  this.effectsLayer.RemoveChildAt(0).Dispose();
               }
               this.effectsLayer.Dispose();
               this.effectsLayer = null;
            }
            TDUILayerManager.bottomEffectLayer = null;
         }
         super.Dispose();
      }
   }
}
