package com.qq.modules.td.view.effects
{
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.utils.UtilsManager;
   import flash.display.BlendMode;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class TDEffectFinishing extends Sprite
   {
       
      
      private var sp:Sprite;
      
      private var mc:MovieClip;
      
      private var finishCall:Function;
      
      private var _counter:int;
      
      private var _playSpeed:int;
      
      public function TDEffectFinishing(param1:Function = null)
      {
         super();
         this.sp = new Sprite();
         this.finishCall = param1;
         this.mc = AssetManager.GetNewClass("td_effect_finishing") as MovieClip;
         this.mc.stop();
         this.mc.blendMode = BlendMode.ADD;
         this.mc.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.sp.addChild(this.mc);
         addChild(this.sp);
         this._counter = 0;
         this._playSpeed = GameGloble.stage.frameRate / 30;
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         if(this.mc.currentFrame >= this.mc.totalFrames)
         {
            getLogger().info("塔防结束动画播放完成，回调TDCollectLootItemCommand");
            this.finishCall.apply();
            this.dispose();
         }
         else if(this._counter >= this._playSpeed)
         {
            this._counter = 0;
            this.mc.nextFrame();
         }
         else
         {
            ++this._counter;
         }
      }
      
      public function dispose() : void
      {
         this.mc.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         UtilsManager.removeFromContainer(this.mc);
         this.mc = null;
         this.finishCall = null;
      }
   }
}
