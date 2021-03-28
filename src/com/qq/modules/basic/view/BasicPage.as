package com.qq.modules.basic.view
{
   import asgui.core.IDisposable;
   import flash.display.Sprite;
   
   public class BasicPage extends Sprite implements IDisposable
   {
       
      
      private var _hasDisposed:Boolean;
      
      public function BasicPage()
      {
         super();
         this.init();
      }
      
      protected function init() : void
      {
      }
      
      public function Dispose() : void
      {
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
   }
}
