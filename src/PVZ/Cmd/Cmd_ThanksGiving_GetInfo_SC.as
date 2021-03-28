package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ThanksGiving_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ThanksGiving_GetInfo_SC";
      
      public static const REWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ThanksGiving_GetInfo_SC.rewardList","rewardList",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ThanksGiving_GlobalReward);
      
      public static const MYINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ThanksGiving_GetInfo_SC.myInfo","myInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ThanksGiving_MyInfo);
      
      public static const SECKILLTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ThanksGiving_GetInfo_SC.secKillTimes","secKillTimes",3 << 3 | WireType.VARINT);
      
      public static const SECKILLOVER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ThanksGiving_GetInfo_SC.secKillOver","secKillOver",4 << 3 | WireType.VARINT);
       
      
      public var rewardList:Array;
      
      private var myInfo$field:Dto_ThanksGiving_MyInfo;
      
      private var secKillTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var secKillOver$field:Boolean;
      
      public function Cmd_ThanksGiving_GetInfo_SC()
      {
         this.rewardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ThanksGiving_GetInfo_SC.$MessageID;
      }
      
      public function clearMyInfo() : void
      {
         this.myInfo$field = null;
      }
      
      public function get hasMyInfo() : Boolean
      {
         return this.myInfo$field != null;
      }
      
      public function set myInfo(param1:Dto_ThanksGiving_MyInfo) : void
      {
         this.myInfo$field = param1;
      }
      
      public function get myInfo() : Dto_ThanksGiving_MyInfo
      {
         return this.myInfo$field;
      }
      
      public function clearSecKillTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.secKillTimes$field = new uint();
      }
      
      public function get hasSecKillTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set secKillTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.secKillTimes$field = param1;
      }
      
      public function get secKillTimes() : uint
      {
         return this.secKillTimes$field;
      }
      
      public function clearSecKillOver() : void
      {
         this.hasField$0 &= 4294967293;
         this.secKillOver$field = new Boolean();
      }
      
      public function get hasSecKillOver() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set secKillOver(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.secKillOver$field = param1;
      }
      
      public function get secKillOver() : Boolean
      {
         return this.secKillOver$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardList[_loc2_]);
            _loc2_++;
         }
         if(this.hasMyInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myInfo$field);
         }
         if(this.hasSecKillTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.secKillTimes$field);
         }
         if(this.hasSecKillOver)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.secKillOver$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  this.rewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ThanksGiving_GlobalReward()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ThanksGiving_GetInfo_SC.myInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.myInfo = new Dto_ThanksGiving_MyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myInfo);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ThanksGiving_GetInfo_SC.secKillTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.secKillTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ThanksGiving_GetInfo_SC.secKillOver cannot be set twice.");
                  }
                  _loc5_++;
                  this.secKillOver = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
