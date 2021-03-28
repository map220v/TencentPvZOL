package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TreasureReport extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TreasureReport";
      
      public static const TREASUREREPORTTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TreasureReport.treasureReportType","treasureReportType",1 << 3 | WireType.VARINT);
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TreasureReport.attacker","attacker",2 << 3 | WireType.LENGTH_DELIMITED,Dto_TreasureFightReport);
      
      public static const LEFT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TreasureReport.left","left",3 << 3 | WireType.LENGTH_DELIMITED,Dto_TreasureFightReport);
      
      public static const RIGHT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TreasureReport.right","right",4 << 3 | WireType.LENGTH_DELIMITED,Dto_TreasureFightReport);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TreasureReport.time","time",5 << 3 | WireType.VARINT);
       
      
      private var treasureReportType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var attacker$field:Dto_TreasureFightReport;
      
      private var left$field:Dto_TreasureFightReport;
      
      private var right$field:Dto_TreasureFightReport;
      
      private var time$field:uint;
      
      public function Dto_TreasureReport()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TreasureReport.$MessageID;
      }
      
      public function clearTreasureReportType() : void
      {
         this.hasField$0 &= 4294967294;
         this.treasureReportType$field = new uint();
      }
      
      public function get hasTreasureReportType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set treasureReportType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.treasureReportType$field = param1;
      }
      
      public function get treasureReportType() : uint
      {
         return this.treasureReportType$field;
      }
      
      public function clearAttacker() : void
      {
         this.attacker$field = null;
      }
      
      public function get hasAttacker() : Boolean
      {
         return this.attacker$field != null;
      }
      
      public function set attacker(param1:Dto_TreasureFightReport) : void
      {
         this.attacker$field = param1;
      }
      
      public function get attacker() : Dto_TreasureFightReport
      {
         return this.attacker$field;
      }
      
      public function clearLeft() : void
      {
         this.left$field = null;
      }
      
      public function get hasLeft() : Boolean
      {
         return this.left$field != null;
      }
      
      public function set left(param1:Dto_TreasureFightReport) : void
      {
         this.left$field = param1;
      }
      
      public function get left() : Dto_TreasureFightReport
      {
         return this.left$field;
      }
      
      public function clearRight() : void
      {
         this.right$field = null;
      }
      
      public function get hasRight() : Boolean
      {
         return this.right$field != null;
      }
      
      public function set right(param1:Dto_TreasureFightReport) : void
      {
         this.right$field = param1;
      }
      
      public function get right() : Dto_TreasureFightReport
      {
         return this.right$field;
      }
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTreasureReportType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.treasureReportType$field);
         }
         if(this.hasAttacker)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.attacker$field);
         }
         if(this.hasLeft)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.left$field);
         }
         if(this.hasRight)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.right$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureReport.treasureReportType cannot be set twice.");
                  }
                  _loc3_++;
                  this.treasureReportType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureReport.attacker cannot be set twice.");
                  }
                  _loc4_++;
                  this.attacker = new Dto_TreasureFightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureReport.left cannot be set twice.");
                  }
                  _loc5_++;
                  this.left = new Dto_TreasureFightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.left);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureReport.right cannot be set twice.");
                  }
                  _loc6_++;
                  this.right = new Dto_TreasureFightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.right);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureReport.time cannot be set twice.");
                  }
                  _loc7_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
