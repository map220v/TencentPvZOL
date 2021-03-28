package org.swiftsuspenders.injectionpoints
{
   import org.swiftsuspenders.Injector;
   
   public class PostConstructInjectionPoint extends InjectionPoint
   {
       
      
      protected var methodName:String;
      
      protected var orderValue:int;
      
      public function PostConstructInjectionPoint(param1:XML, param2:Injector = null)
      {
         super(param1,param2);
      }
      
      public function get order() : int
      {
         return this.orderValue;
      }
      
      override public function applyInjection(param1:Object, param2:Injector) : Object
      {
         param1[this.methodName]();
         return param1;
      }
      
      override protected function initializeInjection(param1:XML) : void
      {
         var orderArg:XMLList = null;
         var methodNode:XML = null;
         var node:XML = param1;
         orderArg = node.arg.(@key == "order");
         methodNode = node.parent();
         this.orderValue = int(orderArg.@value);
         this.methodName = methodNode.@name.toString();
      }
   }
}
