package org.swiftsuspenders.injectionpoints
{
   import org.swiftsuspenders.InjectionConfig;
   import org.swiftsuspenders.Injector;
   import org.swiftsuspenders.InjectorError;
   
   public class PropertyInjectionPoint extends InjectionPoint
   {
       
      
      private var _propertyName:String;
      
      private var _propertyType:String;
      
      private var _injectionName:String;
      
      public function PropertyInjectionPoint(param1:XML, param2:Injector = null)
      {
         super(param1,null);
      }
      
      override public function applyInjection(param1:Object, param2:Injector) : Object
      {
         var _loc3_:InjectionConfig = param2.getMapping(Class(param2.getApplicationDomain().getDefinition(this._propertyType)),this._injectionName);
         var _loc4_:Object;
         if((_loc4_ = _loc3_.getResponse(param2)) == null)
         {
            throw new InjectorError("Injector is missing a rule to handle injection into property \"" + this._propertyName + "\" of object \"" + param1 + "\". Target dependency: \"" + this._propertyType + "\", named \"" + this._injectionName + "\"");
         }
         param1[this._propertyName] = _loc4_;
         return param1;
      }
      
      override protected function initializeInjection(param1:XML) : void
      {
         this._propertyType = param1.parent().@type.toString();
         this._propertyName = param1.parent().@name.toString();
         this._injectionName = param1.arg.attribute("value").toString();
      }
   }
}
