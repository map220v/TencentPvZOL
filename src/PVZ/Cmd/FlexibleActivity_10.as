package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_10 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_10";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_10.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const DAILYCOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_10.dailycoin","dailycoin",2 << 3 | WireType.VARINT);
      
      public static const RESULT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_10.result","result",3 << 3 | WireType.LENGTH_DELIMITED,Dto_SlotMachineReward);
      
      public static const EXCHANGEITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_10.exchangeitems","exchangeitems",4 << 3 | WireType.LENGTH_DELIMITED,Dto_SlotMachineExchange);
      
      public static const USECREDITREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_10.usecreditreward","usecreditreward",5 << 3 | WireType.LENGTH_DELIMITED,Dto_SlotMachineCredit);
      
      public static const MACHINEITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_10.machineitems","machineitems",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TOTALCREDITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_10.totalcredits","totalcredits",7 << 3 | WireType.VARINT);
      
      public static const CONSUMEDCREDITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_10.consumedcredits","consumedcredits",8 << 3 | WireType.VARINT);
      
      public static const CANTAKECOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_10.cantakecoin","cantakecoin",9 << 3 | WireType.VARINT);
      
      public static const LASTTAKECOINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_10.lasttakecointime","lasttakecointime",10 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dailycoin$field:uint;
      
      public var result:Array;
      
      public var exchangeitems:Array;
      
      public var usecreditreward:Array;
      
      public var machineitems:Array;
      
      private var totalcredits$field:uint;
      
      private var consumedcredits$field:uint;
      
      private var cantakecoin$field:uint;
      
      private var lasttakecointime$field:uint;
      
      public function FlexibleActivity_10()
      {
         this.result = [];
         this.exchangeitems = [];
         this.usecreditreward = [];
         this.machineitems = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_10.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearDailycoin() : void
      {
         this.hasField$0 &= 4294967293;
         this.dailycoin$field = new uint();
      }
      
      public function get hasDailycoin() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set dailycoin(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.dailycoin$field = param1;
      }
      
      public function get dailycoin() : uint
      {
         return this.dailycoin$field;
      }
      
      public function clearTotalcredits() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalcredits$field = new uint();
      }
      
      public function get hasTotalcredits() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalcredits(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalcredits$field = param1;
      }
      
      public function get totalcredits() : uint
      {
         return this.totalcredits$field;
      }
      
      public function clearConsumedcredits() : void
      {
         this.hasField$0 &= 4294967287;
         this.consumedcredits$field = new uint();
      }
      
      public function get hasConsumedcredits() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set consumedcredits(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.consumedcredits$field = param1;
      }
      
      public function get consumedcredits() : uint
      {
         return this.consumedcredits$field;
      }
      
      public function clearCantakecoin() : void
      {
         this.hasField$0 &= 4294967279;
         this.cantakecoin$field = new uint();
      }
      
      public function get hasCantakecoin() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set cantakecoin(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.cantakecoin$field = param1;
      }
      
      public function get cantakecoin() : uint
      {
         return this.cantakecoin$field;
      }
      
      public function clearLasttakecointime() : void
      {
         this.hasField$0 &= 4294967263;
         this.lasttakecointime$field = new uint();
      }
      
      public function get hasLasttakecointime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set lasttakecointime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.lasttakecointime$field = param1;
      }
      
      public function get lasttakecointime() : uint
      {
         return this.lasttakecointime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasDailycoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.dailycoin$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.result.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.result[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.exchangeitems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.exchangeitems[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.usecreditreward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.usecreditreward[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.machineitems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.machineitems[_loc5_]);
            _loc5_++;
         }
         if(this.hasTotalcredits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.totalcredits$field);
         }
         if(this.hasConsumedcredits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.consumedcredits$field);
         }
         if(this.hasCantakecoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.cantakecoin$field);
         }
         if(this.hasLasttakecointime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.lasttakecointime$field);
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
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
                     throw new IOError("Bad data format: FlexibleActivity_10.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_10.dailycoin cannot be set twice.");
                  }
                  _loc4_++;
                  this.dailycoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.result.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_SlotMachineReward()));
                  break;
               case 4:
                  this.exchangeitems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_SlotMachineExchange()));
                  break;
               case 5:
                  this.usecreditreward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_SlotMachineCredit()));
                  break;
               case 6:
                  this.machineitems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_10.totalcredits cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalcredits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_10.consumedcredits cannot be set twice.");
                  }
                  _loc6_++;
                  this.consumedcredits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_10.cantakecoin cannot be set twice.");
                  }
                  _loc7_++;
                  this.cantakecoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_10.lasttakecointime cannot be set twice.");
                  }
                  _loc8_++;
                  this.lasttakecointime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
