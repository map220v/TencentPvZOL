package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.utils.IDataInput;
   
   public final class Cmd_Puppet_GetExtractInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Puppet_GetExtractInfo_SC";
      
      public static const GROUPINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Puppet_GetExtractInfo_SC.groupInfo","groupInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Puppet_ExtractGroupInfo);
       
      
      public var groupInfo:Array;
      
      public function Cmd_Puppet_GetExtractInfo_SC()
      {
         this.groupInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Puppet_GetExtractInfo_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.groupInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.groupInfo[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
               case 2:
                  this.groupInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Puppet_ExtractGroupInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc3_);
                  break;
            }
         }
      }
   }
}
