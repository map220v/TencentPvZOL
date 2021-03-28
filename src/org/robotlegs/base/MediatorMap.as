package org.robotlegs.base
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IMediator;
   import org.robotlegs.core.IMediatorMap;
   import org.robotlegs.core.IReflector;
   
   public class MediatorMap extends ViewMapBase implements IMediatorMap
   {
      
      protected static const enterFrameDispatcher:Sprite = new Sprite();
       
      
      protected var mediatorByView:Dictionary;
      
      protected var mappingConfigByView:Dictionary;
      
      protected var mappingConfigByViewClassName:Dictionary;
      
      protected var mediatorsMarkedForRemoval:Dictionary;
      
      protected var hasMediatorsMarkedForRemoval:Boolean;
      
      protected var reflector:IReflector;
      
      public function MediatorMap(param1:DisplayObjectContainer, param2:IInjector, param3:IReflector)
      {
         super(param1,param2);
         this.reflector = param3;
         this.mediatorByView = new Dictionary(true);
         this.mappingConfigByView = new Dictionary(true);
         this.mappingConfigByViewClassName = new Dictionary(false);
         this.mediatorsMarkedForRemoval = new Dictionary(false);
      }
      
      public function mapView(param1:*, param2:Class, param3:* = null, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc6_:String = this.reflector.getFQCN(param1);
         if(this.mappingConfigByViewClassName[_loc6_] != null)
         {
            throw new ContextError(ContextError.E_MEDIATORMAP_OVR + " - " + param2);
         }
         if(this.reflector.classExtendsOrImplements(param2,IMediator) == false)
         {
            throw new ContextError(ContextError.E_MEDIATORMAP_NOIMPL + " - " + param2);
         }
         var _loc7_:MappingConfig;
         (_loc7_ = new MappingConfig()).mediatorClass = param2;
         _loc7_.autoCreate = param4;
         _loc7_.autoRemove = param5;
         if(param3)
         {
            if(param3 is Array)
            {
               _loc7_.typedViewClasses = (param3 as Array).concat();
            }
            else if(param3 is Class)
            {
               _loc7_.typedViewClasses = [param3];
            }
         }
         else if(param1 is Class)
         {
            _loc7_.typedViewClasses = [param1];
         }
         this.mappingConfigByViewClassName[_loc6_] = _loc7_;
         if(param4 || param5)
         {
            ++viewListenerCount;
            if(viewListenerCount == 1)
            {
               this.addListeners();
            }
         }
         if(param4 && contextView && _loc6_ == getQualifiedClassName(contextView))
         {
            this.createMediatorUsing(contextView,_loc6_,_loc7_);
         }
      }
      
      public function unmapView(param1:*) : void
      {
         var _loc2_:String = this.reflector.getFQCN(param1);
         var _loc3_:MappingConfig = this.mappingConfigByViewClassName[_loc2_];
         if(_loc3_ && (_loc3_.autoCreate || _loc3_.autoRemove))
         {
            --viewListenerCount;
            if(viewListenerCount == 0)
            {
               this.removeListeners();
            }
         }
         this.mappingConfigByViewClassName[_loc2_] = null;
      }
      
      public function createMediator(param1:Object) : IMediator
      {
         return this.createMediatorUsing(param1);
      }
      
      public function registerMediator(param1:Object, param2:IMediator) : void
      {
         var _loc3_:Class = this.reflector.getClass(param2);
         injector.hasMapping(_loc3_) && injector.unmap(_loc3_);
         injector.mapValue(_loc3_,param2);
         this.mediatorByView[param1] = param2;
         this.mappingConfigByView[param1] = this.mappingConfigByViewClassName[getQualifiedClassName(param1)];
         param2.setViewComponent(param1);
         param2.preRegister();
      }
      
      public function removeMediator(param1:IMediator) : IMediator
      {
         var _loc2_:Object = null;
         var _loc3_:Class = null;
         if(param1)
         {
            _loc2_ = param1.getViewComponent();
            _loc3_ = this.reflector.getClass(param1);
            delete this.mediatorByView[_loc2_];
            delete this.mappingConfigByView[_loc2_];
            param1.preRemove();
            param1.setViewComponent(null);
            injector.hasMapping(_loc3_) && injector.unmap(_loc3_);
         }
         return param1;
      }
      
      public function removeMediatorByView(param1:Object) : IMediator
      {
         return this.removeMediator(this.retrieveMediator(param1));
      }
      
      public function retrieveMediator(param1:Object) : IMediator
      {
         return this.mediatorByView[param1];
      }
      
      public function hasMapping(param1:*) : Boolean
      {
         var _loc2_:String = this.reflector.getFQCN(param1);
         return this.mappingConfigByViewClassName[_loc2_] != null;
      }
      
      public function hasMediatorForView(param1:Object) : Boolean
      {
         return this.mediatorByView[param1] != null;
      }
      
      public function hasMediator(param1:IMediator) : Boolean
      {
         var _loc2_:IMediator = null;
         for each(_loc2_ in this.mediatorByView)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      override protected function addListeners() : void
      {
         if(contextView && enabled)
         {
            contextView.addEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture,0,true);
            contextView.addEventListener(Event.REMOVED_FROM_STAGE,this.onViewRemoved,useCapture,0,true);
         }
      }
      
      override protected function removeListeners() : void
      {
         if(contextView)
         {
            contextView.removeEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture);
            contextView.removeEventListener(Event.REMOVED_FROM_STAGE,this.onViewRemoved,useCapture);
         }
      }
      
      override protected function onViewAdded(param1:Event) : void
      {
         if(this.mediatorsMarkedForRemoval[param1.target])
         {
            delete this.mediatorsMarkedForRemoval[param1.target];
            return;
         }
         var _loc2_:String = getQualifiedClassName(param1.target);
         var _loc3_:MappingConfig = this.mappingConfigByViewClassName[_loc2_];
         if(_loc3_ && _loc3_.autoCreate)
         {
            this.createMediatorUsing(param1.target,_loc2_,_loc3_);
         }
      }
      
      protected function createMediatorUsing(param1:Object, param2:String = "", param3:MappingConfig = null) : IMediator
      {
         var _loc5_:Class = null;
         var _loc6_:Class = null;
         var _loc4_:IMediator;
         if((_loc4_ = this.mediatorByView[param1]) == null)
         {
            param2 = param2 || getQualifiedClassName(param1);
            param3 = param3 || this.mappingConfigByViewClassName[param2];
            if(param3)
            {
               for each(_loc5_ in param3.typedViewClasses)
               {
                  injector.mapValue(_loc5_,param1);
               }
               _loc4_ = injector.instantiate(param3.mediatorClass);
               for each(_loc6_ in param3.typedViewClasses)
               {
                  injector.unmap(_loc6_);
               }
               this.registerMediator(param1,_loc4_);
            }
         }
         return _loc4_;
      }
      
      protected function onViewRemoved(param1:Event) : void
      {
         var _loc2_:MappingConfig = this.mappingConfigByView[param1.target];
         if(_loc2_ && _loc2_.autoRemove)
         {
            this.mediatorsMarkedForRemoval[param1.target] = param1.target;
            if(!this.hasMediatorsMarkedForRemoval)
            {
               this.hasMediatorsMarkedForRemoval = true;
               enterFrameDispatcher.addEventListener(Event.ENTER_FRAME,this.removeMediatorLater);
            }
         }
      }
      
      protected function removeMediatorLater(param1:Event) : void
      {
         var _loc2_:DisplayObject = null;
         enterFrameDispatcher.removeEventListener(Event.ENTER_FRAME,this.removeMediatorLater);
         for each(_loc2_ in this.mediatorsMarkedForRemoval)
         {
            if(!_loc2_.stage)
            {
               this.removeMediatorByView(_loc2_);
            }
            delete this.mediatorsMarkedForRemoval[_loc2_];
         }
         this.hasMediatorsMarkedForRemoval = false;
      }
   }
}

class MappingConfig
{
    
   
   public var mediatorClass:Class;
   
   public var typedViewClasses:Array;
   
   public var autoCreate:Boolean;
   
   public var autoRemove:Boolean;
   
   function MappingConfig()
   {
      super();
   }
}
