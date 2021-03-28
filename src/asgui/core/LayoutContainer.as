package asgui.core
{
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class LayoutContainer extends ContainerSimple
   {
       
      
      public var minWidth:int = 0;
      
      public var minHeight:int = 0;
      
      public var maxWidth:int = 65535;
      
      public var maxHeight:int = 65535;
      
      public var fixHorizontalRate:Boolean = false;
      
      private var _checkSizeDispatchTime:int = 200;
      
      private var checkSizeTimeOut:uint;
      
      public function LayoutContainer()
      {
         super();
         this.absoluteLayout = true;
      }
      
      public function get checkSizeDispatchTime() : int
      {
         return this._checkSizeDispatchTime;
      }
      
      public function set checkSizeDispatchTime(param1:int) : void
      {
         this._checkSizeDispatchTime = param1;
      }
      
      public function get getAbsoluteLayout() : Boolean
      {
         return true;
      }
      
      override public function Dispose() : void
      {
         this.stage.removeEventListener(Event.RESIZE,this.StageResizeHandler);
         super.Dispose();
      }
      
      override protected function OnAddedToStage() : void
      {
         super.OnAddedToStage();
         this.CheckSize();
         this.stage.addEventListener(Event.RESIZE,this.StageResizeHandler);
      }
      
      private function StageResizeHandler(param1:Event) : void
      {
         clearTimeout(this.checkSizeTimeOut);
         if(this.checkSizeDispatchTime > 0)
         {
            this.checkSizeTimeOut = setTimeout(this.CheckSize,this.checkSizeDispatchTime);
         }
         else
         {
            this.CheckSize();
         }
      }
      
      public function CheckSize() : void
      {
         clearTimeout(this.checkSizeTimeOut);
         var _loc1_:int = this.stage.stageWidth;
         var _loc2_:int = this.stage.stageHeight;
         if(_loc1_ < this.minWidth)
         {
            _loc1_ = this.minWidth;
         }
         else if(_loc1_ > this.maxWidth)
         {
            _loc1_ = this.maxWidth;
         }
         if(_loc2_ < this.minHeight)
         {
            _loc2_ = this.minHeight;
         }
         else if(_loc2_ > this.maxHeight)
         {
            _loc2_ = this.maxHeight;
         }
         if(this.fixHorizontalRate && _loc1_ < _loc2_ * this.minWidth / this.minHeight)
         {
            _loc1_ = _loc2_ * this.minWidth / this.minHeight;
         }
         _loc1_ = 2 * int(_loc1_ / 2);
         _loc2_ = 2 * int(_loc2_ / 2);
         this.width = _loc1_;
         this.height = _loc2_;
         this.dispatchEvent(new Event(Event.RESIZE));
      }
   }
}
