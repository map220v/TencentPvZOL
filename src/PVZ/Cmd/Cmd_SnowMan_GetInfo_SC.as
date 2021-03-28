package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SnowMan_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SnowMan_GetInfo_SC";
      
      public static const IREMAINCHALLENGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_GetInfo_SC.iRemainChallenge","iRemainChallenge",2 << 3 | WireType.VARINT);
      
      public static const TALENTIDLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_GetInfo_SC.talentIdList","talentIdList",3 << 3 | WireType.VARINT);
      
      public static const PLANTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SnowMan_GetInfo_SC.plantList","plantList",4 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const IRETICKETCHALLENGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_GetInfo_SC.iReTicketChallenge","iReTicketChallenge",5 << 3 | WireType.VARINT);
      
      public static const MAPINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SnowMan_GetInfo_SC.mapInfo","mapInfo",6 << 3 | WireType.LENGTH_DELIMITED,SnowMan_MapInfo);
      
      public static const HASPRIVILEGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SnowMan_GetInfo_SC.hasPrivilege","hasPrivilege",7 << 3 | WireType.VARINT);
      
      public static const REMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_GetInfo_SC.remainTime","remainTime",8 << 3 | WireType.VARINT);
       
      
      private var iRemainChallenge$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var talentIdList:Array;
      
      public var plantList:Array;
      
      private var iReTicketChallenge$field:uint;
      
      public var mapInfo:Array;
      
      private var hasPrivilege$field:Boolean;
      
      private var remainTime$field:uint;
      
      public function Cmd_SnowMan_GetInfo_SC()
      {
         this.talentIdList = [];
         this.plantList = [];
         this.mapInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SnowMan_GetInfo_SC.$MessageID;
      }
      
      public function clearIRemainChallenge() : void
      {
         this.hasField$0 &= 4294967294;
         this.iRemainChallenge$field = new uint();
      }
      
      public function get hasIRemainChallenge() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iRemainChallenge(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iRemainChallenge$field = param1;
      }
      
      public function get iRemainChallenge() : uint
      {
         return this.iRemainChallenge$field;
      }
      
      public function clearIReTicketChallenge() : void
      {
         this.hasField$0 &= 4294967293;
         this.iReTicketChallenge$field = new uint();
      }
      
      public function get hasIReTicketChallenge() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iReTicketChallenge(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.iReTicketChallenge$field = param1;
      }
      
      public function get iReTicketChallenge() : uint
      {
         return this.iReTicketChallenge$field;
      }
      
      public function clearHasPrivilege() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasPrivilege$field = new Boolean();
      }
      
      public function get hasHasPrivilege() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasPrivilege(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasPrivilege$field = param1;
      }
      
      public function get hasPrivilege() : Boolean
      {
         return this.hasPrivilege$field;
      }
      
      public function clearRemainTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.remainTime$field = new uint();
      }
      
      public function get hasRemainTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set remainTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.remainTime$field = param1;
      }
      
      public function get remainTime() : uint
      {
         return this.remainTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasIRemainChallenge)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.iRemainChallenge$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.talentIdList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.talentIdList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.plantList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantList[_loc3_]);
            _loc3_++;
         }
         if(this.hasIReTicketChallenge)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.iReTicketChallenge$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.mapInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mapInfo[_loc4_]);
            _loc4_++;
         }
         if(this.hasHasPrivilege)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPrivilege$field);
         }
         if(this.hasRemainTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTime$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SnowMan_GetInfo_SC.iRemainChallenge cannot be set twice.");
                  }
                  _loc3_++;
                  this.iRemainChallenge = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if((_loc7_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.talentIdList);
                  }
                  else
                  {
                     this.talentIdList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 4:
                  this.plantList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlantInfo()));
                  break;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SnowMan_GetInfo_SC.iReTicketChallenge cannot be set twice.");
                  }
                  _loc4_++;
                  this.iReTicketChallenge = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.mapInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new SnowMan_MapInfo()));
                  break;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SnowMan_GetInfo_SC.hasPrivilege cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasPrivilege = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SnowMan_GetInfo_SC.remainTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.remainTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
