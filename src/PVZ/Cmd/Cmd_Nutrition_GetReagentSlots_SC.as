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
   
   public final class Cmd_Nutrition_GetReagentSlots_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_GetReagentSlots_SC";
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_GetReagentSlots_SC.position","position",1 << 3 | WireType.VARINT);
      
      public static const SLOTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Nutrition_GetReagentSlots_SC.slotList","slotList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ReagentSlot);
       
      
      private var position$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var slotList:Array;
      
      public function Cmd_Nutrition_GetReagentSlots_SC()
      {
         this.slotList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_GetReagentSlots_SC.$MessageID;
      }
      
      public function clearPosition() : void
      {
         this.hasField$0 &= 4294967294;
         this.position$field = new uint();
      }
      
      public function get hasPosition() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set position(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.position$field = param1;
      }
      
      public function get position() : uint
      {
         return this.position$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.position$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.slotList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.slotList[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_GetReagentSlots_SC.position cannot be set twice.");
                  }
                  _loc3_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.slotList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ReagentSlot()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
