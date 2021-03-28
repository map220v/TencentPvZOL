package asgui.blit.bone.decode
{
   import asgui.blit.bone.BlitBoneData;
   import flash.utils.ByteArray;
   
   public class BlitBoneDataAssetPosPlugin implements IBlitBoneDataEncodePlugin
   {
       
      
      public function BlitBoneDataAssetPosPlugin()
      {
         super();
      }
      
      public function readBytes(param1:ByteArray, param2:BlitBoneData, param3:int) : void
      {
         param2.offsetX = param1.readInt();
         param2.offsetY = param1.readInt();
      }
      
      public function writeBytes(param1:ByteArray, param2:*) : void
      {
         var _loc3_:Array = param2;
         param1.writeInt(_loc3_[0]);
         param1.writeInt(_loc3_[1]);
      }
   }
}
