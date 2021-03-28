package org.swiftsuspenders
{
   import flash.utils.getQualifiedClassName;
   import org.swiftsuspenders.injectionresults.InjectionResult;
   
   public class InjectionConfig
   {
       
      
      public var request:Class;
      
      public var injectionName:String;
      
      private var m_injector:Injector;
      
      private var m_result:InjectionResult;
      
      public function InjectionConfig(param1:Class, param2:String)
      {
         super();
         this.request = param1;
         this.injectionName = param2;
      }
      
      public function getResponse(param1:Injector) : Object
      {
         if(this.m_result)
         {
            return this.m_result.getResponse(this.m_injector || param1);
         }
         var _loc2_:InjectionConfig = (this.m_injector || param1).getAncestorMapping(this.request,this.injectionName);
         if(_loc2_)
         {
            return _loc2_.getResponse(param1);
         }
         return null;
      }
      
      public function hasResponse(param1:Injector) : Boolean
      {
         if(this.m_result)
         {
            return true;
         }
         var _loc2_:InjectionConfig = (this.m_injector || param1).getAncestorMapping(this.request,this.injectionName);
         return _loc2_ != null;
      }
      
      public function hasOwnResponse() : Boolean
      {
         return this.m_result != null;
      }
      
      public function setResult(param1:InjectionResult) : void
      {
         if(this.m_result != null && param1 != null)
         {
            trace("Warning: Injector already has a rule for type \"" + getQualifiedClassName(this.request) + "\", named \"" + this.injectionName + "\".\n " + "If you have overwritten this mapping intentionally you can use " + "\"injector.unmap()\" prior to your replacement mapping in order to " + "avoid seeing this message.");
         }
         this.m_result = param1;
      }
      
      public function setInjector(param1:Injector) : void
      {
         this.m_injector = param1;
      }
   }
}
