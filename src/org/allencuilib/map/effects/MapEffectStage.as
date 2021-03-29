package org.allencuilib.map.effects
{
   import asgui.core.IDisposable;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.allencuilib.map.interfaces.IMapEffect;
   
   public class MapEffectStage extends Sprite implements IDisposable
   {
       
      
      protected var effects:Vector.<IMapEffect>;
      
      private var _hasDisposed:Boolean;
      
      private var _isEnterFrameListenerRunning:Boolean = false;
      
      public function MapEffectStage()
      {
         this.effects = new Vector.<IMapEffect>();
         super();
      }
      
      public function Dispose() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         this.Clear();
         this._hasDisposed = true;
      }
      
      public function Clear() : void
      {
         while(this.effects.length > 0)
         {
            this.effects.pop().Dispose();
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function CheckEnterFrameListener() : void
      {
         if(this.effects.length == 0)
         {
            if(this._isEnterFrameListenerRunning)
            {
               this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
               this._isEnterFrameListenerRunning = false;
            }
         }
         else if(!this._isEnterFrameListenerRunning)
         {
            this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
            this._isEnterFrameListenerRunning = true;
         }
      }
      
      public function AddEffect(param1:IMapEffect) : IMapEffect
      {
         this.effects.push(param1);
         param1.id = this.effects.length - 1;
         this.CheckEnterFrameListener();
         return param1;
      }
      
      public function RemoveEffect(param1:IMapEffect) : IMapEffect
      {
         var _loc2_:int = 0;
         var _loc3_:IMapEffect = null;
         _loc2_ = 0;
         while(_loc2_ < this.effects.length)
         {
            if(this.effects[_loc2_] == param1)
            {
               _loc3_ = this.effects.splice(_loc2_,1)[0] as IMapEffect;
               this.CheckEnterFrameListener();
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function RemoveEffectAt(param1:int) : IMapEffect
      {
         var _loc2_:IMapEffect = this.effects.splice(param1,1)[0] as IMapEffect;
         this.CheckEnterFrameListener();
         return _loc2_;
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IMapEffect = null;
         _loc2_ = 0;
         while(_loc2_ < this.effects.length)
         {
            _loc3_ = this.effects[_loc2_] as IMapEffect;
            if(_loc3_.hasDisposed)
            {
               this.RemoveEffect(_loc3_);
            }
            else
            {
               _loc3_.UpdateFrame(this);
            }
            _loc2_++;
         }
      }
   }
}
