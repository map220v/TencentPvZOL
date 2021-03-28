package asgui.core
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class ContainerSimple extends LayoutUIComponent
   {
       
      
      protected var absoluteLayout:Boolean;
      
      private var _label:String = "";
      
      public function ContainerSimple()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.AddedHandler,false,0,true);
      }
      
      override public function Dispose() : void
      {
         disposing = true;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.AddedHandler);
         if(hasDisposed)
         {
            return;
         }
         while(this.numChildren > 0)
         {
            if(this.getChildAt(0) is IDisposable)
            {
               (this.getChildAt(0) as IDisposable).Dispose();
            }
            this.removeChildAt(0);
         }
         super.Dispose();
      }
      
      private function AddedHandler(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.AddedHandler);
         this.OnAddedToStage();
      }
      
      protected function OnAddedToStage() : void
      {
         initialized = true;
         this.InvalidateDisplayList();
         InvalidateSize();
         InvalidateSkin();
         InvalidateProperties();
         InvalidateLayout();
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         return this.addChildAt(param1,numChildren);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         InvalidateLayout();
         this.InvalidateDisplayList();
         return super.addChildAt(param1,param2);
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         this.InvalidateDisplayList();
         super.setChildIndex(param1,param2);
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         this.InvalidateDisplayList();
         super.swapChildren(param1,param2);
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         this.InvalidateDisplayList();
         super.swapChildrenAt(param1,param2);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         return this.removeChild(getChildAt(param1));
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         this.InvalidateDisplayList();
         return super.removeChild(param1);
      }
      
      override public function InvalidateDisplayList(param1:Object = null) : void
      {
         if(!invalidateDisplayListFlag && initialized)
         {
            if(this.absoluteLayout)
            {
               invalidateDisplayListFlag = true;
               UIComponentGlobals.layoutManager.InvalidateDisplayList(this);
            }
            else
            {
               super.InvalidateDisplayList();
            }
         }
      }
      
      override public function ValidateDisplayList() : void
      {
         if(invalidateDisplayListFlag)
         {
            this.UpdateChildrenLayout();
         }
         super.ValidateDisplayList();
      }
      
      private function UpdateChildrenLayout() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ILayoutComponent = null;
         if(this.absoluteLayout)
         {
            _loc1_ = 0;
            while(_loc1_ < numChildren)
            {
               if(getChildAt(_loc1_) is ILayoutComponent)
               {
                  _loc2_ = getChildAt(_loc1_) as ILayoutComponent;
                  if(!_loc2_.hasDisposed)
                  {
                     _loc2_.ValidateLayout(this.width,this.height);
                  }
               }
               _loc1_++;
            }
         }
      }
   }
}
