package asgui.blit.bone.decode
{
   import asgui.blit.bone.BlitBoneData;
   import flash.utils.ByteArray;
   
   public class BlitBoneDataAreaDecodePlugin implements IBlitBoneDataEncodePlugin
   {
       
      
      public function BlitBoneDataAreaDecodePlugin()
      {
         super();
      }
      
      public function readBytes(param1:ByteArray, param2:BlitBoneData, param3:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc4_:int = param1.readInt();
         while(_loc4_-- > 0)
         {
            _loc5_ = param1.readShort();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            param2.attackArea[_loc5_] = [_loc6_,_loc7_,_loc8_,_loc9_];
         }
         _loc4_ = param1.readInt();
         while(_loc4_-- > 0)
         {
            _loc10_ = param1.readShort();
            _loc11_ = param1.readInt();
            _loc12_ = param1.readInt();
            _loc13_ = param1.readInt();
            _loc14_ = param1.readInt();
            param2.damageArea[_loc10_] = [_loc11_,_loc12_,_loc13_,_loc14_];
         }
      }
      
      public function writeBytes(param1:ByteArray, param2:*) : void
      {
         var _loc6_:Array = null;
         var _loc7_:* = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:* = null;
         var _loc11_:Array = null;
         var _loc3_:Array = param2[0];
         var _loc4_:Array = param2[1];
         var _loc5_:int = 0;
         if(_loc3_ != null)
         {
            for each(_loc6_ in _loc3_)
            {
               _loc5_++;
            }
         }
         param1.writeInt(_loc5_);
         if(_loc5_ > 0)
         {
            for(_loc7_ in _loc3_)
            {
               param1.writeShort(int(_loc7_));
               _loc8_ = _loc3_[_loc7_];
               param1.writeInt(_loc8_[0]);
               param1.writeInt(_loc8_[1]);
               param1.writeInt(_loc8_[2]);
               param1.writeInt(_loc8_[3]);
            }
         }
         _loc5_ = 0;
         if(_loc4_ != null)
         {
            for each(_loc9_ in _loc4_)
            {
               _loc5_++;
            }
         }
         param1.writeInt(_loc5_);
         if(_loc5_ > 0)
         {
            for(_loc10_ in _loc4_)
            {
               param1.writeShort(int(_loc10_));
               _loc11_ = _loc4_[_loc10_];
               param1.writeInt(_loc11_[0]);
               param1.writeInt(_loc11_[1]);
               param1.writeInt(_loc11_[2]);
               param1.writeInt(_loc11_[3]);
            }
         }
      }
   }
}
