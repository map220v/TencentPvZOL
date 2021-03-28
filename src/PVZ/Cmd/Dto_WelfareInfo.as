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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_WelfareInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_WelfareInfo";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WelfareInfo.type","type",1 << 3 | WireType.VARINT);
      
      public static const CANTAKE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_WelfareInfo.canTake","canTake",2 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_WelfareInfo.items","items",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const HASTAKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_WelfareInfo.hasTaken","hasTaken",4 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WelfareInfo.level","level",5 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WelfareInfo.power","power",6 << 3 | WireType.VARINT);
      
      public static const WORTHTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WelfareInfo.worthTicket","worthTicket",7 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var canTake$field:Boolean;
      
      public var items:Array;
      
      private var hasTaken$field:Boolean;
      
      private var level$field:uint;
      
      private var power$field:uint;
      
      private var worthTicket$field:uint;
      
      public function Dto_WelfareInfo()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_WelfareInfo.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearCanTake() : void
      {
         this.hasField$0 &= 4294967293;
         this.canTake$field = new Boolean();
      }
      
      public function get hasCanTake() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set canTake(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.canTake$field = param1;
      }
      
      public function get canTake() : Boolean
      {
         return this.canTake$field;
      }
      
      public function clearHasTaken() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasTaken$field = new Boolean();
      }
      
      public function get hasHasTaken() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasTaken(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasTaken$field = param1;
      }
      
      public function get hasTaken() : Boolean
      {
         return this.hasTaken$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967287;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967279;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      public function clearWorthTicket() : void
      {
         this.hasField$0 &= 4294967263;
         this.worthTicket$field = new uint();
      }
      
      public function get hasWorthTicket() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set worthTicket(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.worthTicket$field = param1;
      }
      
      public function get worthTicket() : uint
      {
         return this.worthTicket$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasCanTake)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.canTake$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasTaken)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTaken$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasWorthTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.worthTicket$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WelfareInfo.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WelfareInfo.canTake cannot be set twice.");
                  }
                  _loc4_++;
                  this.canTake = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WelfareInfo.hasTaken cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasTaken = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WelfareInfo.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WelfareInfo.power cannot be set twice.");
                  }
                  _loc7_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WelfareInfo.worthTicket cannot be set twice.");
                  }
                  _loc8_++;
                  this.worthTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
