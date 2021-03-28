package com.qq.modules.basic.modle
{
   import asgui.core.IDisposable;
   import org.robotlegs.mvcs.Actor;
   
   public class BasicProxy extends Actor implements IDisposable
   {
       
      
      private var _hasDisposed:Boolean;
      
      public function BasicProxy()
      {
         super();
      }
      
      public function init(param1:Array = null) : void
      {
         this.handleEvents();
      }
      
      public function handleEvents() : void
      {
         var _loc1_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Function = null;
         var _loc2_:Array = this.listMsgInterests();
         var _loc3_:int = _loc2_.length;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            if(!(_loc2_[_loc1_] == null || _loc2_[_loc1_].length < 2))
            {
               _loc4_ = _loc2_[_loc1_][0];
               _loc5_ = _loc2_[_loc1_][1];
               this.eventDispatcher.addEventListener(_loc4_,_loc5_);
            }
            _loc1_++;
         }
      }
      
      public function unhandleEvents() : void
      {
         var _loc1_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Function = null;
         var _loc2_:Array = this.listMsgInterests();
         var _loc3_:int = _loc2_.length;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            if(!(_loc2_[_loc1_] == null || _loc2_[_loc1_].length < 2))
            {
               _loc4_ = _loc2_[_loc1_][0];
               _loc5_ = _loc2_[_loc1_][1];
               this.eventDispatcher.removeEventListener(_loc4_,_loc5_);
            }
            _loc1_++;
         }
      }
      
      public function listMsgInterests() : Array
      {
         return [];
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         this.unhandleEvents();
         this._hasDisposed = true;
      }
   }
}
