package org.allencuilib.map.tiled.tmx
{
   import asgui.core.IDisposable;
   
   public class TmxTile implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      public var properties:TmxPropertys;
      
      private var _id:int;
      
      public function TmxTile(param1:XML)
      {
         super();
         this._id = param1.@id;
         this.properties = new TmxPropertys(param1);
      }
      
      public function Dispose() : void
      {
         this.properties = null;
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}
