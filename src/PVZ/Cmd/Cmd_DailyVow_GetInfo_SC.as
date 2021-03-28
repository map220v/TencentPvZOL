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
   
   public final class Cmd_DailyVow_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyVow_GetInfo_SC";
      
      public static const INFOLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyVow_GetInfo_SC.infoList","infoList",1 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyVow_Info);
      
      public static const ALLVOWTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyVow_GetInfo_SC.allVowTimes","allVowTimes",2 << 3 | WireType.VARINT);
      
      public static const VOWPOOLLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyVow_GetInfo_SC.vowPoolLevel","vowPoolLevel",3 << 3 | WireType.VARINT);
      
      public static const VOWPOOLEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyVow_GetInfo_SC.vowPoolExp","vowPoolExp",4 << 3 | WireType.VARINT);
       
      
      public var infoList:Array;
      
      private var allVowTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var vowPoolLevel$field:uint;
      
      private var vowPoolExp$field:uint;
      
      public function Cmd_DailyVow_GetInfo_SC()
      {
         this.infoList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyVow_GetInfo_SC.$MessageID;
      }
      
      public function clearAllVowTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.allVowTimes$field = new uint();
      }
      
      public function get hasAllVowTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set allVowTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.allVowTimes$field = param1;
      }
      
      public function get allVowTimes() : uint
      {
         return this.allVowTimes$field;
      }
      
      public function clearVowPoolLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.vowPoolLevel$field = new uint();
      }
      
      public function get hasVowPoolLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set vowPoolLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.vowPoolLevel$field = param1;
      }
      
      public function get vowPoolLevel() : uint
      {
         return this.vowPoolLevel$field;
      }
      
      public function clearVowPoolExp() : void
      {
         this.hasField$0 &= 4294967291;
         this.vowPoolExp$field = new uint();
      }
      
      public function get hasVowPoolExp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set vowPoolExp(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.vowPoolExp$field = param1;
      }
      
      public function get vowPoolExp() : uint
      {
         return this.vowPoolExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.infoList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.infoList[_loc2_]);
            _loc2_++;
         }
         if(this.hasAllVowTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.allVowTimes$field);
         }
         if(this.hasVowPoolLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.vowPoolLevel$field);
         }
         if(this.hasVowPoolExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.vowPoolExp$field);
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
                  this.infoList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_DailyVow_Info()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyVow_GetInfo_SC.allVowTimes cannot be set twice.");
                  }
                  _loc3_++;
                  this.allVowTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyVow_GetInfo_SC.vowPoolLevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.vowPoolLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyVow_GetInfo_SC.vowPoolExp cannot be set twice.");
                  }
                  _loc5_++;
                  this.vowPoolExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
