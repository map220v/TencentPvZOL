package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NewScrewUp_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC";
      
      public static const CURRENTSTAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC.currentStage","currentStage",1 << 3 | WireType.VARINT);
      
      public static const MAXSTAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC.maxStage","maxStage",2 << 3 | WireType.VARINT);
      
      public static const RESTARTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC.restartNum","restartNum",3 << 3 | WireType.VARINT);
      
      public static const BOXTAKEN:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC.boxTaken","boxTaken",4 << 3 | WireType.VARINT);
      
      public static const BOXTOTAL:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC.boxTotal","boxTotal",5 << 3 | WireType.VARINT);
      
      public static const REMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC.remainTime","remainTime",6 << 3 | WireType.VARINT);
      
      public static const VIPRESTARTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_GetInfo_SC.vipRestartNum","vipRestartNum",7 << 3 | WireType.VARINT);
       
      
      private var currentStage$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxStage$field:uint;
      
      private var restartNum$field:uint;
      
      public var boxTaken:Array;
      
      public var boxTotal:Array;
      
      private var remainTime$field:uint;
      
      private var vipRestartNum$field:uint;
      
      public function Cmd_NewScrewUp_GetInfo_SC()
      {
         this.boxTaken = [];
         this.boxTotal = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NewScrewUp_GetInfo_SC.$MessageID;
      }
      
      public function clearCurrentStage() : void
      {
         this.hasField$0 &= 4294967294;
         this.currentStage$field = new uint();
      }
      
      public function get hasCurrentStage() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set currentStage(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.currentStage$field = param1;
      }
      
      public function get currentStage() : uint
      {
         return this.currentStage$field;
      }
      
      public function clearMaxStage() : void
      {
         this.hasField$0 &= 4294967293;
         this.maxStage$field = new uint();
      }
      
      public function get hasMaxStage() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set maxStage(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.maxStage$field = param1;
      }
      
      public function get maxStage() : uint
      {
         return this.maxStage$field;
      }
      
      public function clearRestartNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.restartNum$field = new uint();
      }
      
      public function get hasRestartNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set restartNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.restartNum$field = param1;
      }
      
      public function get restartNum() : uint
      {
         return this.restartNum$field;
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
      
      public function clearVipRestartNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.vipRestartNum$field = new uint();
      }
      
      public function get hasVipRestartNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set vipRestartNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.vipRestartNum$field = param1;
      }
      
      public function get vipRestartNum() : uint
      {
         return this.vipRestartNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasCurrentStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.currentStage$field);
         }
         if(this.hasMaxStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.maxStage$field);
         }
         if(this.hasRestartNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.restartNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.boxTaken.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.boxTaken[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.boxTotal.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.boxTotal[_loc3_]);
            _loc3_++;
         }
         if(this.hasRemainTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTime$field);
         }
         if(this.hasVipRestartNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.vipRestartNum$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Cmd_NewScrewUp_GetInfo_SC.currentStage cannot be set twice.");
                  }
                  _loc3_++;
                  this.currentStage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_GetInfo_SC.maxStage cannot be set twice.");
                  }
                  _loc4_++;
                  this.maxStage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_GetInfo_SC.restartNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.restartNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.boxTaken);
                  }
                  else
                  {
                     this.boxTaken.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 5:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.boxTotal);
                  }
                  else
                  {
                     this.boxTotal.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_GetInfo_SC.remainTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.remainTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_GetInfo_SC.vipRestartNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.vipRestartNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
