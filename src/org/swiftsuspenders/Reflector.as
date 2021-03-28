package org.swiftsuspenders
{
   import flash.system.ApplicationDomain;
   import flash.utils.*;
   
   public class Reflector
   {
       
      
      public function Reflector()
      {
         super();
      }
      
      public function classExtendsOrImplements(param1:Object, param2:Class, param3:ApplicationDomain = null) : Boolean
      {
         var actualClass:Class = null;
         var classOrClassName:Object = param1;
         var superclass:Class = param2;
         var application:ApplicationDomain = param3;
         if(classOrClassName is Class)
         {
            actualClass = Class(classOrClassName);
         }
         else if(classOrClassName is String)
         {
            try
            {
               actualClass = Class(getDefinitionByName(classOrClassName as String));
            }
            catch(e:Error)
            {
               throw new Error("The class name " + classOrClassName + " is not valid because of " + e + "\n" + e.getStackTrace());
            }
         }
         if(!actualClass)
         {
            throw new Error("The parameter classOrClassName must be a valid Class " + "instance or fully qualified class name.");
         }
         if(actualClass == superclass)
         {
            return true;
         }
         var factoryDescription:XML = describeType(actualClass).factory[0];
         return factoryDescription.children().(name() == "implementsInterface" || name() == "extendsClass").(attribute("type") == getQualifiedClassName(superclass)).length() > 0;
      }
      
      public function getClass(param1:*, param2:ApplicationDomain = null) : Class
      {
         if(param1 is Class)
         {
            return param1;
         }
         return getConstructor(param1);
      }
      
      public function getFQCN(param1:*, param2:Boolean = false) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         if(param1 is String)
         {
            _loc3_ = param1;
            if(!param2 && _loc3_.indexOf("::") == -1)
            {
               if((_loc4_ = _loc3_.lastIndexOf(".")) == -1)
               {
                  return _loc3_;
               }
               return _loc3_.substring(0,_loc4_) + "::" + _loc3_.substring(_loc4_ + 1);
            }
         }
         else
         {
            _loc3_ = getQualifiedClassName(param1);
         }
         return !!param2 ? _loc3_.replace("::",".") : _loc3_;
      }
   }
}
