package tencent.base.utils
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class ObjectUtil
   {
      
      private static var classDic:Dictionary = new Dictionary();
       
      
      public function ObjectUtil()
      {
         super();
      }
      
      public static function clone(param1:Object) : Object
      {
         registerClass(param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public static function registerClass(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         if(param1 is Object)
         {
            _loc4_ = getQualifiedClassName(param1);
            if(!classDic[_loc4_])
            {
               _loc5_ = getDefinitionByName(_loc4_) as Class;
               registerClassAlias(_loc4_,_loc5_);
            }
         }
         else if(param1 is Array)
         {
            _loc2_ = (param1 as Array).length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               registerClass((param1 as Array)[_loc3_]);
               _loc3_++;
            }
         }
         else if(param1 is Vector)
         {
            _loc2_ = (param1 as Vector).length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               registerClass((param1 as Vector)[_loc3_]);
               _loc3_++;
            }
         }
      }
   }
}
