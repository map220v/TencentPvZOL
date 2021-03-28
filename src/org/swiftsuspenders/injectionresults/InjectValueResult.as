package org.swiftsuspenders.injectionresults
{
   import org.swiftsuspenders.Injector;
   
   public class InjectValueResult extends InjectionResult
   {
       
      
      private var m_value:Object;
      
      public function InjectValueResult(param1:Object)
      {
         super();
         this.m_value = param1;
      }
      
      override public function getResponse(param1:Injector) : Object
      {
         return this.m_value;
      }
   }
}
