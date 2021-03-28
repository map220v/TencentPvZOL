package asgui.blit.bone.decode
{
   import asgui.blit.bone.BlitBoneData;
   import flash.display.FrameLabel;
   import flash.utils.ByteArray;
   
   public class BlitBoneDataFrameLabelDecodePlugin implements IBlitBoneDataEncodePlugin
   {
       
      
      public function BlitBoneDataFrameLabelDecodePlugin()
      {
         super();
      }
      
      public function readBytes(param1:ByteArray, param2:BlitBoneData, param3:int) : void
      {
         var _loc5_:FrameLabel = null;
         var _loc4_:int = param1.readInt();
         while(_loc4_-- > 0)
         {
            _loc5_ = new FrameLabel(param1.readUTF(),param1.readInt());
            param2.frameLabel.push(_loc5_);
         }
      }
      
      public function writeBytes(param1:ByteArray, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc6_:FrameLabel = null;
         var _loc4_:Vector.<FrameLabel>;
         var _loc5_:int = (_loc4_ = param2).length;
         param1.writeInt(_loc5_);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc6_ = _loc4_[_loc3_];
            param1.writeUTF(_loc6_.name);
            param1.writeInt(_loc6_.frame);
            _loc3_++;
         }
      }
   }
}
