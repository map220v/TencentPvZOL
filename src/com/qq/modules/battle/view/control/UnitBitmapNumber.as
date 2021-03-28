package com.qq.modules.battle.view.control
{
   import asgui.core.IDisposable;
   import asgui.resources.AssetManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class UnitBitmapNumber extends Sprite implements IDisposable
   {
      
      public static const STYLE_YELLOW:String = "battle_ui_Number_y_";
      
      public static const STYLE_RED:String = "battle_ui_Number_r_";
      
      public static const STYLE_GREEN:String = "battle_ui_Number_g_";
      
      public static const STYLE_BLUE:String = "battle_ui_Number_b_";
       
      
      private var isDispose:Boolean;
      
      private var _val:int;
      
      private var _gap:int = -1;
      
      private var bits:Vector.<Bitmap>;
      
      private var _style:String = "battle_ui_Number_y_";
      
      public function UnitBitmapNumber()
      {
         super();
         this.bits = new Vector.<Bitmap>();
      }
      
      private function clearBit() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bits.length)
         {
            removeChild(this.bits[_loc1_]);
            this.bits[_loc1_].bitmapData.dispose();
            _loc1_++;
         }
         this.bits.length = 0;
      }
      
      public function set value(param1:int) : void
      {
         this._val = param1;
         this.clearBit();
         if(this._val < 0)
         {
            this.createBitNum("j");
         }
         else if(this._style == STYLE_GREEN || this._style == STYLE_BLUE)
         {
            this.createBitNum("z");
         }
         var _loc2_:String = Math.abs(this._val).toString();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            this.createBitNum(_loc2_.charAt(_loc3_));
            _loc3_++;
         }
      }
      
      public function set miss(param1:Boolean) : void
      {
         this._val = 0;
         this.clearBit();
         var _loc2_:Class = AssetManager.GetClass("battle_ui_Number_miss");
         var _loc3_:Bitmap = new Bitmap(new _loc2_());
         this.bits.push(_loc3_);
         addChild(_loc3_);
      }
      
      private function createBitNum(param1:String) : void
      {
         var _loc2_:Class = AssetManager.GetClass(this._style + param1);
         var _loc3_:Bitmap = new Bitmap(new _loc2_());
         if(this.bits.length > 0)
         {
            _loc3_.x = this.bits[this.bits.length - 1].x + this.bits[this.bits.length - 1].width + this._gap;
         }
         _loc3_.y = (32 - _loc3_.height) / 2;
         this.bits.push(_loc3_);
         addChild(_loc3_);
      }
      
      public function get value() : int
      {
         return this._val;
      }
      
      public function set style(param1:String) : void
      {
         this._style = param1;
         if(this._style == STYLE_YELLOW)
         {
            this._gap = -2;
         }
         else
         {
            this._gap = -1;
         }
      }
      
      public function set gap(param1:int) : void
      {
         this._gap = param1;
      }
      
      public function reset() : void
      {
         this.clearBit();
         this._val = 0;
      }
      
      public function Dispose() : void
      {
         this.clearBit();
         this._val = 0;
         this.isDispose = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this.isDispose;
      }
   }
}
