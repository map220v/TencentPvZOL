package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_1005 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_1005";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const ACTIVITYITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.activityitemid","activityitemid",2 << 3 | WireType.VARINT);
      
      public static const ONESUMMONLOWWEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.onesummonlowweight","onesummonlowweight",3 << 3 | WireType.VARINT);
      
      public static const ONESUMMONHIGHWEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.onesummonhighweight","onesummonhighweight",4 << 3 | WireType.VARINT);
      
      public static const TENSUMMONLOWWEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.tensummonlowweight","tensummonlowweight",5 << 3 | WireType.VARINT);
      
      public static const TENSUMMONHIGHWEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.tensummonhighweight","tensummonhighweight",6 << 3 | WireType.VARINT);
      
      public static const ACTIVITYMEMBERNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.activitymembernum","activitymembernum",7 << 3 | WireType.VARINT);
      
      public static const LACKMEMBERCOST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.lackmembercost","lackmembercost",8 << 3 | WireType.VARINT);
      
      public static const PARTSETOUTCREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.partsetoutcredit","partsetoutcredit",9 << 3 | WireType.VARINT);
      
      public static const ALLSETOUTCREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.allsetoutcredit","allsetoutcredit",10 << 3 | WireType.VARINT);
      
      public static const EXCHANGEITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1005.exchangeitems","exchangeitems",11 << 3 | WireType.LENGTH_DELIMITED,Dto_DragonBoatExchange);
      
      public static const ACTIVITYMEMBERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1005.activitymembers","activitymembers",12 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1005.credit","credit",13 << 3 | WireType.VARINT);
       
      
      public var activityid:uint;
      
      public var activityitemid:uint;
      
      public var onesummonlowweight:uint;
      
      public var onesummonhighweight:uint;
      
      public var tensummonlowweight:uint;
      
      public var tensummonhighweight:uint;
      
      public var activitymembernum:uint;
      
      public var lackmembercost:Array;
      
      public var partsetoutcredit:uint;
      
      public var allsetoutcredit:uint;
      
      public var exchangeitems:Array;
      
      public var activitymembers:Array;
      
      private var credit$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function FlexibleActivity_1005()
      {
         this.lackmembercost = [];
         this.exchangeitems = [];
         this.activitymembers = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_1005.$MessageID;
      }
      
      public function clearCredit() : void
      {
         this.hasField$0 &= 4294967294;
         this.credit$field = new uint();
      }
      
      public function get hasCredit() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set credit(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.credit$field = param1;
      }
      
      public function get credit() : uint
      {
         return this.credit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.activityid);
         WriteUtils.writeTag(param1,WireType.VARINT,2);
         WriteUtils.write$TYPE_UINT32(param1,this.activityitemid);
         WriteUtils.writeTag(param1,WireType.VARINT,3);
         WriteUtils.write$TYPE_UINT32(param1,this.onesummonlowweight);
         WriteUtils.writeTag(param1,WireType.VARINT,4);
         WriteUtils.write$TYPE_UINT32(param1,this.onesummonhighweight);
         WriteUtils.writeTag(param1,WireType.VARINT,5);
         WriteUtils.write$TYPE_UINT32(param1,this.tensummonlowweight);
         WriteUtils.writeTag(param1,WireType.VARINT,6);
         WriteUtils.write$TYPE_UINT32(param1,this.tensummonhighweight);
         WriteUtils.writeTag(param1,WireType.VARINT,7);
         WriteUtils.write$TYPE_UINT32(param1,this.activitymembernum);
         var _loc2_:uint = 0;
         while(_loc2_ < this.lackmembercost.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.lackmembercost[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,WireType.VARINT,9);
         WriteUtils.write$TYPE_UINT32(param1,this.partsetoutcredit);
         WriteUtils.writeTag(param1,WireType.VARINT,10);
         WriteUtils.write$TYPE_UINT32(param1,this.allsetoutcredit);
         var _loc3_:uint = 0;
         while(_loc3_ < this.exchangeitems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.exchangeitems[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.activitymembers.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.activitymembers[_loc4_]);
            _loc4_++;
         }
         if(this.hasCredit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.credit$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.activityitemid cannot be set twice.");
                  }
                  _loc4_++;
                  this.activityitemid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.onesummonlowweight cannot be set twice.");
                  }
                  _loc5_++;
                  this.onesummonlowweight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.onesummonhighweight cannot be set twice.");
                  }
                  _loc6_++;
                  this.onesummonhighweight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.tensummonlowweight cannot be set twice.");
                  }
                  _loc7_++;
                  this.tensummonlowweight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.tensummonhighweight cannot be set twice.");
                  }
                  _loc8_++;
                  this.tensummonhighweight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.activitymembernum cannot be set twice.");
                  }
                  _loc9_++;
                  this.activitymembernum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if((_loc13_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.lackmembercost);
                  }
                  else
                  {
                     this.lackmembercost.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.partsetoutcredit cannot be set twice.");
                  }
                  _loc10_++;
                  this.partsetoutcredit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.allsetoutcredit cannot be set twice.");
                  }
                  _loc11_++;
                  this.allsetoutcredit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  this.exchangeitems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_DragonBoatExchange()));
                  break;
               case 12:
                  this.activitymembers.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 13:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1005.credit cannot be set twice.");
                  }
                  _loc12_++;
                  this.credit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
