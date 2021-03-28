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
   
   public final class Dto_Farm_BlockInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Farm_BlockInfo";
      
      public static const BLOCKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Farm_BlockInfo.blockId","blockId",1 << 3 | WireType.VARINT);
      
      public static const BLOCKTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Farm_BlockInfo.blockType","blockType",2 << 3 | WireType.VARINT);
      
      public static const PLANTINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Farm_BlockInfo.plantInfo","plantInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const FRIENDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Farm_BlockInfo.friendInfo","friendInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_FriendInfo);
      
      public static const COLLECTTIME:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Farm_BlockInfo.collectTime","collectTime",5 << 3 | WireType.VARINT);
      
      public static const STOLESUN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Farm_BlockInfo.stoleSun","stoleSun",6 << 3 | WireType.VARINT);
      
      public static const STOLECOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Farm_BlockInfo.stoleCoin","stoleCoin",7 << 3 | WireType.VARINT);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Farm_BlockInfo.status","status",8 << 3 | WireType.VARINT);
       
      
      private var blockId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var blockType$field:uint;
      
      private var plantInfo$field:Dto_PlantInfo;
      
      private var friendInfo$field:Dto_FriendInfo;
      
      public var collectTime:Array;
      
      private var stoleSun$field:uint;
      
      private var stoleCoin$field:uint;
      
      private var status$field:uint;
      
      public function Dto_Farm_BlockInfo()
      {
         this.collectTime = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Farm_BlockInfo.$MessageID;
      }
      
      public function clearBlockId() : void
      {
         this.hasField$0 &= 4294967294;
         this.blockId$field = new uint();
      }
      
      public function get hasBlockId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set blockId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.blockId$field = param1;
      }
      
      public function get blockId() : uint
      {
         return this.blockId$field;
      }
      
      public function clearBlockType() : void
      {
         this.hasField$0 &= 4294967293;
         this.blockType$field = new uint();
      }
      
      public function get hasBlockType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set blockType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.blockType$field = param1;
      }
      
      public function get blockType() : uint
      {
         return this.blockType$field;
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
      
      public function clearStoleSun() : void
      {
         this.hasField$0 &= 4294967291;
         this.stoleSun$field = new uint();
      }
      
      public function get hasStoleSun() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stoleSun(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stoleSun$field = param1;
      }
      
      public function get stoleSun() : uint
      {
         return this.stoleSun$field;
      }
      
      public function clearStoleCoin() : void
      {
         this.hasField$0 &= 4294967287;
         this.stoleCoin$field = new uint();
      }
      
      public function get hasStoleCoin() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set stoleCoin(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.stoleCoin$field = param1;
      }
      
      public function get stoleCoin() : uint
      {
         return this.stoleCoin$field;
      }
      
      public function clearStatus() : void
      {
         this.hasField$0 &= 4294967279;
         this.status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.status$field = param1;
      }
      
      public function get status() : uint
      {
         return this.status$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasBlockId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.blockId$field);
         }
         if(this.hasBlockType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.blockType$field);
         }
         if(this.hasPlantInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantInfo$field);
         }
         if(this.hasFriendInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.friendInfo$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.collectTime.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.collectTime[_loc2_]);
            _loc2_++;
         }
         if(this.hasStoleSun)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.stoleSun$field);
         }
         if(this.hasStoleCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.stoleCoin$field);
         }
         if(this.hasStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.status$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Farm_BlockInfo.blockId cannot be set twice.");
                  }
                  _loc3_++;
                  this.blockId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Farm_BlockInfo.blockType cannot be set twice.");
                  }
                  _loc4_++;
                  this.blockType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Farm_BlockInfo.plantInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.plantInfo = new Dto_PlantInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.plantInfo);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Farm_BlockInfo.friendInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.friendInfo = new Dto_FriendInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.friendInfo);
                  break;
               case 5:
                  if((_loc10_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.collectTime);
                  }
                  else
                  {
                     this.collectTime.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Farm_BlockInfo.stoleSun cannot be set twice.");
                  }
                  _loc7_++;
                  this.stoleSun = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Farm_BlockInfo.stoleCoin cannot be set twice.");
                  }
                  _loc8_++;
                  this.stoleCoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Farm_BlockInfo.status cannot be set twice.");
                  }
                  _loc9_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
