package org.swiftsuspenders.injectionpoints
{
   import org.swiftsuspenders.Injector;
   
   public class NoParamsConstructorInjectionPoint extends InjectionPoint
   {
       
      
      public function NoParamsConstructorInjectionPoint()
      {
         super(null,null);
      }
      
      override public function applyInjection(param1:Object, param2:Injector) : Object
      {
         return new (param1 as Class)();
      }
   }
}
