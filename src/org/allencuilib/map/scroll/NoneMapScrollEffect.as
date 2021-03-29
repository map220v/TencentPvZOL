package org.allencuilib.map.scroll
{
   public class NoneMapScrollEffect implements IMapScrollEffect
   {
       
      
      private var _hasDisposed:Boolean = false;
      
      public function NoneMapScrollEffect()
      {
         super();
      }
      
      public function Dispose() : void
      {
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function CameraTo(param1:Function, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1(param4,param5);
      }
   }
}
