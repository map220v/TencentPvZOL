package org.robotlegs.adapters
{
   import flash.system.ApplicationDomain;
   import org.robotlegs.core.IInjector;
   import org.swiftsuspenders.Injector;
   
   public class SwiftSuspendersInjector extends Injector implements IInjector
   {
      
      protected static const XML_CONFIG:XML = <types>
				<type name='org.robotlegs.mvcs::Actor'>
					<field name='eventDispatcher'/>
				</type>
				<type name='org.robotlegs.mvcs::Command'>
					<field name='contextView'/>
					<field name='mediatorMap'/>
					<field name='eventDispatcher'/>
					<field name='injector'/>
					<field name='commandMap'/>
				</type>
				<type name='org.robotlegs.mvcs::Mediator'>
					<field name='contextView'/>
					<field name='mediatorMap'/>
					<field name='eventDispatcher'/>
				</type>
			</types>;
       
      
      public function SwiftSuspendersInjector(param1:XML = null)
      {
         var _loc2_:XML = null;
         if(param1)
         {
            for each(_loc2_ in XML_CONFIG.children())
            {
               param1.appendChild(_loc2_);
            }
         }
         super(param1);
      }
      
      public function createChild(param1:ApplicationDomain = null) : IInjector
      {
         var _loc2_:SwiftSuspendersInjector = new SwiftSuspendersInjector();
         _loc2_.setApplicationDomain(param1);
         _loc2_.setParentInjector(this);
         _loc2_.mydebug();
         return _loc2_;
      }
      
      public function get applicationDomain() : ApplicationDomain
      {
         return getApplicationDomain();
      }
      
      public function set applicationDomain(param1:ApplicationDomain) : void
      {
         setApplicationDomain(param1);
      }
   }
}
