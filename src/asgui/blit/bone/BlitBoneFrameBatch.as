package asgui.blit.bone
{
   import asgui.blit.bone.rules.BlitBoneDataOuterBindRule;
   import asgui.blit.bone.rules.BlitBoneVisibleRule;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.IDisposable;
   import asgui.logger.Statistic;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   
   public class BlitBoneFrameBatch implements IDisposable
   {
       
      
      public var children:Vector.<BlitBoneFrameChild>;
      
      private var _hasDisposed:Boolean;
      
      private var type:int;
      
      public function BlitBoneFrameBatch(param1:MovieClip = null, param2:ApplicationDomain = null, param3:Array = null, param4:Array = null, param5:Number = 1, param6:BlitBoneDataOuterBindRule = null)
      {
         var _loc7_:int = 0;
         var _loc8_:DisplayObject = null;
         this.children = new Vector.<BlitBoneFrameChild>();
         super();
         if(param1)
         {
            _loc7_ = 0;
            while(_loc7_ < param1.numChildren)
            {
               if((_loc8_ = param1.getChildAt(_loc7_)) != null)
               {
                  this.addDisplayObject(_loc8_,param2,param3,param4,param5,param6);
               }
               _loc7_++;
            }
         }
      }
      
      public function Dispose() : void
      {
         while(this.children.length > 0)
         {
            this.children.pop().Dispose();
         }
         this.children = null;
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function addDisplayObject(param1:DisplayObject, param2:ApplicationDomain, param3:Array, param4:Array, param5:Number = 1, param6:BlitBoneDataOuterBindRule = null) : void
      {
         var _loc7_:BlitBoneFrameChild = new BlitBoneFrameChild(param1,param2,param3,param4,param5,param6);
         this.children.push(_loc7_);
      }
      
      public function getChildByName(param1:String) : BlitBoneFrameChild
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.children.length)
         {
            if(this.children[_loc2_].className == param1)
            {
               return this.children[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function loadBytes(param1:ByteArray, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BlitBoneFrameChild = null;
         var _loc3_:int = param1.readInt();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new BlitBoneFrameChild()).loadBytes(param1,param2);
            this.children[_loc4_] = _loc5_;
            _loc4_++;
         }
      }
      
      public function writeBytes(param1:ByteArray, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc5_:BlitBoneFrameChild = null;
         var _loc4_:int = this.children.length;
         param1.writeInt(_loc4_);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            (_loc5_ = this.children[_loc3_]).writeBytes(param1,param2);
            _loc3_++;
         }
      }
      
      public function addFlattenedDisplays(param1:IBlitDisplayContainer, param2:BlitBoneData, param3:int, param4:BlitBoneVisibleRule, param5:Array, param6:int = 0, param7:BlitBoneDisplayHolder = null, param8:BlitBoneDataOuterBindRule = null) : void
      {
         var _loc9_:int = 0;
         var _loc11_:BlitBoneFrameChild = null;
         var _loc10_:int = this.children.length;
         _loc9_ = 0;
         while(_loc9_ < _loc10_)
         {
            (_loc11_ = this.children[_loc9_]).addFlattenedDisplays(param1,param2,param3,param4,param5,param6,param7,param8);
            _loc9_++;
         }
      }
      
      public function createShapeDisplay(param1:Sprite, param2:BlitBoneData, param3:int, param4:BlitBoneVisibleRule = null) : void
      {
         var _loc5_:int = 0;
         var _loc7_:BlitBoneFrameChild = null;
         var _loc6_:int = this.children.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = this.children[_loc5_];
            param1.addChild(_loc7_.createShapeDisplay(param2,param3,param4));
            _loc5_++;
         }
      }
      
      public function updateDisplay(param1:IBlitDisplayContainer, param2:BlitBoneData, param3:int, param4:Boolean = false, param5:int = 0, param6:BlitBoneVisibleRule = null, param7:BlitBoneDisplayHolder = null) : void
      {
         var _loc8_:int = 0;
         var _loc10_:BlitBoneFrameChild = null;
         var _loc11_:IBlitDisplayContainer = null;
         var _loc9_:int = this.children.length;
         param1.RemoveAllChildren();
         while(param1.numChildren < _loc9_)
         {
            _loc11_ = BlitBoneManager.impl.getBlitFactory(param5).CreateBlitContainer({"smoothing":true});
            param1.AddChild(_loc11_);
         }
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            this.children[_loc8_].updateDisplay(param1.GetChildAt(_loc8_) as IBlitDisplayContainer,param2,param3,param4,param5,param6,param7);
            _loc8_++;
         }
      }
      
      public function toStatistic() : Statistic
      {
         var _loc2_:int = 0;
         var _loc4_:BlitBoneFrameChild = null;
         var _loc1_:Statistic = new Statistic("BlitBoneFrameBatch","");
         var _loc3_:int = this.children.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.children[_loc2_];
            _loc1_.Add(_loc4_.toStatistic());
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
