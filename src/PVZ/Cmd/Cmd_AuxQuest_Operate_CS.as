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
   
   public final class Cmd_AuxQuest_Operate_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_AuxQuest_Operate_CS";
      
      public static const AUXQUESTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AuxQuest_Operate_CS.auxQuestId","auxQuestId",1 << 3 | WireType.VARINT);
      
      public static const DEALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AuxQuest_Operate_CS.dealNum","dealNum",2 << 3 | WireType.VARINT);
       
      
      private var auxQuestId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dealNum$field:uint;
      
      public function Cmd_AuxQuest_Operate_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_AuxQuest_Operate_CS.$MessageID;
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
      
      public function clearDealNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.dealNum$field = new uint();
      }
      
      public function get hasDealNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set dealNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.dealNum$field = param1;
      }
      
      public function get dealNum() : uint
      {
         return this.dealNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAuxQuestId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.auxQuestId$field);
         }
         if(this.hasDealNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.dealNum$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AuxQuest_Operate_CS.auxQuestId cannot be set twice.");
                  }
                  _loc3_++;
                  this.auxQuestId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AuxQuest_Operate_CS.dealNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.dealNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
