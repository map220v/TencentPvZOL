package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TD_FriendCard extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TD_FriendCard";
      
      public static const PLANTINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TD_FriendCard.plantInfo","plantInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const PLANTLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_FriendCard.plantLevel","plantLevel",2 << 3 | WireType.VARINT);
      
      public static const FRIENDTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_FriendCard.friendType","friendType",3 << 3 | WireType.VARINT);
      
      public static const FRIENDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TD_FriendCard.friendInfo","friendInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_FriendInfo);
      
      public static const TALENTIDLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_FriendCard.talentIdList","talentIdList",5 << 3 | WireType.VARINT);
       
      
      private var plantInfo$field:Dto_PlantInfo;
      
      private var plantLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var friendType$field:uint;
      
      private var friendInfo$field:Dto_FriendInfo;
      
      public var talentIdList:Array;
      
      public function Dto_TD_FriendCard()
      {
         this.talentIdList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TD_FriendCard.$MessageID;
      }
      
      public function clearPlantInfo() : void
      {
         this.plantInfo$field = null;
      }
      
      public function get hasPlantInfo() : Boolean
      {
         return this.plantInfo$field != null;
      }
      
      public function set plantInfo(param1:Dto_PlantInfo) : void
      {
         this.plantInfo$field = param1;
      }
      
      public function get plantInfo() : Dto_PlantInfo
      {
         return this.plantInfo$field;
      }
      
      public function clearPlantLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.plantLevel$field = new uint();
      }
      
      public function get hasPlantLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set plantLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.plantLevel$field = param1;
      }
      
      public function get plantLevel() : uint
      {
         return this.plantLevel$field;
      }
      
      public function clearFriendType() : void
      {
         this.hasField$0 &= 4294967293;
         this.friendType$field = new uint();
      }
      
      public function get hasFriendType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set friendType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.friendType$field = param1;
      }
      
      public function get friendType() : uint
      {
         return this.friendType$field;
      }
      
      public function clearFriendInfo() : void
      {
         this.friendInfo$field = null;
      }
      
      public function get hasFriendInfo() : Boolean
      {
         return this.friendInfo$field != null;
      }
      
      public function set friendInfo(param1:Dto_FriendInfo) : void
      {
         this.friendInfo$field = param1;
      }
      
      public function get friendInfo() : Dto_FriendInfo
      {
         return this.friendInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPlantInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantInfo$field);
         }
         if(this.hasPlantLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.plantLevel$field);
         }
         if(this.hasFriendType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.friendType$field);
         }
         if(this.hasFriendInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.friendInfo$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.talentIdList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.talentIdList[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_FriendCard.plantInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.plantInfo = new Dto_PlantInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.plantInfo);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_FriendCard.plantLevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.plantLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_FriendCard.friendType cannot be set twice.");
                  }
                  _loc5_++;
                  this.friendType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_FriendCard.friendInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.friendInfo = new Dto_FriendInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.friendInfo);
                  break;
               case 5:
                  if((_loc7_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.talentIdList);
                  }
                  else
                  {
                     this.talentIdList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
