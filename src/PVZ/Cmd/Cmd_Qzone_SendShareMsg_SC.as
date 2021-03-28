package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Qzone_SendShareMsg_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Qzone_SendShareMsg_SC";
      
      public static const SHAREINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Qzone_SendShareMsg_SC.shareInfo","shareInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ShareInfo);
      
      public static const REWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Qzone_SendShareMsg_SC.rewardList","rewardList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const LEFTALLTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Qzone_SendShareMsg_SC.leftAllTimes","leftAllTimes",3 << 3 | WireType.VARINT);
       
      
      private var shareInfo$field:Dto_ShareInfo;
      
      public var rewardList:Array;
      
      private var leftAllTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Qzone_SendShareMsg_SC()
      {
         this.rewardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Qzone_SendShareMsg_SC.$MessageID;
      }
      
      public function clearShareInfo() : void
      {
         this.shareInfo$field = null;
      }
      
      public function get hasShareInfo() : Boolean
      {
         return this.shareInfo$field != null;
      }
      
      public function set shareInfo(param1:Dto_ShareInfo) : void
      {
         this.shareInfo$field = param1;
      }
      
      public function get shareInfo() : Dto_ShareInfo
      {
         return this.shareInfo$field;
      }
      
      public function clearLeftAllTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.leftAllTimes$field = new uint();
      }
      
      public function get hasLeftAllTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set leftAllTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.leftAllTimes$field = param1;
      }
      
      public function get leftAllTimes() : uint
      {
         return this.leftAllTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasShareInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.shareInfo$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardList[_loc2_]);
            _loc2_++;
         }
         if(this.hasLeftAllTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.leftAllTimes$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Qzone_SendShareMsg_SC.shareInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.shareInfo = new Dto_ShareInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shareInfo);
                  break;
               case 2:
                  this.rewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Qzone_SendShareMsg_SC.leftAllTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftAllTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
