package asgui.utils
{
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   
   public final class ObjectUtil
   {
       
      
      public function ObjectUtil()
      {
         super();
      }
      
      public static function WritedMatrix(param1:Matrix) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeFloat(param1.a);
         _loc2_.writeFloat(param1.b);
         _loc2_.writeFloat(param1.c);
         _loc2_.writeFloat(param1.d);
         _loc2_.writeFloat(param1.tx);
         _loc2_.writeFloat(param1.ty);
         return _loc2_;
      }
      
      public static function ReadMatrix(param1:Object) : Matrix
      {
         var _loc3_:ByteArray = null;
         var _loc2_:Matrix = new Matrix();
         if(param1 is ByteArray)
         {
            _loc3_ = param1 as ByteArray;
            _loc2_.a = _loc3_.readFloat();
            _loc2_.b = _loc3_.readFloat();
            _loc2_.c = _loc3_.readFloat();
            _loc2_.d = _loc3_.readFloat();
            _loc2_.tx = _loc3_.readFloat();
            _loc2_.ty = _loc3_.readFloat();
         }
         else
         {
            _loc2_.a = param1.a;
            _loc2_.b = param1.b;
            _loc2_.c = param1.c;
            _loc2_.d = param1.d;
            _loc2_.tx = param1.tx;
            _loc2_.ty = param1.ty;
         }
         return _loc2_;
      }
      
      public static function WriteColorTransform(param1:ColorTransform) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeFloat(param1.alphaMultiplier);
         _loc2_.writeFloat(param1.alphaOffset);
         _loc2_.writeFloat(param1.blueMultiplier);
         _loc2_.writeFloat(param1.blueOffset);
         _loc2_.writeFloat(param1.greenMultiplier);
         _loc2_.writeFloat(param1.greenOffset);
         _loc2_.writeFloat(param1.redMultiplier);
         _loc2_.writeFloat(param1.redOffset);
         return _loc2_;
      }
      
      public static function ReadColorTransform(param1:Object) : ColorTransform
      {
         var _loc3_:ByteArray = null;
         var _loc2_:ColorTransform = new ColorTransform();
         if(param1 is ByteArray)
         {
            _loc3_ = param1 as ByteArray;
            _loc2_.alphaMultiplier = param1.readFloat();
            _loc2_.alphaOffset = param1.readFloat();
            _loc2_.blueMultiplier = param1.readFloat();
            _loc2_.blueOffset = param1.readFloat();
            _loc2_.greenMultiplier = param1.readFloat();
            _loc2_.greenOffset = param1.readFloat();
            _loc2_.redMultiplier = param1.readFloat();
            _loc2_.redOffset = param1.readFloat();
         }
         else
         {
            _loc2_.alphaMultiplier = param1.alphaMultiplier;
            _loc2_.alphaOffset = param1.alphaOffset;
            _loc2_.blueMultiplier = param1.blueMultiplier;
            _loc2_.blueOffset = param1.blueOffset;
            _loc2_.greenMultiplier = param1.greenMultiplier;
            _loc2_.greenOffset = param1.greenOffset;
            _loc2_.redMultiplier = param1.redMultiplier;
            _loc2_.redOffset = param1.redOffset;
         }
         return _loc2_;
      }
   }
}
