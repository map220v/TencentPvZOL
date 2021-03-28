package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.utils.IDataInput;
   
   public final class Cmd_Farm_GetMyInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Farm_GetMyInfo_SC";
      
      public static const BLOCKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Farm_GetMyInfo_SC.blocks","blocks",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Farm_BlockInfo);
      
      public static const PLANTINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Farm_GetMyInfo_SC.plantInfo","plantInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
       
      
      public var blocks:Array;
      
      public var plantInfo:Array;
      
      public function Cmd_Farm_GetMyInfo_SC()
      {
         this.blocks = [];
         this.plantInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Farm_GetMyInfo_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.blocks.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.blocks[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.plantInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantInfo[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc3_ >> 3)
            {
               case 1:
                  this.blocks.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Farm_BlockInfo()));
                  break;
               case 2:
                  this.plantInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlantInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc3_);
                  break;
            }
         }
      }
   }
}
