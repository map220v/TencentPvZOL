package asgui.core
{
   import asgui.logger.AsguiLogger;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class UILayoutManager extends Sprite
   {
      
      public static var traceChildrenNum:Boolean = false;
      
      public static var decodeFrameCostMax:int = 20;
       
      
      private var invalidatedSkinList:Array;
      
      private var invalidateSizeList:Array;
      
      private var invalidateDisplayListList1:Array;
      
      private var invalidateDisplayListList2:Array;
      
      private var lastValidateDisplayListFrame:uint;
      
      var invalidatePropertiesList:Array;
      
      var delayFuncCallOnceList:Dictionary;
      
      private var validateCounter:uint;
      
      private var frameUpdateList:Array;
      
      public function UILayoutManager()
      {
         this.invalidatedSkinList = [];
         this.invalidateSizeList = [];
         this.invalidateDisplayListList1 = [];
         this.invalidateDisplayListList2 = [];
         this.invalidatePropertiesList = [];
         this.delayFuncCallOnceList = new Dictionary();
         this.frameUpdateList = [];
         super();
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      public function InvalidateSkin(param1:IValidatableComponent) : void
      {
         this.invalidatedSkinList.push(param1);
      }
      
      public function InvalidateSize(param1:IValidatableComponent) : void
      {
         this.invalidateSizeList.push(param1);
      }
      
      function get thisInvalidateDisplayListList() : Array
      {
         return this.validateCounter % 2 == 0 ? this.invalidateDisplayListList1 : this.invalidateDisplayListList2;
      }
      
      function get nextInvalidateDisplayListList() : Array
      {
         return this.validateCounter % 2 == 1 ? this.invalidateDisplayListList1 : this.invalidateDisplayListList2;
      }
      
      public function InvalidateDisplayList(param1:IValidatableComponent) : void
      {
         var _loc2_:Array = this.validateCounter > this.lastValidateDisplayListFrame ? this.thisInvalidateDisplayListList : this.nextInvalidateDisplayListList;
         _loc2_.push(param1);
      }
      
      public function InvalidateProperties(param1:IValidatableComponent) : void
      {
         this.invalidatePropertiesList.push(param1);
      }
      
      public function AdddDelayFuncCallOnce(param1:Function, param2:Array = null) : void
      {
         if(!param2)
         {
            param2 = [];
         }
         this.delayFuncCallOnceList[param1] = param2;
      }
      
      public function ValidateProperties() : void
      {
         var _loc1_:IValidatableComponent = null;
         AsguiLogger.Perf(this,null,1);
         if(traceChildrenNum && this.invalidatePropertiesList.length > 0)
         {
         }
         while(this.invalidatePropertiesList.length > 0)
         {
            _loc1_ = this.invalidatePropertiesList.pop() as IValidatableComponent;
            if(!_loc1_.hasDisposed)
            {
               _loc1_.ValidateProperties();
            }
         }
         AsguiLogger.Perf(this,"ValidateProperties : %0",1);
      }
      
      public function ValidateSize() : void
      {
         var _loc1_:IValidatableComponent = null;
         AsguiLogger.Perf(this,null,2);
         if(traceChildrenNum && this.invalidateSizeList.length > 0)
         {
         }
         while(this.invalidateSizeList.length > 0)
         {
            _loc1_ = this.invalidateSizeList.pop() as IValidatableComponent;
            if(!_loc1_.hasDisposed)
            {
               _loc1_.ValidateSize();
            }
         }
         AsguiLogger.Perf(this,"ValidateSize : %0",2);
      }
      
      public function ValidateSkin() : void
      {
         var _loc1_:IValidatableComponent = null;
         AsguiLogger.Perf(this,null,4);
         if(traceChildrenNum && this.invalidatedSkinList.length > 0)
         {
         }
         while(this.invalidatedSkinList.length > 0)
         {
            _loc1_ = this.invalidatedSkinList.pop() as IValidatableComponent;
            if(!_loc1_.hasDisposed)
            {
               _loc1_.ValidateSkin();
            }
         }
         AsguiLogger.Perf(this,"ValidateSkin : %0",4);
      }
      
      public function ValidateDisplayList() : void
      {
         var _loc1_:IValidatableComponent = null;
         var _loc2_:Array = this.thisInvalidateDisplayListList;
         AsguiLogger.Perf(this,null,3);
         this.CheckInvalidateDisplayListListParent();
         if(traceChildrenNum && _loc2_.length > 0)
         {
         }
         if(_loc2_.length > 0)
         {
            this.lastValidateDisplayListFrame = this.validateCounter;
         }
         while(_loc2_.length > 0)
         {
            _loc1_ = _loc2_.pop() as IValidatableComponent;
            if(!_loc1_.hasDisposed)
            {
               _loc1_.ValidateDisplayList();
            }
         }
         AsguiLogger.Perf(this,"ValidateDisplayList : %0",3);
      }
      
      public function ValidateNow() : void
      {
         this.ValidateProperties();
         this.ValidateSize();
         this.ValidateDisplayList();
         this.ValidateSkin();
         this.UpdateFrameEvents();
         ++this.validateCounter;
         if(this.invalidateSizeList.length > 0)
         {
            this.ValidateNow();
         }
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         var _loc6_:Array = null;
         var _loc2_:int = getTimer();
         this.ValidateNow();
         var _loc3_:int = getTimer();
         for(_loc5_ in this.delayFuncCallOnceList)
         {
            _loc6_ = this.delayFuncCallOnceList[_loc5_];
            _loc5_.apply(this,_loc6_);
            _loc3_ = getTimer();
            delete this.delayFuncCallOnceList[_loc5_];
         }
      }
      
      private function CheckInvalidateDisplayListListParent() : void
      {
         var i:int = 0;
         var j:int = 0;
         var sortOnPrice:Function = null;
         sortOnPrice = function(param1:IValidatableComponent, param2:IValidatableComponent):Number
         {
            var _loc3_:Number = param1.parents;
            var _loc4_:Number = param2.parents;
            if(_loc3_ > _loc4_)
            {
               return 1;
            }
            if(_loc3_ < _loc4_)
            {
               return -1;
            }
            return 0;
         };
         var invalidateDisplayListList:Array = this.thisInvalidateDisplayListList;
         if(invalidateDisplayListList.length == 0)
         {
            return;
         }
         invalidateDisplayListList.sort(sortOnPrice);
      }
      
      public function AddFrameEvent(param1:IFrameUpdatable) : void
      {
         if(this.frameUpdateList.indexOf(param1) == -1)
         {
            this.frameUpdateList.push(param1);
         }
      }
      
      public function UpdateFrameEvents() : void
      {
         var _loc1_:int = 0;
         var _loc2_:IFrameUpdatable = null;
         _loc1_ = 0;
         while(_loc1_ < this.frameUpdateList.length)
         {
            _loc2_ = this.frameUpdateList[_loc1_];
            _loc2_.UpdateFrame();
            if(_loc2_ == null || !_loc2_.isPlaying)
            {
               this.frameUpdateList.splice(_loc1_,1);
               _loc1_--;
            }
            _loc1_++;
         }
      }
   }
}
