package org.swiftsuspenders
{
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.swiftsuspenders.injectionpoints.ConstructorInjectionPoint;
   import org.swiftsuspenders.injectionpoints.InjectionPoint;
   import org.swiftsuspenders.injectionpoints.MethodInjectionPoint;
   import org.swiftsuspenders.injectionpoints.NoParamsConstructorInjectionPoint;
   import org.swiftsuspenders.injectionpoints.PostConstructInjectionPoint;
   import org.swiftsuspenders.injectionpoints.PropertyInjectionPoint;
   import org.swiftsuspenders.injectionresults.InjectClassResult;
   import org.swiftsuspenders.injectionresults.InjectOtherRuleResult;
   import org.swiftsuspenders.injectionresults.InjectSingletonResult;
   import org.swiftsuspenders.injectionresults.InjectValueResult;
   
   public class Injector
   {
      
      private static var INJECTION_POINTS_CACHE:Dictionary = new Dictionary(true);
       
      
      private var m_parentInjector:Injector;
      
      private var m_applicationDomain:ApplicationDomain;
      
      private var m_mappings:Dictionary;
      
      private var m_injecteeDescriptions:Dictionary;
      
      private var m_attendedToInjectees:Dictionary;
      
      private var m_xmlMetadata:XML;
      
      public function Injector(param1:XML = null)
      {
         super();
         this.m_mappings = new Dictionary();
         if(param1 != null)
         {
            this.m_injecteeDescriptions = new Dictionary(true);
         }
         else
         {
            this.m_injecteeDescriptions = INJECTION_POINTS_CACHE;
         }
         this.m_attendedToInjectees = new Dictionary(true);
         this.m_xmlMetadata = param1;
      }
      
      public static function purgeInjectionPointsCache() : void
      {
         INJECTION_POINTS_CACHE = new Dictionary(true);
      }
      
      public function mapValue(param1:Class, param2:Object, param3:String = "") : *
      {
         var _loc4_:InjectionConfig;
         (_loc4_ = this.getMapping(param1,param3)).setResult(new InjectValueResult(param2));
         return _loc4_;
      }
      
      public function mapClass(param1:Class, param2:Class, param3:String = "") : *
      {
         var _loc4_:InjectionConfig;
         (_loc4_ = this.getMapping(param1,param3)).setResult(new InjectClassResult(param2));
         return _loc4_;
      }
      
      public function mapSingleton(param1:Class, param2:String = "") : *
      {
         return this.mapSingletonOf(param1,param1,param2);
      }
      
      public function mapSingletonOf(param1:Class, param2:Class, param3:String = "") : *
      {
         var _loc4_:InjectionConfig;
         (_loc4_ = this.getMapping(param1,param3)).setResult(new InjectSingletonResult(param2));
         return _loc4_;
      }
      
      public function mapRule(param1:Class, param2:*, param3:String = "") : *
      {
         var _loc4_:InjectionConfig;
         (_loc4_ = this.getMapping(param1,param3)).setResult(new InjectOtherRuleResult(param2));
         return param2;
      }
      
      public function getMapping(param1:Class, param2:String = "") : InjectionConfig
      {
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:InjectionConfig;
         if(!(_loc4_ = this.m_mappings[_loc3_ + "#" + param2]))
         {
            _loc4_ = this.m_mappings[_loc3_ + "#" + param2] = new InjectionConfig(param1,param2);
         }
         return _loc4_;
      }
      
      public function injectInto(param1:Object, param2:Boolean = true) : void
      {
         var _loc8_:InjectionPoint = null;
         if(this.m_attendedToInjectees[param1])
         {
            return;
         }
         if(param2)
         {
            this.m_attendedToInjectees[param1] = true;
         }
         var _loc3_:Class = getConstructor(param1);
         var _loc5_:Array;
         var _loc4_:InjecteeDescription;
         var _loc6_:int = (_loc5_ = (_loc4_ = this.m_injecteeDescriptions[_loc3_] || this.getInjectionPoints(_loc3_)).injectionPoints).length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            (_loc8_ = _loc5_[_loc7_]).applyInjection(param1,this);
            _loc7_++;
         }
      }
      
      public function instantiate(param1:Class) : *
      {
         var _loc2_:InjecteeDescription = this.m_injecteeDescriptions[param1];
         if(!_loc2_)
         {
            _loc2_ = this.getInjectionPoints(param1);
         }
         var _loc3_:InjectionPoint = _loc2_.ctor;
         var _loc4_:* = _loc3_.applyInjection(param1,this);
         this.injectInto(_loc4_);
         return _loc4_;
      }
      
      public function unmap(param1:Class, param2:String = "") : void
      {
         var _loc3_:InjectionConfig = this.getConfigurationForRequest(param1,param2);
         if(!_loc3_)
         {
            throw new InjectorError("Error while removing an injector mapping: " + "No mapping defined for class " + getQualifiedClassName(param1) + ", named \"" + param2 + "\"");
         }
         _loc3_.setResult(null);
      }
      
      public function hasMapping(param1:Class, param2:String = "") : Boolean
      {
         var _loc3_:InjectionConfig = this.getConfigurationForRequest(param1,param2);
         if(!_loc3_)
         {
            return false;
         }
         return _loc3_.hasResponse(this);
      }
      
      public function getInstance(param1:Class, param2:String = "") : *
      {
         var _loc3_:InjectionConfig = this.getConfigurationForRequest(param1,param2);
         if(!_loc3_ || !_loc3_.hasResponse(this))
         {
            throw new InjectorError("Error while getting mapping response: " + "No mapping defined for class " + getQualifiedClassName(param1) + ", named \"" + param2 + "\"");
         }
         return _loc3_.getResponse(this);
      }
      
      public function createChildInjector(param1:ApplicationDomain = null) : Injector
      {
         var _loc2_:Injector = new Injector();
         _loc2_.setApplicationDomain(param1);
         _loc2_.setParentInjector(this);
         return _loc2_;
      }
      
      public function setApplicationDomain(param1:ApplicationDomain) : void
      {
         this.m_applicationDomain = param1;
      }
      
      public function getApplicationDomain() : ApplicationDomain
      {
         return !!this.m_applicationDomain ? this.m_applicationDomain : ApplicationDomain.currentDomain;
      }
      
      public function setParentInjector(param1:Injector) : void
      {
         if(this.m_parentInjector && !param1)
         {
            this.m_attendedToInjectees = new Dictionary(true);
         }
         this.m_parentInjector = param1;
         if(param1)
         {
            this.m_attendedToInjectees = param1.attendedToInjectees;
         }
      }
      
      public function getParentInjector() : Injector
      {
         return this.m_parentInjector;
      }
      
      function getAncestorMapping(param1:Class, param2:String = null) : InjectionConfig
      {
         var _loc4_:InjectionConfig = null;
         var _loc3_:Injector = this.m_parentInjector;
         while(_loc3_)
         {
            if((_loc4_ = _loc3_.getConfigurationForRequest(param1,param2,false)) && _loc4_.hasOwnResponse())
            {
               return _loc4_;
            }
            _loc3_ = _loc3_.getParentInjector();
         }
         return null;
      }
      
      public function get attendedToInjectees() : Dictionary
      {
         return this.m_attendedToInjectees;
      }
      
      public function mydebug() : void
      {
         trace("=============");
      }
      
      private function getInjectionPoints(param1:Class) : InjecteeDescription
      {
         var node:XML = null;
         var ctorInjectionPoint:InjectionPoint = null;
         var injectionPoint:InjectionPoint = null;
         var postConstructMethodPoints:Array = null;
         var clazz:Class = param1;
         var description:XML = describeType(clazz);
         if(description.@name != "Object" && description.factory.extendsClass.length() == 0)
         {
            throw new InjectorError("Interfaces can\'t be used as instantiatable classes.");
         }
         var injectionPoints:Array = [];
         if(this.m_xmlMetadata)
         {
            this.createInjectionPointsFromConfigXML(description);
            this.addParentInjectionPoints(description,injectionPoints);
         }
         node = description.factory.constructor[0];
         if(node)
         {
            ctorInjectionPoint = new ConstructorInjectionPoint(node,clazz,this);
         }
         else
         {
            ctorInjectionPoint = new NoParamsConstructorInjectionPoint();
         }
         for each(node in description.factory.*.(name() == "variable" || name() == "accessor").metadata.(@name == "Inject"))
         {
            injectionPoint = new PropertyInjectionPoint(node);
            injectionPoints.push(injectionPoint);
         }
         for each(node in description.factory.method.metadata.(@name == "Inject"))
         {
            injectionPoint = new MethodInjectionPoint(node,this);
            injectionPoints.push(injectionPoint);
         }
         postConstructMethodPoints = [];
         for each(node in description.factory.method.metadata.(@name == "PostConstruct"))
         {
            injectionPoint = new PostConstructInjectionPoint(node,this);
            postConstructMethodPoints.push(injectionPoint);
         }
         if(postConstructMethodPoints.length > 0)
         {
            postConstructMethodPoints.sortOn("order",Array.NUMERIC);
            injectionPoints.push.apply(injectionPoints,postConstructMethodPoints);
         }
         var injecteeDescription:InjecteeDescription = new InjecteeDescription(ctorInjectionPoint,injectionPoints);
         this.m_injecteeDescriptions[clazz] = injecteeDescription;
         return injecteeDescription;
      }
      
      private function getConfigurationForRequest(param1:Class, param2:String, param3:Boolean = true) : InjectionConfig
      {
         var _loc4_:String = getQualifiedClassName(param1);
         var _loc5_:InjectionConfig;
         if(!(_loc5_ = this.m_mappings[_loc4_ + "#" + param2]) && param3 && this.m_parentInjector && this.m_parentInjector.hasMapping(param1,param2))
         {
            _loc5_ = this.getAncestorMapping(param1,param2);
         }
         return _loc5_;
      }
      
      private function createInjectionPointsFromConfigXML(param1:XML) : void
      {
         var node:XML = null;
         var className:String = null;
         var metaNode:XML = null;
         var typeNode:XML = null;
         var arg:XML = null;
         var description:XML = param1;
         for each(node in description..metadata.(@name == "Inject" || @name == "PostConstruct"))
         {
            delete node.parent().metadata.(@name == "Inject" || @name == "PostConstruct")[0];
         }
         className = description.factory.@type;
         for each(node in this.m_xmlMetadata.type.(@name == className).children())
         {
            metaNode = <metadata/>;
            if(node.name() == "postconstruct")
            {
               metaNode.@name = "PostConstruct";
               if(node.@order.length())
               {
                  metaNode.appendChild(<arg key='order' value="{node.@order}"/>);
               }
            }
            else
            {
               metaNode.@name = "Inject";
               if(node.@injectionname.length())
               {
                  metaNode.appendChild(<arg key='name' value="{node.@injectionname}"/>);
               }
               for each(arg in node.arg)
               {
                  metaNode.appendChild(<arg key='name' value="{arg.@injectionname}"/>);
               }
            }
            if(node.name() == "constructor")
            {
               typeNode = description.factory[0];
            }
            else
            {
               typeNode = description.factory.*.(attribute("name") == node.@name)[0];
               if(!typeNode)
               {
                  throw new InjectorError("Error in XML configuration: Class \"" + className + "\" doesn\'t contain the instance member \"" + node.@name + "\"");
               }
            }
            typeNode.appendChild(metaNode);
         }
      }
      
      private function addParentInjectionPoints(param1:XML, param2:Array) : void
      {
         var _loc3_:String = param1.factory.extendsClass.@type[0];
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Class = Class(getDefinitionByName(_loc3_));
         var _loc5_:InjecteeDescription;
         var _loc6_:Array = (_loc5_ = this.m_injecteeDescriptions[_loc4_] || this.getInjectionPoints(_loc4_)).injectionPoints;
         param2.push.apply(param2,_loc6_);
      }
   }
}

import org.swiftsuspenders.injectionpoints.InjectionPoint;

final class InjecteeDescription
{
    
   
   public var ctor:InjectionPoint;
   
   public var injectionPoints:Array;
   
   function InjecteeDescription(param1:InjectionPoint, param2:Array)
   {
      super();
      this.ctor = param1;
      this.injectionPoints = param2;
   }
}
