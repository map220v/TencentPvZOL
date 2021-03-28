package com.tencent.protobuf
{
   import flash.errors.IllegalOperationError;
   import flash.utils.IDataInput;
   import flash.utils.getDefinitionByName;
   
   public class BaseFieldDescriptor implements IFieldDescriptor
   {
      
      private static const ACTIONSCRIPT_KEYWORDS:Object = {
         "as":true,
         "break":true,
         "case":true,
         "catch":true,
         "class":true,
         "const":true,
         "continue":true,
         "default":true,
         "delete":true,
         "do":true,
         "else":true,
         "extends":true,
         "false":true,
         "finally":true,
         "for":true,
         "function":true,
         "if":true,
         "implements":true,
         "import":true,
         "in":true,
         "instanceof":true,
         "interface":true,
         "internal":true,
         "is":true,
         "native":true,
         "new":true,
         "null":true,
         "package":true,
         "private":true,
         "protected":true,
         "public":true,
         "return":true,
         "super":true,
         "switch":true,
         "this":true,
         "throw":true,
         "to":true,
         "true":true,
         "try":true,
         "typeof":true,
         "use":true,
         "var":true,
         "void":true,
         "while":true,
         "with":true
      };
       
      
      public var fullName:String;
      
      protected var _name:String;
      
      protected var tag:uint;
      
      public function BaseFieldDescriptor()
      {
         super();
      }
      
      static function getExtensionByName(param1:String) : BaseFieldDescriptor
      {
         var _loc2_:int = param1.lastIndexOf("/");
         if(_loc2_ == -1)
         {
            return BaseFieldDescriptor(getDefinitionByName(param1));
         }
         return getDefinitionByName(param1.substring(0,_loc2_))[param1.substring(_loc2_ + 1)];
      }
      
      public final function get name() : String
      {
         return this._name;
      }
      
      public final function get tagNumber() : uint
      {
         return this.tag >>> 3;
      }
      
      public function get type() : Class
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function readSingleField(param1:IDataInput) : *
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function writeSingleField(param1:WritingBuffer, param2:*) : void
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function write(param1:WritingBuffer, param2:Message) : void
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function toString() : String
      {
         return this.name;
      }
   }
}

function regexToUpperCase(param1:String, param2:int, param3:String):String
{
   return param1.charAt(1).toUpperCase();
}