package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_AuxQuest_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AuxQuest_Info";
      
      public static const AUXQUESTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AuxQuest_Info.auxQuestId","auxQuestId",1 << 3 | WireType.VARINT);
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AuxQuest_Info.state","state",2 << 3 | WireType.VARINT);
      
      public static const FINISHNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AuxQuest_Info.finishNum","finishNum",3 << 3 | WireType.VARINT);
       
      
      private var auxQuestId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var state$field:uint;
      
      private var finishNum$field:uint;
      
      public function Dto_AuxQuest_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AuxQuest_Info.$MessageID;
      }
      
      public function clearAuxQuestId() : void
      {
         this.hasField$0 &= 4294967294;
         this.auxQuestId$field = new uint();
      }
      
      public function get hasAuxQuestId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set auxQuestId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.auxQuestId$field = param1;
      }
      
      public function get auxQuestId() : uint
      {
         return this.auxQuestId$field;
      }
      
      public function clearState() : void
      {
         this.hasField$0 &= 4294967293;
         this.state$field = new uint();
      }
      
      public function get hasState() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set state(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.state$field = param1;
      }
      
      public function get state() : uint
      {
         return this.state$field;
      }
      
      public function clearFinishNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.finishNum$field = new uint();
      }
      
      public function get hasFinishNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set finishNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.finishNum$field = param1;
      }
      
      public function get finishNum() : uint
      {
         return this.finishNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAuxQuestId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.auxQuestId$field);
         }
         if(this.hasState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.state$field);
         }
         if(this.hasFinishNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.finishNum$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AuxQuest_Info.auxQuestId cannot be set twice.");
                  }
                  _loc3_++;
                  this.auxQuestId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AuxQuest_Info.state cannot be set twice.");
                  }
                  _loc4_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AuxQuest_Info.finishNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.finishNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
