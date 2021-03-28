package com.qq.modules.td.view.effects
{
   import asgui.blit.Blit;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.Application;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public class TDEffectTracer
   {
       
      
      protected var go:IGameObject;
      
      public var asset:IBlitDisplayContainer;
      
      protected var frameCounter:int;
      
      private var useDamagePos:Boolean;
      
      public function TDEffectTracer(param1:IGameObject, param2:Boolean = false)
      {
         super();
         this.useDamagePos = param2;
         this.go = param1;
         this.asset = Blit.factory.CreateBlitContainer();
         Application.application.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      public function dispose(param1:Boolean = true) : void
      {
         if(param1 && this.asset && !this.asset.hasDisposed)
         {
            while(this.asset.numChildren > 0)
            {
               this.asset.RemoveChildAt(0).Dispose();
            }
            this.asset.Dispose();
         }
         this.asset = null;
         Application.application.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.go = null;
      }
      
      public function addClip(param1:String, param2:Number = NaN, param3:Number = NaN, param4:Boolean = false) : IBlitDisplayContainer
      {
         var _loc5_:IBlitClip = null;
         var _loc6_:IBlitDisplayContainer = Blit.factory.CreateBlitContainer();
         _loc6_ = Blit.factory.CreateBlitContainer();
         (_loc5_ = Blit.factory.CreateBlitClip()).autoUpdatePosition = true;
         _loc5_.dataProvider = BlitDataManager.GetBlitDataByUrl(param1);
         _loc5_.Play(!!param4 ? 1 : 0);
         _loc6_.x = !!isNaN(param2) ? Number(0) : Number(param2);
         _loc6_.y = !!isNaN(param3) ? Number(0) : Number(param3);
         _loc6_.AddChild(_loc5_);
         this.asset.AddChild(_loc6_);
         if(param4)
         {
            _loc5_.addEventListener(Event.COMPLETE,this.playCompleteHandler);
         }
         return _loc6_;
      }
      
      private function playCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.playCompleteHandler);
         this.dispose();
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         ++this.frameCounter;
         if(this.frameCounter % 1 != 0)
         {
            return;
         }
         this.onFrame();
      }
      
      public function onFrame() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Rectangle = null;
         if(this.asset.hasDisposed)
         {
            this.dispose();
            return;
         }
         var _loc1_:int = this.go.x;
         var _loc2_:int = this.go.y;
         if(this.useDamagePos)
         {
            _loc3_ = (_loc5_ = TDCheckCollision.getNewObjRect(this.go,this.go.damageArea)).x;
            _loc4_ = _loc5_.y + _loc5_.height * 0.5;
         }
         else
         {
            _loc3_ = _loc1_;
            _loc4_ = _loc2_;
         }
         this.asset.scaleX = this.go.scaleX;
         this.asset.x = _loc3_;
         this.asset.y = _loc4_;
      }
   }
}
