package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Fund_BaseInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Fund_BaseInfo";
      
      public static const FUNDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BaseInfo.fundId","fundId",1 << 3 | WireType.VARINT);
      
      public static const SEQ:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BaseInfo.seq","seq",2 << 3 | WireType.VARINT);
      
      public static const ISOPEN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BaseInfo.isOpen","isOpen",3 << 3 | WireType.VARINT);
      
      public static const PRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BaseInfo.price","price",4 << 3 | WireType.VARINT);
      
      public static const INSTANTRATIO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BaseInfo.instantRatio","instantRatio",5 << 3 | WireType.VARINT);
      
      public static const TOTALRATIO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BaseInfo.totalRatio","totalRatio",6 << 3 | WireType.VARINT);
      
      public static const WEEKDIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BaseInfo.weekDiamond","weekDiamond",7 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Fund_BaseInfo.name","name",8 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const INSTANTREWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Fund_BaseInfo.instantReward","instantReward",9 << 3 | WireType.LENGTH_DELIMITED,Dto_Fund_RewardPkg);
      
      public static const REWARDPKG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Fund_BaseInfo.rewardPkg","rewardPkg",10 << 3 | WireType.LENGTH_DELIMITED,Dto_Fund_RewardPkg);
       
      
      private var fundId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var seq$field:uint;
      
      private var isOpen$field:uint;
      
      private var price$field:uint;
      
      private var instantRatio$field:uint;
      
      private var totalRatio$field:uint;
      
      private var weekDiamond$field:uint;
      
      private var name$field:String;
      
      private var instantReward$field:Dto_Fund_RewardPkg;
      
      public var rewardPkg:Array;
      
      public function Dto_Fund_BaseInfo()
      {
         this.rewardPkg = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Fund_BaseInfo.$MessageID;
      }
      
      public function clearFundId() : void
      {
         this.hasField$0 &= 4294967294;
         this.fundId$field = new uint();
      }
      
      public function get hasFundId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fundId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fundId$field = param1;
      }
      
      public function get fundId() : uint
      {
         return this.fundId$field;
      }
      
      public function clearSeq() : void
      {
         this.hasField$0 &= 4294967293;
         this.seq$field = new uint();
      }
      
      public function get hasSeq() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set seq(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.seq$field = param1;
      }
      
      public function get seq() : uint
      {
         return this.seq$field;
      }
      
      public function clearIsOpen() : void
      {
         this.hasField$0 &= 4294967291;
         this.isOpen$field = new uint();
      }
      
      public function get hasIsOpen() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set isOpen(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.isOpen$field = param1;
      }
      
      public function get isOpen() : uint
      {
         return this.isOpen$field;
      }
      
      public function clearPrice() : void
      {
         this.hasField$0 &= 4294967287;
         this.price$field = new uint();
      }
      
      public function get hasPrice() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set price(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.price$field = param1;
      }
      
      public function get price() : uint
      {
         return this.price$field;
      }
      
      public function clearInstantRatio() : void
      {
         this.hasField$0 &= 4294967279;
         this.instantRatio$field = new uint();
      }
      
      public function get hasInstantRatio() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set instantRatio(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.instantRatio$field = param1;
      }
      
      public function get instantRatio() : uint
      {
         return this.instantRatio$field;
      }
      
      public function clearTotalRatio() : void
      {
         this.hasField$0 &= 4294967263;
         this.totalRatio$field = new uint();
      }
      
      public function get hasTotalRatio() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set totalRatio(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.totalRatio$field = param1;
      }
      
      public function get totalRatio() : uint
      {
         return this.totalRatio$field;
      }
      
      public function clearWeekDiamond() : void
      {
         this.hasField$0 &= 4294967231;
         this.weekDiamond$field = new uint();
      }
      
      public function get hasWeekDiamond() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set weekDiamond(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.weekDiamond$field = param1;
      }
      
      public function get weekDiamond() : uint
      {
         return this.weekDiamond$field;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearInstantReward() : void
      {
         this.instantReward$field = null;
      }
      
      public function get hasInstantReward() : Boolean
      {
         return this.instantReward$field != null;
      }
      
      public function set instantReward(param1:Dto_Fund_RewardPkg) : void
      {
         this.instantReward$field = param1;
      }
      
      public function get instantReward() : Dto_Fund_RewardPkg
      {
         return this.instantReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasFundId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fundId$field);
         }
         if(this.hasSeq)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.seq$field);
         }
         if(this.hasIsOpen)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.isOpen$field);
         }
         if(this.hasPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.price$field);
         }
         if(this.hasInstantRatio)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.instantRatio$field);
         }
         if(this.hasTotalRatio)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.totalRatio$field);
         }
         if(this.hasWeekDiamond)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.weekDiamond$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasInstantReward)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.instantReward$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardPkg.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardPkg[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc12_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc12_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.fundId cannot be set twice.");
                  }
                  _loc3_++;
                  this.fundId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.seq cannot be set twice.");
                  }
                  _loc4_++;
                  this.seq = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.isOpen cannot be set twice.");
                  }
                  _loc5_++;
                  this.isOpen = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.price cannot be set twice.");
                  }
                  _loc6_++;
                  this.price = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.instantRatio cannot be set twice.");
                  }
                  _loc7_++;
                  this.instantRatio = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.totalRatio cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalRatio = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.weekDiamond cannot be set twice.");
                  }
                  _loc9_++;
                  this.weekDiamond = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.name cannot be set twice.");
                  }
                  _loc10_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BaseInfo.instantReward cannot be set twice.");
                  }
                  _loc11_++;
                  this.instantReward = new Dto_Fund_RewardPkg();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.instantReward);
                  break;
               case 10:
                  this.rewardPkg.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Fund_RewardPkg()));
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
