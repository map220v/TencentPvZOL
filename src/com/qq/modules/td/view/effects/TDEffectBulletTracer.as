package com.qq.modules.td.view.effects
{
   import asgui.blit.Blit;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.utils.LineMath;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TDEffectBulletTracer extends TDEffectTracer
   {
       
      
      private var mc:IBlitDisplayContainer;
      
      private var bullet:IBlitDisplayContainer;
      
      private var lastPt:Point;
      
      public function TDEffectBulletTracer(param1:IGameObject)
      {
         super(param1);
         this.bullet = addClip(UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"td_effect_cannon_bullet_center.swf"));
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         this.mc = null;
         if(this.bullet)
         {
            this.bullet.Dispose();
         }
         super.dispose(false);
      }
      
      override public function onFrame() : void
      {
         var ank:Number = NaN;
         var c:IBlitClip = null;
         var d:IBlitDisplayContainer = null;
         var bcCompleteHandler:Function = null;
         bcCompleteHandler = function():void
         {
            d.Dispose();
         };
         if(go == null || !go.isVaild)
         {
            this.dispose();
            return;
         }
         var assetsLayer:Object = go.frontLayer;
         var xx:int = assetsLayer.x;
         var yy:int = assetsLayer.y;
         var newPt:Point = new Point(assetsLayer.x,assetsLayer.y);
         if(this.lastPt != null)
         {
            ank = LineMath.Radian(this.lastPt,newPt);
         }
         this.lastPt = newPt;
         if(isNaN(ank))
         {
            return;
         }
         d = Blit.factory.CreateBlitContainer();
         c = Blit.factory.CreateBlitClip();
         c.autoUpdatePosition = true;
         c.dataProvider = BlitDataManager.GetBlitDataByUrl(UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"td_effect_cannon_bullet.swf"));
         c.Play(1);
         c.addEventListener(Event.COMPLETE,bcCompleteHandler);
         d.AddChild(c);
         asset.AddChild(d);
         this.mc = d;
         this.mc.x = xx;
         this.mc.y = yy;
         this.mc.rotation = ank + Math.PI / 16 - Math.random() * Math.PI / 8;
         if(this.bullet)
         {
            this.bullet.x = xx;
            this.bullet.y = yy;
         }
      }
   }
}
