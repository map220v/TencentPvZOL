package asgui.styles
{
   import asgui.core.IDisposable;
   import asgui.core.IFrameUpdatable;
   import asgui.core.UIComponentGlobals;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class StyleSkin extends EventDispatcher implements IDisposable, IFrameUpdatable
   {
       
      
      private var skinDatas:Array;
      
      public var widthBorder:int;
      
      public var heightBorder:int;
      
      private var infos:Array;
      
      private var _hasDisposed:Boolean;
      
      private var _hasInit:Boolean;
      
      private var _isPlaying:Boolean;
      
      private var graphicsLastDraw:Graphics;
      
      private var widthLastDraw:int;
      
      private var heightLastDraw:int;
      
      private var appendingLastDraw:Boolean;
      
      private var x0LastDraw:int;
      
      private var y0LastDraw:int;
      
      private var currentFrame:int;
      
      private var isLoop:Boolean;
      
      private var _totalFrames:int = 1;
      
      public function StyleSkin(param1:StyleSkinInfo)
      {
         var _loc2_:int = 0;
         var _loc3_:SkinData = null;
         super();
         this.skinDatas = param1.skinDatas;
         this.infos = param1.infos;
         _loc2_ = 0;
         while(_loc2_ < this.skinDatas.length)
         {
            _loc3_ = this.skinDatas[_loc2_] as SkinData;
            if(_loc3_ != null)
            {
               if(this.widthBorder < _loc3_.widthBorder)
               {
                  this.widthBorder = _loc3_.widthBorder;
               }
               if(this.heightBorder < _loc3_.heightBorder)
               {
                  this.heightBorder = _loc3_.heightBorder;
               }
            }
            _loc2_++;
         }
      }
      
      public function Dispose() : void
      {
         if(!this.hasDisposed)
         {
            this.Stop();
            this._hasDisposed = true;
            this.skinDatas = null;
            this.infos = null;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function get hasInit() : Boolean
      {
         if(!this._hasInit)
         {
            this.CheckInit();
         }
         return this._hasInit;
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      private function CheckInit() : void
      {
         var _loc1_:int = 0;
         var _loc2_:SkinData = null;
         _loc1_ = 0;
         while(_loc1_ < this.skinDatas.length)
         {
            _loc2_ = this.skinDatas[_loc1_] as SkinData;
            if(_loc2_ != null)
            {
               if(!_loc2_.hasInit)
               {
                  _loc2_.addEventListener(Event.COMPLETE,this.SkinDataInitHandler,false,0,true);
                  this._hasInit = false;
                  return;
               }
               this._totalFrames = Math.max(this._totalFrames,_loc2_.totalFrames);
            }
            _loc1_++;
         }
         this._hasInit = true;
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function SkinDataInitHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.SkinDataInitHandler);
         this.CheckInit();
      }
      
      public function Draw(param1:Graphics, param2:int, param3:int, param4:Boolean = false, param5:int = 0, param6:int = 0, param7:Boolean = false, param8:Boolean = false) : void
      {
         var _loc9_:int = 0;
         var _loc11_:SkinDataInfo = null;
         var _loc12_:SkinData = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(this.hasDisposed)
         {
            return;
         }
         this.graphicsLastDraw = param1;
         this.widthLastDraw = param2;
         this.heightLastDraw = param3;
         this.appendingLastDraw = param4;
         this.x0LastDraw = param5;
         this.y0LastDraw = param6;
         var _loc10_:int = this.skinDatas.length;
         if(!param4)
         {
            param1.clear();
         }
         if(param7)
         {
            this.currentFrame = 0;
         }
         if(this.totalFrames > 1)
         {
            UIComponentGlobals.layoutManager.AddFrameEvent(this);
         }
         else
         {
            this.currentFrame = 0;
         }
         this._isPlaying = false;
         _loc9_ = 0;
         while(_loc9_ < _loc10_)
         {
            if(this.skinDatas[_loc9_] != null)
            {
               _loc11_ = this.infos[_loc9_] as SkinDataInfo;
               _loc12_ = this.skinDatas[_loc9_] as SkinData;
               _loc13_ = this.currentFrame;
               if((_loc14_ = Math.min(_loc12_.totalFrames,_loc11_.frameEnd) - _loc11_.frameStart) > 0)
               {
                  switch(_loc11_.animation.toLowerCase())
                  {
                     case "play":
                        if(this.currentFrame < _loc11_.frameStart + _loc14_)
                        {
                           this._isPlaying = true;
                        }
                        else
                        {
                           _loc13_ = _loc11_.frameStart + this.currentFrame - 1;
                        }
                        break;
                     case "loop":
                        this._isPlaying = true;
                        _loc13_ = _loc11_.frameStart + this.currentFrame % _loc14_;
                        break;
                     case "stop":
                     default:
                        _loc13_ = _loc11_.frameStart;
                  }
               }
               else
               {
                  _loc13_ = _loc11_.frameStart;
               }
               _loc12_.Draw(_loc11_,param1,param2,param3,true,param5,param6,_loc13_,param8);
            }
            _loc9_++;
         }
      }
      
      public function UpdateFrame() : void
      {
         if(this.isPlaying)
         {
            ++this.currentFrame;
            this.Draw(this.graphicsLastDraw,this.widthLastDraw,this.heightLastDraw,this.appendingLastDraw,this.x0LastDraw,this.y0LastDraw);
         }
      }
      
      public function Stop() : void
      {
         this._isPlaying = false;
      }
      
      public function get firstSkinData() : SkinData
      {
         if(this.skinDatas.length > 0)
         {
            return this.skinDatas[0] as SkinData;
         }
         return null;
      }
      
      public function get width() : int
      {
         if(this.firstSkinData)
         {
            return this.firstSkinData.width;
         }
         return 0;
      }
      
      public function get height() : int
      {
         if(this.firstSkinData)
         {
            return this.firstSkinData.height;
         }
         return 0;
      }
      
      public function GetFirstBitmapData() : BitmapData
      {
         if(this.firstSkinData)
         {
            return this.firstSkinData.GetFirstBitmapData();
         }
         return null;
      }
      
      public function get totalFrames() : int
      {
         return this._totalFrames;
      }
   }
}
