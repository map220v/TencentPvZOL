package org.robotlegs.base
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IViewMap;
   
   public class ViewMap extends ViewMapBase implements IViewMap
   {
       
      
      protected var mappedPackages:Array;
      
      protected var mappedTypes:Dictionary;
      
      protected var injectedViews:Dictionary;
      
      public function ViewMap(param1:DisplayObjectContainer, param2:IInjector)
      {
         super(param1,param2);
         this.mappedPackages = new Array();
         this.mappedTypes = new Dictionary(false);
         this.injectedViews = new Dictionary(true);
      }
      
      public function mapPackage(param1:String) : void
      {
         if(this.mappedPackages.indexOf(param1) == -1)
         {
            this.mappedPackages.push(param1);
            ++viewListenerCount;
            if(viewListenerCount == 1)
            {
               this.addListeners();
            }
         }
      }
      
      public function unmapPackage(param1:String) : void
      {
         var _loc2_:int = this.mappedPackages.indexOf(param1);
         if(_loc2_ > -1)
         {
            this.mappedPackages.splice(_loc2_,1);
            --viewListenerCount;
            if(viewListenerCount == 0)
            {
               this.removeListeners();
            }
         }
      }
      
      public function mapType(param1:Class) : void
      {
         if(this.mappedTypes[param1])
         {
            return;
         }
         this.mappedTypes[param1] = param1;
         ++viewListenerCount;
         if(viewListenerCount == 1)
         {
            this.addListeners();
         }
         if(contextView && contextView is param1)
         {
            this.injectInto(contextView);
         }
      }
      
      public function unmapType(param1:Class) : void
      {
         var _loc2_:Class = this.mappedTypes[param1];
         delete this.mappedTypes[param1];
         if(_loc2_)
         {
            --viewListenerCount;
            if(viewListenerCount == 0)
            {
               this.removeListeners();
            }
         }
      }
      
      public function hasType(param1:Class) : Boolean
      {
         return this.mappedTypes[param1] != null;
      }
      
      public function hasPackage(param1:String) : Boolean
      {
         return this.mappedPackages.indexOf(param1) > -1;
      }
      
      override protected function addListeners() : void
      {
         if(contextView && enabled)
         {
            contextView.addEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture,0,true);
         }
      }
      
      override protected function removeListeners() : void
      {
         if(contextView)
         {
            contextView.removeEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture);
         }
      }
      
      override protected function onViewAdded(param1:Event) : void
      {
         var _loc3_:Class = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         if(this.injectedViews[_loc2_])
         {
            return;
         }
         for each(_loc3_ in this.mappedTypes)
         {
            if(_loc2_ is _loc3_)
            {
               this.injectInto(_loc2_);
               return;
            }
         }
         if((_loc4_ = this.mappedPackages.length) > 0)
         {
            _loc5_ = getQualifiedClassName(_loc2_);
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc7_ = this.mappedPackages[_loc6_];
               if(_loc5_.indexOf(_loc7_) == 0)
               {
                  this.injectInto(_loc2_);
                  return;
               }
               _loc6_++;
            }
         }
      }
      
      protected function injectInto(param1:DisplayObject) : void
      {
         injector.injectInto(param1);
         this.injectedViews[param1] = true;
      }
   }
}
