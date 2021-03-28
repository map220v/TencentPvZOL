package asgui.blit.bone.decode
{
   import asgui.blit.bone.BlitBoneData;
   import flash.utils.ByteArray;
   
   public class BlitBoneDataFlagLabelDecodePlugin implements IBlitBoneDataEncodePlugin
   {
       
      
      public function BlitBoneDataFlagLabelDecodePlugin()
      {
         super();
      }
      
      public function readBytes(param1:ByteArray, param2:BlitBoneData, param3:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc4_:int = param1.readInt();
         while(_loc4_-- > 0)
         {
            _loc5_ = param1.readShort();
            _loc6_ = param1.readUTF();
            param2.flagLabel[_loc5_] = _loc6_;
         }
      }
      
      public function writeBytes(param1:ByteArray, param2:*) : void
      {
         var _loc5_:Object = null;
         var _loc6_:* = null;
         var _loc7_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Array;
         if((_loc4_ = param2) != null)
         {
            for each(_loc5_ in _loc4_)
            {
               _loc3_++;
            }
            param1.writeInt(_loc3_);
            if(_loc3_ > 0)
            {
               for(_loc6_ in _loc4_)
               {
                  _loc7_ = _loc4_[_loc6_];
                  param1.writeShort(int(_loc6_));
                  param1.writeUTF(_loc7_);
               }
            }
         }
      }
   }
}
