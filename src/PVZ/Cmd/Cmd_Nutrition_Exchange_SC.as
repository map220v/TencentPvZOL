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
   
   public final class Cmd_Nutrition_Exchange_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_Exchange_SC";
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_Exchange_SC.exchangeId","exchangeId",1 << 3 | WireType.VARINT);
      
      public static const REAGENTUID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_Exchange_SC.reagentUId","reagentUId",2 << 3 | WireType.VARINT);
      
      public static const GOLDREAGENTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_Exchange_SC.goldReagentNum","goldReagentNum",3 << 3 | WireType.VARINT);
       
      
      private var exchangeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var reagentUId$field:uint;
      
      private var goldReagentNum$field:uint;
      
      public function Cmd_Nutrition_Exchange_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_Exchange_SC.$MessageID;
      }
      
      public function clearExchangeId() : void
      {
         this.hasField$0 &= 4294967294;
         this.exchangeId$field = new uint();
      }
      
      public function get hasExchangeId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exchangeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exchangeId$field = param1;
      }
      
      public function get exchangeId() : uint
      {
         return this.exchangeId$field;
      }
      
      public function clearReagentUId() : void
      {
         this.hasField$0 &= 4294967293;
         this.reagentUId$field = new uint();
      }
      
      public function get hasReagentUId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set reagentUId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.reagentUId$field = param1;
      }
      
      public function get reagentUId() : uint
      {
         return this.reagentUId$field;
      }
      
      public function clearGoldReagentNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.goldReagentNum$field = new uint();
      }
      
      public function get hasGoldReagentNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set goldReagentNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.goldReagentNum$field = param1;
      }
      
      public function get goldReagentNum() : uint
      {
         return this.goldReagentNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasExchangeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeId$field);
         }
         if(this.hasReagentUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.reagentUId$field);
         }
         if(this.hasGoldReagentNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.goldReagentNum$field);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_Exchange_SC.exchangeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.exchangeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_Exchange_SC.reagentUId cannot be set twice.");
                  }
                  _loc4_++;
                  this.reagentUId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_Exchange_SC.goldReagentNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.goldReagentNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
