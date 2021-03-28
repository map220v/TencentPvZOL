package org.swiftsuspenders.injectionpoints
{
   import org.swiftsuspenders.Injector;
   
   public class InjectionPoint
   {
       
      
      public function InjectionPoint(param1:XML, param2:Injector)
      {
         super();
         this.initializeInjection(param1);
      }
      
      public function applyInjection(param1:Object, param2:Injector) : Object
      {
         return param1;
      }
      
      protected function initializeInjection(param1:XML) : void
      {
      }
   }
}
