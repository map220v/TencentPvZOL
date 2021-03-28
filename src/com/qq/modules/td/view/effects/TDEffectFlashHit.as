package com.qq.modules.td.view.effects
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.UrlManager;
   
   public class TDEffectFlashHit extends TDEffectTracer
   {
       
      
      private var mc:IBlitDisplayContainer;
      
      private var bullet:IBlitDisplayContainer;
      
      private var bulletInitWidth:int;
      
      private var ball1:IBlitDisplayContainer;
      
      private var ball2:IBlitDisplayContainer;
      
      private var fromY:int;
      
      private var fromX:int;
      
      public function TDEffectFlashHit(param1:int, param2:int, param3:IGameObject)
      {
         super(param3);
         this.fromX = param1;
         this.fromY = param2;
         this.bullet = addClip(UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"td_effect_cannon_flash.swf"),param1,param2,true);
         this.ball1 = addClip(UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"td_effect_cannon_flash_ball.swf"),param1,param2,true);
         this.ball2 = addClip(UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"td_effect_cannon_flash_ball.swf"),param1,param2,true);
         var _loc4_:IBlitClip = this.bullet.GetChildAt(0) as IBlitClip;
         this.bulletInitWidth = _loc4_.width;
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         this.mc = null;
         if(this.ball1)
         {
            this.ball1.Dispose();
         }
         if(this.ball2)
         {
            this.ball2.Dispose();
         }
         if(this.bullet)
         {
            this.bullet.Dispose();
         }
         super.dispose(false);
      }
      
      override public function onFrame() : void
      {
         if(go == null || !go.isVaild)
         {
            this.dispose();
            return;
         }
         var _loc1_:Object = go.frontLayer;
         var _loc2_:int = _loc1_.x;
         var _loc3_:int = _loc1_.y;
         var _loc4_:IBlitClip = this.bullet.GetChildAt(0) as IBlitClip;
         this.ball1.x = this.bullet.x + 70;
         this.bullet.width = Math.abs(_loc2_ - this.fromX) - 50;
         this.ball2.x = this.bullet.x + this.bullet.width + 20;
      }
   }
}
