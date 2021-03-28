package org.swiftsuspenders.injectionpoints
{
   import flash.utils.describeType;
   import org.swiftsuspenders.Injector;
   
   public class ConstructorInjectionPoint extends MethodInjectionPoint
   {
       
      
      public function ConstructorInjectionPoint(param1:XML, param2:Class, param3:Injector = null)
      {
         var node:XML = param1;
         var clazz:Class = param2;
         var injector:Injector = param3;
         if(node.parameter.(@type == "*").length() == node.parameter.@type.length())
         {
            this.createDummyInstance(node,clazz);
         }
         super(node,injector);
      }
      
      override public function applyInjection(param1:Object, param2:Injector) : Object
      {
         var _loc3_:Class = Class(param1);
         var _loc4_:Array = gatherParameterValues(param1,param2);
         switch(_loc4_.length)
         {
            case 0:
               return new _loc3_();
            case 1:
               return new _loc3_(_loc4_[0]);
            case 2:
               return new _loc3_(_loc4_[0],_loc4_[1]);
            case 3:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2]);
            case 4:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
            case 5:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4]);
            case 6:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5]);
            case 7:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
            case 8:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7]);
            case 9:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8]);
            case 10:
               return new _loc3_(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9]);
            default:
               return null;
         }
      }
      
      override protected function initializeInjection(param1:XML) : void
      {
         var nameArgs:XMLList = null;
         var node:XML = param1;
         nameArgs = node.parent().metadata.(@name == "Inject").arg.(@key == "name");
         methodName = "constructor";
         gatherParameters(node,nameArgs);
      }
      
      private function createDummyInstance(param1:XML, param2:Class) : void
      {
         var constructorNode:XML = param1;
         var clazz:Class = param2;
         try
         {
            switch(constructorNode.children().length())
            {
               case 0:
                  new clazz();
                  break;
               case 1:
                  new clazz(null);
                  break;
               case 2:
                  new clazz(null,null);
                  break;
               case 3:
                  new clazz(null,null,null);
                  break;
               case 4:
                  new clazz(null,null,null,null);
                  break;
               case 5:
                  new clazz(null,null,null,null,null);
                  break;
               case 6:
                  new clazz(null,null,null,null,null,null);
                  break;
               case 7:
                  new clazz(null,null,null,null,null,null,null);
                  break;
               case 8:
                  new clazz(null,null,null,null,null,null,null,null);
                  break;
               case 9:
                  new clazz(null,null,null,null,null,null,null,null,null);
                  break;
               case 10:
                  new clazz(null,null,null,null,null,null,null,null,null,null);
            }
         }
         catch(error:Error)
         {
            trace("Exception caught while trying to create dummy instance for constructor " + "injection. It\'s almost certainly ok to ignore this exception, but you " + "might want to restructure your constructor to prevent errors from " + "happening. See the SwiftSuspenders documentation for more details. " + "The caught exception was:\n" + error);
         }
         constructorNode.setChildren(describeType(clazz).factory.constructor[0].children());
      }
   }
}
