package asgui.blit.bone
{
   import asgui.blit.Blit;
   import asgui.blit.bone.rules.BlitBoneDataOuterBindRule;
   import asgui.blit.bone.rules.BlitBoneVisibleRule;
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.data.BlitFrameData;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.core.IDisposable;
   import asgui.logger.AsguiLogger;
   import asgui.logger.Statistic;
   import asgui.utils.ColorUtil;
   import asgui.utils.ObjectUtil;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   
   public class BlitBoneFrameChild implements IDisposable
   {
      
      private static const ENABLE_BONE_IN_BONE:Boolean = true;
      
      private static var tmpMatrix:Matrix = new Matrix();
      
      private static var tmpColorTransform:ColorTransform = new ColorTransform();
      
      private static const TYPE_HAS_XY:int = 1;
      
      private static const TYPE_HAS_M_A:int = 2;
      
      private static const TYPE_HAS_M_B:int = 4;
      
      private static const TYPE_HAS_M_C:int = 8;
      
      private static const TYPE_HAS_M_D:int = 16;
      
      private static const TYPE_HAS_ALPHA:int = 32;
      
      private static const TYPE_HAS_COLORTRANSFORM:int = 64;
      
      private static const TYPE_HAS_BLENDMODE:int = 128;
      
      private static const TYPE_HAS_CHILDREN:int = 256;
      
      private static const TYPE_HAS_BATCHES:int = 512;
       
      
      public var useRealTimeRenderColorTransformAndFilters:Boolean = false;
      
      private var _className:String;
      
      private var _m:Matrix;
      
      private var _colorTransform:ColorTransform;
      
      private var _colorTransformString:String;
      
      private var _isRoof:Boolean;
      
      private var hasColorTransformChanged:Boolean;
      
      private var blendMode:String;
      
      public var children:Vector.<BlitBoneFrameChild>;
      
      public var batches:Vector.<BlitBoneFrameBatch>;
      
      private var _hasDisposed:Boolean;
      
      public function BlitBoneFrameChild(param1:DisplayObject = null, param2:ApplicationDomain = null, param3:Array = null, param4:Array = null, param5:Number = 1, param6:BlitBoneDataOuterBindRule = null)
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:BlitData = null;
         var _loc10_:int = 0;
         var _loc11_:MovieClip = null;
         var _loc12_:String = null;
         var _loc13_:Class = null;
         var _loc14_:Boolean = false;
         var _loc15_:* = false;
         this._m = new Matrix();
         this._colorTransform = new ColorTransform();
         super();
         if(param1)
         {
            _loc12_ = getQualifiedClassName(param1);
            _loc13_ = null;
            if(_loc12_.split(".")[0] == "flash")
            {
               _loc12_ = param1.name;
               if(param3[_loc12_] == null)
               {
                  (_loc9_ = BlitDataManager.GetBlitDataByObject(param1,65535,NaN,param5)).name = _loc12_;
                  param3[_loc12_] = _loc9_;
               }
            }
            else
            {
               _loc14_ = param6.CheckSelfExpressAddRuleByMC(param1 as MovieClip,_loc12_);
               if(ENABLE_BONE_IN_BONE && param1 is MovieClip && Blit.CheckIfMcToBlitBoneHasChildren(param1 as MovieClip) && !_loc14_)
               {
                  _loc11_ = param1 as MovieClip;
                  if((param1 as MovieClip).totalFrames == 1)
                  {
                     _loc15_ = false;
                     _loc7_ = 0;
                     while(_loc7_ < _loc11_.numChildren)
                     {
                        if(!(_loc11_.getChildAt(_loc7_) is MovieClip))
                        {
                           break;
                        }
                        _loc7_++;
                     }
                     if(_loc15_ = _loc7_ == _loc11_.numChildren)
                     {
                        this.children = new Vector.<BlitBoneFrameChild>();
                        _loc7_ = 0;
                        while(_loc7_ < _loc11_.numChildren)
                        {
                           this.children.push(new BlitBoneFrameChild(_loc11_.getChildAt(_loc7_),param2,param3,param4,param5,param6));
                           _loc7_++;
                        }
                     }
                     else
                     {
                        _loc13_ = param2.getDefinition(_loc12_) as Class;
                        _loc12_ = this.writeBlitData(param3,_loc13_,_loc12_,param1,param5,true);
                     }
                  }
                  else if(param4[_loc12_])
                  {
                     this.batches = param4[_loc12_];
                  }
                  else
                  {
                     this.batches = new Vector.<BlitBoneFrameBatch>(_loc11_.totalFrames,true);
                     _loc7_ = 0;
                     while(_loc7_ < _loc11_.totalFrames)
                     {
                        _loc11_.gotoAndStop(_loc7_ + 1);
                        this.batches[_loc7_] = new BlitBoneFrameBatch(_loc11_,param2,param3,param4,param5,param6);
                        _loc7_++;
                     }
                     param4[_loc12_] = this.batches;
                  }
               }
               else
               {
                  _loc13_ = param2.getDefinition(_loc12_) as Class;
                  _loc12_ = this.writeBlitData(param3,_loc13_,_loc12_,param1,param5);
               }
            }
            this._className = _loc12_;
            this._m = param1.transform.matrix;
            this._colorTransform = param1.transform.colorTransform;
            this.blendMode = param1.blendMode;
            if(this.children == null && this.batches == null)
            {
               this.m.scale(param5,param5);
               this._isRoof = true;
            }
            else
            {
               this.m.tx *= param5;
               this.m.ty *= param5;
               this._isRoof = false;
            }
         }
      }
      
      public function get className() : String
      {
         return this._className;
      }
      
      public function set className(param1:String) : void
      {
         this._className = param1;
      }
      
      public function get m() : Matrix
      {
         return this._m;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this._colorTransform;
      }
      
      public function get colorTransformString() : String
      {
         if(this._colorTransformString == null)
         {
            this._colorTransformString = this.colorTransform.toString();
         }
         return this._colorTransformString;
      }
      
      public function get isRoof() : Boolean
      {
         return this._isRoof;
      }
      
      private function writeBlitData(param1:Array, param2:*, param3:String, param4:DisplayObject, param5:Number, param6:Boolean = false) : String
      {
         var _loc7_:BlitData = null;
         var _loc8_:ColorTransform = param4.transform.colorTransform;
         var _loc9_:* = !ColorUtil.IsColorTransformDefault(_loc8_,true);
         if(!this.useRealTimeRenderColorTransformAndFilters && (_loc9_ || param4.filters.length > 0))
         {
            if(_loc9_)
            {
               param3 = param3 + "_" + _loc8_;
            }
            if(param4.filters.length > 0)
            {
               param3 = param3 + "_" + Blit.GetFiltersDesc(param4.filters);
            }
            if(param1[param3] == null)
            {
               (_loc7_ = BlitDataManager.GetBlitDataByObject(param4,1,NaN,param5,!!param6 ? null : _loc8_)).name = param3;
               param1[param3] = _loc7_;
            }
            else
            {
               _loc7_ = param1[param3];
            }
         }
         else if(param1[param3] == null)
         {
            (_loc7_ = BlitDataManager.GetBlitDataByClass(param2,65535,NaN,param5)).name = param3;
            param1[param3] = _loc7_;
         }
         else
         {
            _loc7_ = param1[param3];
         }
         if(param4.scaleX > _loc7_.outputMaxScaleX || _loc7_.outputMaxScaleX == 1 && param4.scaleX < 1)
         {
            _loc7_.outputMaxScaleX = param4.scaleX;
         }
         if(param4.scaleY > _loc7_.outputMaxScaleY || _loc7_.outputMaxScaleY == 1 && param4.scaleY < 1)
         {
            _loc7_.outputMaxScaleY = param4.scaleY;
         }
         return param3;
      }
      
      public function Dispose() : void
      {
         if(this.children)
         {
            while(this.children.length > 0)
            {
               this.children.pop().Dispose();
            }
            this.children = null;
         }
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function getChildrenAtFrame(param1:int) : Vector.<BlitBoneFrameChild>
      {
         var _loc2_:Vector.<BlitBoneFrameChild> = null;
         var _loc3_:BlitBoneFrameBatch = null;
         if(this.children != null)
         {
            _loc2_ = this.children;
         }
         else if(this.batches != null)
         {
            _loc3_ = this.batches[param1 % this.batches.length];
            _loc2_ = _loc3_.children as Vector.<BlitBoneFrameChild>;
         }
         return _loc2_;
      }
      
      public function updateDisplay(param1:IBlitDisplayObject, param2:BlitBoneData, param3:int, param4:Boolean = false, param5:int = 0, param6:BlitBoneVisibleRule = null, param7:BlitBoneDisplayHolder = null) : void
      {
         var _loc8_:IBlitClip = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:IBlitDisplayContainer = null;
         var _loc15_:int = 0;
         var _loc16_:IBlitDisplayContainer = null;
         var _loc17_:BlitFrameData = null;
         if(param1 == null)
         {
            AsguiLogger.Warn(this,"IBlitDisplayObject is NULL");
            return;
         }
         param1.name = this.className;
         var _loc12_:Matrix = param1.transformationMatrix;
         var _loc13_:Matrix = this.m;
         if(_loc12_.tx != _loc13_.tx || _loc12_.ty != _loc13_.ty || _loc12_.a != _loc13_.a || _loc12_.b != _loc13_.b || _loc12_.c != _loc13_.c || _loc12_.d != _loc13_.d)
         {
            param1.transformationMatrix = _loc13_;
         }
         var _loc14_:String = "";
         if(this.colorTransform)
         {
            if(this.hasColorTransformChanged)
            {
               if(this.useRealTimeRenderColorTransformAndFilters)
               {
                  param1.colorTransform = this.colorTransform;
               }
            }
            if(param1.alpha != this.colorTransform.alphaMultiplier)
            {
               param1.alpha = this.colorTransform.alphaMultiplier;
            }
         }
         if(param6 != null)
         {
            if((_loc15_ = param6.getBoneVisibleRule(this.className)) != -1)
            {
               param1.visible = _loc15_ > 0;
            }
            else
            {
               param1.visible = true;
            }
         }
         if(!param4 && param1 is IBlitDisplayContainer)
         {
            _loc16_ = param1 as IBlitDisplayContainer;
            if(this.batches != null)
            {
               this.batches[param3 % this.batches.length].updateDisplay(_loc16_,param2,param3,param4,param5,param6,param7);
            }
            else if(this.children != null && this.children.length > 0)
            {
               _loc10_ = this.children.length;
               if(_loc16_.numChildren < _loc10_)
               {
                  _loc9_ = 0;
                  while(_loc9_ < _loc10_)
                  {
                     _loc11_ = BlitBoneManager.impl.getBlitFactory(param5).CreateBlitContainer({"smoothing":true});
                     _loc16_.AddChild(_loc11_);
                     _loc9_++;
                  }
               }
               _loc9_ = 0;
               while(_loc9_ < _loc10_)
               {
                  (this.children[_loc9_] as BlitBoneFrameChild).updateDisplay(_loc16_.GetChildAt(_loc9_),param2,param3,param4,param5,param6,param7);
                  _loc9_++;
               }
            }
            else
            {
               if(_loc16_.numChildren == 0)
               {
                  if(param2.version < 3)
                  {
                     _loc8_ = BlitBoneManager.impl.getBlitFactory(param5).CreateBlitClip({"smoothing":true});
                  }
                  else
                  {
                     _loc8_ = BlitBoneManager.impl.getBlitFactory(param5).CreateBlitClip({
                        "smoothing":true,
                        "mcInit":false
                     });
                  }
                  _loc8_.dataProvider = param2.blits[this.className + _loc14_];
                  _loc8_.autoUpdatePosition = true;
                  _loc16_.AddChild(_loc8_);
                  _loc16_.name = this.className;
                  if((_loc8_ = _loc16_.GetChildAt(0) as IBlitClip).dataProvider == null)
                  {
                     return;
                  }
                  if(_loc8_.dataProvider.totalFrames > 1 && !_loc8_.isPlaying)
                  {
                     _loc8_.Play();
                  }
                  else
                  {
                     _loc8_.Render();
                  }
               }
               if(param2.version >= 3)
               {
                  if((_loc8_ = _loc16_.GetChildAt(0) as IBlitClip) != null && _loc8_.dataProvider != null)
                  {
                     if(_loc8_.dataProvider.name != this.className + _loc14_)
                     {
                        if(param2.blits[this.className + _loc14_] == null)
                        {
                           AsguiLogger.Warn(this,"updateDisplay failed : " + this.className + _loc14_);
                           return;
                        }
                        _loc8_.dataProvider = param2.blits[this.className + _loc14_];
                     }
                     if((_loc17_ = _loc8_.dataProvider.GetFrame(_loc8_.currentFrame)).scaleX != _loc8_.scaleX)
                     {
                        _loc8_.scaleX = _loc17_.scaleX;
                     }
                     if(_loc17_.scaleY != _loc8_.scaleY)
                     {
                        _loc8_.scaleY = _loc17_.scaleY;
                     }
                  }
               }
            }
         }
      }
      
      public function addFlattenedDisplays(param1:IBlitDisplayContainer, param2:BlitBoneData, param3:int, param4:BlitBoneVisibleRule, param5:Array, param6:int = 0, param7:BlitBoneDisplayHolder = null, param8:BlitBoneDataOuterBindRule = null) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:IBlitClip = null;
         var _loc12_:BlitBoneFrameChild = null;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc15_:BlitFrameData = null;
         var _loc16_:Matrix = null;
         var _loc17_:BlitBoneFrameChild = null;
         tmpMatrix.identity();
         tmpColorTransform = BlitBoneFlattenedDisplaysPool.instance.getColorTransform();
         if(param5.length != 0)
         {
            param5 = param5.concat(this);
         }
         else
         {
            param5.push(this);
         }
         if(!param8 || !param8.CheckChildAddFlattenedDisplays(this,param1,param2,param3,param4,param5,param6,param7))
         {
            if(this.batches != null)
            {
               this.batches[param3 % this.batches.length].addFlattenedDisplays(param1,param2,param3,param4,param5,param6,param7);
            }
            else if(this.children != null && this.children.length > 0)
            {
               _loc10_ = this.children.length;
               _loc9_ = 0;
               while(_loc9_ < _loc10_)
               {
                  (_loc12_ = this.children[_loc9_]).addFlattenedDisplays(param1,param2,param3,param4,param5,param6,param7,param8);
                  _loc9_++;
               }
            }
            else
            {
               _loc13_ = "";
               if(param7)
               {
                  _loc11_ = param7.getEmptyClip(this.className + _loc13_,param2,false);
               }
               else
               {
                  _loc11_ = BlitBoneFlattenedDisplaysPool.instance.getBlitClip(param6,this.className + _loc13_,param2);
               }
               _loc14_ = -1;
               if(_loc11_.dataProvider == null)
               {
                  return;
               }
               _loc15_ = _loc11_.dataProvider.GetFrame(_loc11_.currentFrame);
               tmpMatrix.scale(_loc15_.scaleX,_loc15_.scaleY);
               tmpMatrix.translate(_loc15_.x,_loc15_.y);
               _loc9_ = (_loc10_ = param5.length) - 1;
               while(_loc9_ >= 0)
               {
                  _loc17_ = param5[_loc9_];
                  tmpMatrix.concat(_loc17_.m);
                  tmpColorTransform.concat(_loc17_.colorTransform);
                  if(_loc14_ == -1 && param4)
                  {
                     _loc14_ = param4.getBoneVisibleRule(_loc17_.className);
                  }
                  _loc9_--;
               }
               _loc11_.visible = _loc14_ != 0;
               if((_loc16_ = _loc11_.transformationMatrix).tx != tmpMatrix.tx || _loc16_.ty != tmpMatrix.ty || _loc16_.a != tmpMatrix.a || _loc16_.b != tmpMatrix.b || _loc16_.c != tmpMatrix.c || _loc16_.d != tmpMatrix.d)
               {
                  _loc11_.transformationMatrix = tmpMatrix;
               }
               if(_loc11_.alpha != tmpColorTransform.alphaMultiplier)
               {
                  _loc11_.alpha = tmpColorTransform.alphaMultiplier;
               }
               if(this.useRealTimeRenderColorTransformAndFilters)
               {
                  _loc11_.colorTransform = tmpColorTransform;
               }
               if(_loc11_.visible)
               {
                  param1.AddChild(_loc11_);
               }
            }
         }
      }
      
      public function createShapeDisplay(param1:BlitBoneData, param2:int, param3:BlitBoneVisibleRule = null, param4:BlitBoneDataOuterBindRule = null) : DisplayObject
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Shape = null;
         var _loc11_:String = null;
         var _loc12_:BlitData = null;
         var _loc13_:BlitFrameData = null;
         var _loc14_:BitmapData = null;
         var _loc15_:Matrix = null;
         var _loc5_:Sprite = new Sprite();
         if(param3 != null)
         {
            if((_loc7_ = param3.getBoneVisibleRule(this.className)) != -1)
            {
               _loc5_.visible = _loc7_ > 0;
            }
         }
         var _loc6_:Boolean = false;
         if(!param4 || !param4.CheckChildCreateShapeDisplay(this,_loc5_,param1,param2,param3))
         {
            if(this.batches != null)
            {
               _loc6_ = true;
               this.batches[param2 % this.batches.length].createShapeDisplay(_loc5_,param1,param2,param3);
            }
            else if(this.children != null && this.children.length > 0)
            {
               _loc6_ = true;
               _loc9_ = this.children.length;
               _loc8_ = 0;
               while(_loc8_ < _loc9_)
               {
                  _loc5_.addChild((this.children[_loc8_] as BlitBoneFrameChild).createShapeDisplay(param1,param2,param3));
                  _loc8_++;
               }
            }
            else
            {
               _loc10_ = new Shape();
               _loc11_ = "";
               if(this.colorTransform)
               {
                  _loc10_.transform.colorTransform = this.colorTransform;
               }
               if((_loc12_ = param1.blits[this.className + _loc11_]) == null)
               {
                  AsguiLogger.Warn(this,"createShapeDisplay failed : " + this.className + _loc11_);
                  return _loc5_;
               }
               _loc14_ = (_loc13_ = _loc12_.GetFrame(0)).getBitmapData();
               _loc15_ = new Matrix();
               _loc10_.graphics.beginBitmapFill(_loc14_,_loc15_,false,true);
               _loc10_.graphics.drawRect(_loc15_.tx,_loc15_.ty,_loc14_.width * 1,_loc14_.height * 1);
               _loc15_.identity();
               _loc15_.scale(_loc13_.scaleX,_loc13_.scaleY);
               _loc15_.translate(_loc13_.x,_loc13_.y);
               _loc15_.concat(this.m);
               _loc10_.transform.matrix = _loc15_;
               _loc5_.addChild(_loc10_);
            }
         }
         else
         {
            _loc6_ = true;
         }
         if(_loc6_)
         {
            _loc5_.transform.matrix = this.m;
            if(this.colorTransform)
            {
               if(this.useRealTimeRenderColorTransformAndFilters)
               {
                  _loc5_.transform.colorTransform = this.colorTransform;
               }
            }
         }
         return _loc5_;
      }
      
      public function upgradeByBlitBoneDataOuterBindRule(param1:BlitBoneDataOuterBindRule) : void
      {
      }
      
      public function loadBytes(param1:ByteArray, param2:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.readShort();
         this._className = param1.readUTF();
         if(!this._m)
         {
            this._m = new Matrix();
         }
         if(_loc5_ & TYPE_HAS_XY)
         {
            this.m.translate(param1.readFloat(),param1.readFloat());
         }
         if(_loc5_ & TYPE_HAS_M_A)
         {
            this.m.a = param1.readFloat();
         }
         if(_loc5_ & TYPE_HAS_M_B)
         {
            this.m.b = param1.readFloat();
         }
         if(_loc5_ & TYPE_HAS_M_C)
         {
            this.m.c = param1.readFloat();
         }
         if(_loc5_ & TYPE_HAS_M_D)
         {
            this.m.d = param1.readFloat();
         }
         if(_loc5_ & TYPE_HAS_ALPHA)
         {
            if(!this._colorTransform)
            {
               this._colorTransform = new ColorTransform();
            }
            this._colorTransform.alphaMultiplier = param1.readFloat();
         }
         if(_loc5_ & TYPE_HAS_COLORTRANSFORM)
         {
            this._colorTransform = ObjectUtil.ReadColorTransform(param1);
            this.hasColorTransformChanged = true;
         }
         else
         {
            this.hasColorTransformChanged = false;
         }
         if(_loc5_ & TYPE_HAS_BLENDMODE)
         {
            this.blendMode = param1.readUTF();
         }
         if(_loc5_ & TYPE_HAS_CHILDREN)
         {
            _loc4_ = param1.readShort();
            this.children = new Vector.<BlitBoneFrameChild>(_loc4_);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               this.children[_loc3_] = new BlitBoneFrameChild();
               this.children[_loc3_].loadBytes(param1,param2);
               _loc3_++;
            }
         }
         if(_loc5_ & TYPE_HAS_BATCHES)
         {
            if(param2[this.className] == null)
            {
               param2[this.className] = new Vector.<BlitBoneFrameBatch>();
            }
            this.batches = param2[this.className];
         }
         if(this._colorTransform == null)
         {
            this._colorTransform = new ColorTransform();
         }
         if(this.blendMode == null)
         {
            this.blendMode = BlendMode.NORMAL;
         }
         if(this.children == null && this.batches == null)
         {
            this._isRoof = true;
         }
         else
         {
            this._isRoof = false;
         }
      }
      
      public function writeBytes(param1:ByteArray, param2:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = ColorUtil.IsColorTransformDefault(this.colorTransform,true);
         var _loc5_:* = TYPE_HAS_XY | (this.m.a != 1 ? TYPE_HAS_M_A : 0) | (this.m.b != 0 ? TYPE_HAS_M_B : 0) | (this.m.c != 0 ? TYPE_HAS_M_C : 0) | (this.m.d != 1 ? TYPE_HAS_M_D : 0) | (!_loc4_ ? TYPE_HAS_COLORTRANSFORM : (this.colorTransform && this.colorTransform.alphaMultiplier != 1 ? TYPE_HAS_ALPHA : 0)) | (this.blendMode != BlendMode.NORMAL ? TYPE_HAS_BLENDMODE : 0) | (this.children != null && this.children.length > 0 ? TYPE_HAS_CHILDREN : 0) | (this.batches != null && this.batches.length > 0 ? TYPE_HAS_BATCHES : 0);
         param1.writeShort(_loc5_);
         param1.writeUTF(this.className);
         if(_loc5_ & TYPE_HAS_XY)
         {
            param1.writeFloat(this.m.tx);
            param1.writeFloat(this.m.ty);
         }
         if(_loc5_ & TYPE_HAS_M_A)
         {
            param1.writeFloat(this.m.a);
         }
         if(_loc5_ & TYPE_HAS_M_B)
         {
            param1.writeFloat(this.m.b);
         }
         if(_loc5_ & TYPE_HAS_M_C)
         {
            param1.writeFloat(this.m.c);
         }
         if(_loc5_ & TYPE_HAS_M_D)
         {
            param1.writeFloat(this.m.d);
         }
         if(_loc5_ & TYPE_HAS_ALPHA)
         {
            param1.writeFloat(this.colorTransform.alphaMultiplier);
         }
         if(_loc5_ & TYPE_HAS_COLORTRANSFORM)
         {
            param1.writeBytes(ObjectUtil.WriteColorTransform(this.colorTransform));
            this.hasColorTransformChanged = true;
         }
         else
         {
            this.hasColorTransformChanged = false;
         }
         if(_loc5_ & TYPE_HAS_BLENDMODE)
         {
            param1.writeUTF(this.blendMode);
         }
         if(_loc5_ & TYPE_HAS_CHILDREN)
         {
            param1.writeShort(this.children.length);
            _loc3_ = 0;
            while(_loc3_ < this.children.length)
            {
               this.children[_loc3_].writeBytes(param1,param2);
               _loc3_++;
            }
         }
         if(_loc5_ & TYPE_HAS_BATCHES)
         {
            if(!param2[this.className])
            {
               param2[this.className] = this.batches;
            }
         }
      }
      
      public function toString() : String
      {
         return "(BlitBoneFrameChild [className:" + this.className + "])";
      }
      
      public function toStatistic() : Statistic
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Statistic = new Statistic("BlitBoneFrameChild",this.className);
         if(this.batches != null)
         {
            _loc3_ = this.batches.length;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc1_.Add(this.batches[_loc2_].toStatistic());
               _loc2_++;
            }
         }
         else if(this.children != null)
         {
            _loc3_ = this.children.length;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc1_.Add(this.children[_loc2_].toStatistic());
               _loc2_++;
            }
         }
         return _loc1_;
      }
   }
}
