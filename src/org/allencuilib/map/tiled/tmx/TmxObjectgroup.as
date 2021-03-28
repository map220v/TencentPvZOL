package org.allencuilib.map.tiled.tmx
{
   import asgui.core.IDisposable;
   import asgui.utils.ColorUtil;
   
   public class TmxObjectgroup implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      public var objects:Vector.<TmxObject>;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TmxObjectgroup(param1:XML, param2:int, param3:int, param4:String)
      {
         var _loc5_:int = 0;
         var _loc6_:XMLList = null;
         super();
         this._name = param1.@name;
         this._width = param1.@width;
         this._height = param1.@height;
         this._color = ColorUtil.GetUintByCss(param1.@color);
         var _loc7_:int = (_loc6_ = param1["object"]).length();
         this.objects = new Vector.<TmxObject>(_loc7_,true);
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            this.objects[_loc5_] = new TmxObject(_loc6_[_loc5_],param2,param3,param4);
            _loc5_++;
         }
      }
      
      public function Dispose() : void
      {
         while(this.objects.length > 0)
         {
            (this.objects.pop() as TmxObject).Dispose();
         }
         this.objects = null;
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
   }
}
