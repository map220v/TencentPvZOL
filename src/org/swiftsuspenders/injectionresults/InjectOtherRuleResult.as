package org.swiftsuspenders.injectionresults
{
   import org.swiftsuspenders.InjectionConfig;
   import org.swiftsuspenders.Injector;
   
   public class InjectOtherRuleResult extends InjectionResult
   {
       
      
      private var m_rule:InjectionConfig;
      
      public function InjectOtherRuleResult(param1:InjectionConfig)
      {
         super();
         this.m_rule = param1;
      }
      
      override public function getResponse(param1:Injector) : Object
      {
         return this.m_rule.getResponse(param1);
      }
   }
}
