package asgui.utils
{
   import asgui.controls.SWFLoader;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.FrameLabel;
   import flash.display.InteractiveObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.sampler.getSize;
   
   public class DisplayUtil
   {
       
      
      public function DisplayUtil()
      {
         super();
      }
      
      public static function WalkDisplayObjects(param1:DisplayObject, param2:Function) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         param2(param1);
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = DisplayObjectContainer(param1).numChildren;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = DisplayObjectContainer(param1).getChildAt(_loc4_);
               WalkDisplayObjects(_loc5_,param2);
               _loc4_++;
            }
         }
      }
      
      public static function CheckParents(param1:DisplayObject, param2:DisplayObjectContainer) : Boolean
      {
         if(param1.parent && param1.parent != param1.root)
         {
            if(param1.parent == param2)
            {
               return true;
            }
            return CheckParents(param1.parent,param2);
         }
         return false;
      }
      
      public static function GetAllChildrenOutputString(param1:DisplayObject, param2:int = 0) : String
      {
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:int = 0;
         var _loc3_:* = "\n*  ";
         var _loc4_:int = param2;
         while(_loc4_ > 0)
         {
            _loc3_ += "   ";
            _loc4_--;
         }
         var _loc5_:Array = param1.toString().split(".");
         var _loc6_:Number = getSize(param1);
         _loc3_ += _loc5_[_loc5_.length - 1] + "(" + _loc6_ + ")";
         if(param1 is DisplayObjectContainer)
         {
            _loc7_ = param1 as DisplayObjectContainer;
            _loc8_ = 0;
            while(_loc8_ < _loc7_.numChildren)
            {
               _loc3_ += GetAllChildrenOutputString(_loc7_.getChildAt(_loc8_),param2 + 1);
               _loc8_++;
            }
         }
         return _loc3_;
      }
      
      public static function GetAllMouseEnabledChildrenNum(param1:DisplayObjectContainer) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.mouseChildren == false)
         {
            return 1;
         }
         while(_loc3_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc3_) is InteractiveObject && (param1.getChildAt(_loc3_) as InteractiveObject).mouseEnabled)
            {
               _loc2_++;
            }
            if(param1.getChildAt(_loc3_) is DisplayObjectContainer && (param1.getChildAt(_loc3_) as DisplayObjectContainer).mouseChildren)
            {
               _loc2_ += GetAllMouseEnabledChildrenNum(param1.getChildAt(_loc3_) as DisplayObjectContainer);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function GetAllParentsTo(param1:DisplayObject, param2:Class) : Array
      {
         var _loc3_:Array = [];
         _loc3_.push(param1);
         while(param1.parent != null && !(param1.parent is param2))
         {
            _loc3_.push(param1.parent);
            param1 = param1.parent;
         }
         return _loc3_;
      }
      
      public static function StopMovieClip(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MovieClip = null;
         param1.stop();
         var _loc3_:int = param1.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(_loc4_ = param1.getChildAt(_loc2_) as MovieClip)
            {
               StopMovieClip(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public static function CleanMovieClip(param1:MovieClip) : void
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = 0;
         while(param1.numChildren > 0 && ++_loc2_ < 20)
         {
            _loc3_ = param1.removeChildAt(0) as MovieClip;
            if(_loc3_)
            {
               _loc3_.stop();
               CleanMovieClip(_loc3_);
            }
         }
      }
      
      public static function MergeBitmapDatas(param1:Vector.<BitmapData>, param2:Vector.<Rectangle>) : BitmapData
      {
         var _loc4_:int = 0;
         var _loc5_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc14_:int = 0;
         var _loc3_:int = param1.length;
         var _loc10_:Rectangle = new Rectangle();
         var _loc11_:Point = new Point();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1[_loc4_];
            _loc6_ += _loc5_.width;
            _loc7_ += _loc5_.height;
            if(_loc5_.width > _loc8_)
            {
               _loc8_ = _loc5_.width;
            }
            if(_loc5_.height > _loc9_)
            {
               _loc9_ = _loc5_.height;
            }
            _loc4_++;
         }
         var _loc12_:int = 1024;
         var _loc13_:BitmapData = new BitmapData(_loc12_,_loc12_,true,0);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1[_loc4_];
            _loc10_.width = _loc5_.width;
            _loc10_.height = _loc5_.height;
            if(_loc14_ < _loc5_.height)
            {
               _loc14_ = _loc5_.height;
            }
            if(_loc11_.x + _loc10_.width > _loc12_)
            {
               _loc11_.x = 0;
               _loc11_.y += _loc14_;
               _loc14_ = 0;
            }
            _loc13_.copyPixels(_loc5_,_loc10_,_loc11_);
            param2[_loc4_] = new Rectangle(_loc11_.x,_loc11_.y,_loc10_.width,_loc10_.height);
            _loc11_.x += _loc10_.width;
            _loc4_++;
         }
         return _loc13_;
      }
      
      public static function GetNextPowerOfTwo(param1:int) : int
      {
         var _loc2_:* = 0;
         if(param1 > 0 && (param1 & param1 - 1) == 0)
         {
            return param1;
         }
         _loc2_ = 1;
         while(_loc2_ < param1)
         {
            _loc2_ <<= 1;
         }
         return _loc2_;
      }
      
      public static function GetMatrixToTop(param1:DisplayObject) : Matrix
      {
         var _loc2_:Matrix = new Matrix();
         _loc2_.concat(param1.transform.matrix);
         if(param1.parent)
         {
            _loc2_.concat(GetMatrixToTop(param1.parent));
         }
         return _loc2_;
      }
      
      public static function AddPlayCompleteCallBack(param1:Object, param2:Function, param3:Array = null, param4:uint = 0) : void
      {
         var mcEnterFrameHandler:Function = null;
         var mcOrLoaderOrImage:Object = param1;
         var callBack:Function = param2;
         var callBackParam:Array = param3;
         var completeFrameOffset:uint = param4;
         mcEnterFrameHandler = function(param1:Event):void
         {
            var _loc2_:MovieClip = param1.currentTarget as MovieClip;
            if(_loc2_.currentFrame >= _loc2_.totalFrames - completeFrameOffset)
            {
               _loc2_.removeEventListener(Event.ENTER_FRAME,mcEnterFrameHandler);
               callBack.apply(null,callBackParam);
            }
         };
         if(mcOrLoaderOrImage is MovieClip)
         {
            (mcOrLoaderOrImage as MovieClip).removeEventListener(Event.ENTER_FRAME,mcEnterFrameHandler);
            (mcOrLoaderOrImage as MovieClip).addEventListener(Event.ENTER_FRAME,mcEnterFrameHandler);
         }
         else
         {
            WaitMovieClipLoadComplete(mcOrLoaderOrImage,AddPlayCompleteCallBack,[callBack,callBackParam,completeFrameOffset]);
         }
      }
      
      public static function AddFrameScriptOnLabel(param1:MovieClip, param2:String, param3:Function, param4:Array = null) : void
      {
         var _loc6_:FrameLabel = null;
         var _loc5_:Array = param1.currentLabels;
         for each(_loc6_ in _loc5_)
         {
            if(_loc6_.name == param2)
            {
               AddPlayCompleteCallBack(param1,param3,param4,param1.totalFrames - _loc6_.frame);
            }
         }
      }
      
      public static function AddFrameScriptOnFrame(param1:MovieClip, param2:int, param3:Function, param4:Array = null) : void
      {
         AddPlayCompleteCallBack(param1,param3,param4,param1.totalFrames - param2);
      }
      
      public static function PlayMcOnce(param1:MovieClip, param2:Boolean = true) : void
      {
         var playCompleted:Function = null;
         var mc:MovieClip = param1;
         var isAutoRemove:Boolean = param2;
         playCompleted = function():void
         {
            if(mc.parent && isAutoRemove)
            {
               mc.parent.removeChild(mc);
            }
         };
         AddPlayCompleteCallBack(mc,playCompleted);
         mc.gotoAndPlay(1);
      }
      
      public static function WaitMovieClipLoadComplete(param1:Object, param2:Function, param3:Array = null) : void
      {
         var swfLoaderCompleteHandler:Function = null;
         var mcOrLoaderOrImage:Object = param1;
         var callBack:Function = param2;
         var callBackParam:Array = param3;
         swfLoaderCompleteHandler = function(param1:Event):void
         {
            (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,swfLoaderCompleteHandler);
            WaitMovieClipLoadComplete((param1.currentTarget as SWFLoader).mcHolder,callBack,callBackParam);
         };
         if(mcOrLoaderOrImage is MovieClip)
         {
            callBackParam.unshift(mcOrLoaderOrImage);
            callBack.apply(null,callBackParam);
         }
         else if(mcOrLoaderOrImage is Loader)
         {
            WaitMovieClipLoadComplete((mcOrLoaderOrImage as Loader).content,callBack,callBackParam);
         }
         else if(mcOrLoaderOrImage is SWFLoader)
         {
            (mcOrLoaderOrImage as SWFLoader).addEventListener(Event.COMPLETE,swfLoaderCompleteHandler);
         }
      }
      
      public static function setMcNum(param1:Sprite, param2:String, param3:int, param4:int, param5:Boolean = true) : void
      {
         var _loc6_:Array = [];
         do
         {
            _loc6_.push(param4 % 10);
         }
         while((param4 = int(param4 * 0.1)) > 0);
         
         var _loc7_:int = _loc6_.length;
         var _loc8_:int = 0;
         while(_loc8_ < param3)
         {
            if(_loc8_ < _loc7_)
            {
               (param1[param2 + _loc8_] as MovieClip).gotoAndStop(_loc6_[_loc8_] + 1);
            }
            else
            {
               (param1[param2 + _loc8_] as MovieClip).gotoAndStop(1);
               (param1[param2 + _loc8_] as MovieClip).visible == param5;
            }
            _loc8_++;
         }
      }
      
      public static function setMcEnable(param1:InteractiveObject, param2:Boolean, param3:Boolean = true) : void
      {
         if(param2)
         {
            param1.mouseEnabled = true;
            if(param3)
            {
               param1.filters = [];
            }
         }
         else
         {
            param1.mouseEnabled = false;
            if(param3)
            {
               param1.filters = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0])];
            }
         }
      }
      
      public static function UpdateChildrenDepthByProperty(param1:DisplayObjectContainer, param2:String, param3:Boolean, param4:int = -1, param5:int = -1) : void
      {
         var _loc7_:DisplayObject = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param4 == -1)
         {
            param4 = 0;
         }
         if(param5 == -1)
         {
            param5 = param1.numChildren - 1;
         }
         var _loc6_:int = 0;
         while(param4 + _loc6_ < param5)
         {
            _loc7_ = null;
            _loc10_ = _loc9_ = param4 + _loc6_;
            while(_loc10_ <= param5)
            {
               _loc8_ = param1.getChildAt(_loc10_);
               if(_loc7_ == null)
               {
                  _loc7_ = _loc8_;
               }
               else
               {
                  _loc7_ = !!param3 ? (_loc7_[param2] > _loc8_[param2] ? _loc7_ : _loc8_) : (_loc7_[param2] < _loc8_[param2] ? _loc7_ : _loc8_);
               }
               _loc10_++;
            }
            if((_loc8_ = param1.getChildAt(_loc9_)) != _loc7_)
            {
               param1.swapChildren(_loc8_,_loc7_);
            }
            _loc6_++;
         }
      }
      
      public static function removeAllChildren(param1:DisplayObjectContainer) : void
      {
         while(param1.numChildren > 0)
         {
            param1.removeChildAt(0);
         }
      }
   }
}
