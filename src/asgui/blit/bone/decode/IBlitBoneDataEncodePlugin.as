package asgui.blit.bone.decode
{
   import asgui.blit.bone.BlitBoneData;
   import flash.utils.ByteArray;
   
   public interface IBlitBoneDataEncodePlugin
   {
       
      
      function readBytes(param1:ByteArray, param2:BlitBoneData, param3:int) : void;
      
      function writeBytes(param1:ByteArray, param2:*) : void;
   }
}
