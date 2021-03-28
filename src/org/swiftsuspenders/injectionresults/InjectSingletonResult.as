package org.swiftsuspenders.injectionresults
{
   import org.swiftsuspenders.Injector;
   
   public class InjectSingletonResult extends InjectionResult
   {
       
      
      private var m_responseType:Class;
      
      private var m_response:Object;
      
      public function InjectSingletonResult(param1:Class)
      {
         super();
         this.m_responseType = param1;
      }
      
      override public function getResponse(param1:Injector) : Object
      {
         return this.m_response = this.m_response || this.createResponse(param1);
      }
      
      private function createResponse(param1:Injector) : Object
      {
         return param1.instantiate(this.m_responseType);
      }
   }
}
