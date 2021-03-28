package asgui.styles
{
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitDataManager;
   import asgui.core.Align;
   import asgui.core.UIComponentGlobals;
   import asgui.logger.AsguiLogger;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.IBitmapDrawable;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   class SkinData extends EventDispatcher
   {
      
      private static var sp:Shape = new Shape();
      
      private static const bmpds9GridType:Array = [Align.LEFT | Align.TOP,Align.HCENTER | Align.TOP,Align.RIGHT | Align.TOP,Align.LEFT | Align.VCENTER,Align.HCENTER | Align.VCENTER,Align.RIGHT | Align.VCENTER,Align.LEFT | Align.BOTTOM,Align.HCENTER | Align.BOTTOM,Align.RIGHT | Align.BOTTOM];
      
      private static var m:Matrix = new Matrix();
       
      
      private var frames:Array;
      
      public var hasInit:Boolean = false;
      
      public var widthBorder:int;
      
      public var heightBorder:int;
      
      private var scale9Grid:Rectangle;
      
      private var type:uint;
      
      private var widthTotal:int;
      
      private var heightTotal:int;
      
      private var _totalFrames:int = 1;
      
      function SkinData(param1:SkinDataInfo, param2:DisplayObject = null)
      {
         var _loc3_:BlitData = null;
         this.frames = [];
         super();
         this.type = param1.type;
         if(param2 != null)
         {
            this.Init(param2);
         }
         else if(param1.sourceName != null)
         {
            if(param1.symbolName == null)
            {
               _loc3_ = BlitDataManager.GetBlitDataByUrl(StyleManager.urlChangeFunc(param1.sourceName),true,65535,true,NaN,1,null,true);
               if(_loc3_.hasContent)
               {
                  this.Init(_loc3_.GetFrame(0).bitmapData);
               }
               else
               {
                  _loc3_.addEventListener(Event.COMPLETE,this.BDataLoadHandler,false,0,true);
               }
            }
         }
      }
      
      private static function Scale9GridRead(param1:MovieClip, param2:uint, param3:uint) : BitmapData
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:Rectangle = param1.scale9Grid;
         m.identity();
         switch(param2)
         {
            case Align.LEFT:
               if(_loc4_.x != 0)
               {
                  m.tx = 0;
                  _loc5_ = _loc4_.x;
               }
               break;
            case Align.RIGHT:
               if(param1.width - _loc4_.right != 0)
               {
                  m.tx = -_loc4_.right;
                  _loc5_ = param1.width - _loc4_.right;
               }
               break;
            case Align.HCENTER:
               m.tx = -_loc4_.x;
               _loc5_ = _loc4_.width;
         }
         switch(param3)
         {
            case Align.TOP:
               if(_loc4_.y != 0)
               {
                  m.ty = 0;
                  _loc6_ = _loc4_.y;
               }
               break;
            case Align.BOTTOM:
               if(param1.height - _loc4_.bottom != 0)
               {
                  m.ty = -_loc4_.bottom;
                  _loc6_ = param1.height - _loc4_.bottom;
               }
               break;
            case Align.VCENTER:
               m.ty = -_loc4_.y;
               _loc6_ = _loc4_.height;
         }
         if(_loc5_ <= 0 || _loc6_ <= 0)
         {
            return null;
         }
         var _loc7_:BitmapData;
         (_loc7_ = new BitmapData(_loc5_,_loc6_,true,0)).draw(param1,m);
         return _loc7_;
      }
      
      private static function Scale9GridDraw(param1:Graphics, param2:BitmapData, param3:int, param4:int, param5:int, param6:int, param7:uint, param8:uint, param9:int, param10:int, param11:int, param12:int, param13:Boolean, param14:Rectangle, param15:int, param16:int) : void
      {
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         m.identity();
         switch(param7)
         {
            case Align.LEFT:
               m.tx = param5 + 0 + param9;
               _loc19_ = m.tx;
               _loc17_ = param2.width;
               break;
            case Align.RIGHT:
               m.tx = param5 + param3 - param2.width - param10;
               _loc19_ = m.tx;
               _loc17_ = param2.width;
               break;
            case Align.HCENTER:
               m.tx = param5 + param14.x + param9;
               _loc19_ = m.tx;
               _loc17_ = param3 - param15 - param9 - param10;
         }
         switch(param8)
         {
            case Align.TOP:
               m.ty = param6 + 0 + param11;
               _loc20_ = m.ty;
               _loc18_ = param2.height;
               break;
            case Align.BOTTOM:
               m.ty = param4 - param2.height - param12 + param6;
               _loc20_ = m.ty;
               _loc18_ = param2.height;
               break;
            case Align.VCENTER:
               m.ty = param6 + param14.y + param11;
               _loc20_ = m.ty;
               _loc18_ = param4 - param16 - param11 - param12;
         }
         if(!param13)
         {
            if(param7 == Align.HCENTER)
            {
               m.a = _loc17_ / param2.width;
            }
            if(param8 == Align.VCENTER)
            {
               m.d = _loc18_ / param2.height;
            }
         }
         if(_loc17_ < 0 || _loc18_ < 0)
         {
            return;
         }
         param1.beginBitmapFill(param2,m,true,false);
         param1.drawRect(_loc19_,_loc20_,_loc17_,_loc18_);
      }
      
      private static function LayoutDraw(param1:Graphics, param2:BitmapData, param3:Matrix, param4:Rectangle, param5:Boolean) : void
      {
         param1.beginBitmapFill(param2,param3,param5,true);
         param1.drawRect(param4.x,param4.y,param4.width,param4.height);
         param1.endFill();
      }
      
      private static function OnlySkinDraw(param1:Graphics, param2:BitmapData, param3:int, param4:int, param5:int, param6:int, param7:uint, param8:uint, param9:int, param10:int, param11:int, param12:int) : void
      {
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc13_:Matrix = new Matrix();
         var _loc16_:int = param5;
         var _loc17_:int = param6;
         switch(param7)
         {
            case Align.LEFT:
            case Align.LEFT | Align.RIGHT:
               _loc13_.tx = 0 + param9;
               _loc16_ += 0 + param9;
               _loc14_ = Math.min(param3 - param9 - param10,param2.width);
               break;
            case Align.RIGHT:
               if((_loc14_ = Math.min(param3 - param9 - param10,param2.width)) < param2.width)
               {
                  _loc16_ += param9;
                  _loc13_.tx = _loc14_ - param2.width;
               }
               else
               {
                  _loc16_ += param3 - param2.width - param10;
                  _loc13_.tx = _loc16_;
               }
               break;
            case Align.HCENTER:
               if((_loc14_ = Math.min(param3 - param9 - param10,param2.width)) < param2.width)
               {
                  _loc16_ = param9;
                  _loc13_.tx = (_loc14_ - param2.width) / 2;
               }
               else
               {
                  _loc16_ += (param3 - param2.width) / 2;
                  _loc13_.tx = _loc16_;
               }
         }
         switch(param8)
         {
            case Align.TOP:
            case Align.TOP | Align.BOTTOM:
               _loc13_.ty = 0 + param11;
               _loc17_ += 0 + param11;
               _loc15_ = Math.min(param4 - param11 - param12,param2.height);
               break;
            case Align.BOTTOM:
               if((_loc15_ = Math.min(param4 - param11 - param12,param2.height)) < param2.height)
               {
                  _loc17_ += param11;
                  _loc13_.ty = _loc15_ - param2.height;
               }
               else
               {
                  _loc17_ += param4 - param2.height - param12;
                  _loc13_.ty = _loc17_;
               }
               break;
            case Align.VCENTER:
               if((_loc15_ = Math.min(param4 - param11 - param12,param2.height)) < param2.height)
               {
                  _loc17_ += param11;
                  _loc13_.ty = (_loc15_ - param2.height) / 2;
               }
               else
               {
                  _loc17_ += (param4 - param2.height) / 2;
                  _loc13_.ty = _loc17_;
               }
         }
         if(_loc14_ < 0 || _loc15_ < 0)
         {
            return;
         }
         param1.beginBitmapFill(param2,_loc13_,true,true);
         param1.drawRect(_loc16_,_loc17_,_loc14_,_loc15_);
         param1.endFill();
      }
      
      private function BDataLoadHandler(param1:Event) : void
      {
         this.Init((param1.currentTarget as BlitData).GetFrame(0).bitmapData);
      }
      
      private function Init(param1:IBitmapDrawable) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BitmapData = null;
         var _loc6_:MovieClip = null;
         var _loc7_:Matrix = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc2_:int = param1["width"];
         var _loc3_:int = param1["height"];
         if(param1 is MovieClip)
         {
            _loc6_ = param1 as MovieClip;
            this._totalFrames = _loc6_.totalFrames;
            _loc4_ = 0;
            while(_loc4_ < this.totalFrames)
            {
               _loc6_.gotoAndStop(_loc4_ + 1);
               if(this.type == Align.SCALE9GRID && (param1 as MovieClip).scale9Grid)
               {
                  this.scale9Grid = _loc6_.scale9Grid;
                  _loc7_ = new Matrix(1,0,0,1,0,0);
                  _loc9_ = [];
                  _loc8_ = 0;
                  while(_loc8_ < 9)
                  {
                     _loc9_[_loc8_] = Scale9GridRead(_loc6_,bmpds9GridType[_loc8_] & Align.H,bmpds9GridType[_loc8_] & Align.V);
                     _loc8_++;
                  }
                  if(_loc4_ == 0)
                  {
                     this.widthBorder = 0;
                     this.heightBorder = 0;
                     if(_loc9_[0] != null)
                     {
                        this.widthBorder += (_loc9_[0] as BitmapData).width;
                     }
                     if(_loc9_[2] != null)
                     {
                        this.widthBorder += (_loc9_[2] as BitmapData).width;
                     }
                     if(_loc9_[0] != null)
                     {
                        this.heightBorder += (_loc9_[0] as BitmapData).height;
                     }
                     if(_loc9_[6] != null)
                     {
                        this.heightBorder += (_loc9_[6] as BitmapData).height;
                     }
                  }
                  this.frames[_loc4_] = _loc9_;
               }
               else
               {
                  (_loc5_ = new BitmapData(_loc2_,_loc3_,true,0)).draw(_loc6_);
                  this.frames[_loc4_] = _loc5_;
               }
               _loc4_++;
            }
         }
         else if(param1 is BitmapData)
         {
            this.frames = [param1];
         }
         else if(param1 is Bitmap)
         {
            this.frames = [(param1 as Bitmap).bitmapData];
         }
         else
         {
            if(_loc2_ == 0)
            {
               AsguiLogger.Warn(this,param1 + " width is 0");
               _loc2_ = 1;
            }
            if(_loc3_ == 0)
            {
               AsguiLogger.Warn(this,param1 + " height is 0");
               _loc3_ = 1;
            }
            (_loc5_ = new BitmapData(_loc2_,_loc3_,true,0)).draw(param1);
            this.frames = [_loc5_];
         }
         this.widthTotal = _loc2_;
         this.heightTotal = _loc3_;
         this.hasInit = true;
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function get totalFrames() : int
      {
         return this._totalFrames;
      }
      
      public function Draw(param1:SkinDataInfo, param2:Graphics, param3:int, param4:int, param5:Boolean = false, param6:int = 0, param7:int = 0, param8:int = 0, param9:Boolean = false) : void
      {
         var _loc10_:BitmapData = null;
         var _loc11_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:Graphics = null;
         var _loc18_:Boolean = false;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:BitmapData = null;
         var _loc24_:BitmapData = null;
         var _loc12_:int = param1.paddingLeft;
         var _loc13_:int = param1.paddingBottom;
         var _loc14_:int = param1.paddingTop;
         var _loc15_:int = param1.paddingRight;
         param8 = Math.min(param8,this.totalFrames - 1);
         if(!param5)
         {
            param2.clear();
         }
         if(param3 == 0 || param4 == 0)
         {
            return;
         }
         if(this.scale9Grid != null)
         {
            _loc16_ = this.frames[param8];
            if(param3 < this.widthBorder)
            {
               param3 = this.widthBorder;
            }
            if(param4 < this.heightBorder)
            {
               param4 = this.heightBorder;
            }
            if(_loc18_ = param9 || UIComponentGlobals.drawDrawScale9GridInPixelMode)
            {
               (_loc17_ = sp.graphics).clear();
            }
            else
            {
               _loc17_ = param2;
            }
            _loc11_ = 0;
            while(_loc11_ < 9)
            {
               if(_loc16_[_loc11_])
               {
                  Scale9GridDraw(_loc17_,_loc16_[_loc11_] as BitmapData,param3,param4,param6,param7,bmpds9GridType[_loc11_] & 15,bmpds9GridType[_loc11_] & 240,_loc12_,_loc15_,_loc14_,_loc13_,param1.tile,this.scale9Grid,this.widthBorder,this.heightBorder);
               }
               _loc11_++;
            }
            m.identity();
            if(_loc18_)
            {
               _loc19_ = param6 + _loc12_;
               _loc20_ = param7 + _loc14_;
               _loc21_ = param3 - _loc12_ - _loc15_;
               _loc22_ = param4 - _loc14_ - _loc13_;
               m.tx = -_loc19_;
               m.ty = -_loc20_;
               (_loc23_ = new BitmapData(_loc21_,_loc22_,true,0)).draw(sp,m);
               m.tx = _loc19_;
               m.ty = _loc20_;
               param2.beginBitmapFill(_loc23_,m);
               param2.drawRect(_loc19_,_loc20_,_loc21_,_loc22_);
               param2.endFill();
            }
            return;
         }
         _loc24_ = this.frames[param8];
         LayoutDraw(param2,_loc24_,param1.GetLayoutMatrix(_loc24_,param6,param7,param3,param4,param1.tile),param1.GetLayoutRect(_loc24_,param6,param7,param3,param4,param1.tile),param1.tile);
      }
      
      public function get width() : int
      {
         return this.widthTotal;
      }
      
      public function get height() : int
      {
         return this.heightTotal;
      }
      
      public function GetTotalPixelSize() : int
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:BitmapData = null;
         var _loc2_:int = 0;
         var _loc4_:int = this.frames.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this.frames[_loc3_] is Array)
            {
               _loc5_ = this.frames[_loc3_];
               _loc1_ = 0;
               while(_loc1_ < _loc5_.length)
               {
                  if(_loc5_[_loc1_] != null)
                  {
                     _loc2_ += _loc5_[_loc1_].width * _loc5_[_loc1_].height;
                  }
                  _loc1_++;
               }
            }
            else if(this.frames[_loc3_] is BitmapData)
            {
               _loc6_ = this.frames[_loc3_];
               _loc2_ += _loc6_.width * _loc6_.height;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function GetFirstBitmapData() : BitmapData
      {
         if(this.frames[0] && this.frames[0] is BitmapData)
         {
            return this.frames[0];
         }
         return null;
      }
   }
}
