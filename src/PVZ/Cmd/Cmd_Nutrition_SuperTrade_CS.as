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
   
   public final class Cmd_Nutrition_SuperTrade_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_SuperTrade_CS";
      
      public static const COSTTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_CS.costType","costType",1 << 3 | WireType.VARINT);
      
      public static const CHANGETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_CS.changeType","changeType",2 << 3 | WireType.VARINT);
       
      
      private var costType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var changeType$field:uint;
      
      public function Cmd_Nutrition_SuperTrade_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_SuperTrade_CS.$MessageID;
      }
      
      public function clearCostType() : void
      {
         this.hasField$0 &= 4294967294;
         this.costType$field = new uint();
      }
      
      public function get hasCostType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set costType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.costType$field = param1;
      }
      
      public function get costType() : uint
      {
         return this.costType$field;
      }
      
      public function clearChangeType() : void
      {
         this.hasField$0 &= 4294967293;
         this.changeType$field = new uint();
      }
      
      public function get hasChangeType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set changeType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.changeType$field = param1;
      }
      
      public function get changeType() : uint
      {
         return this.changeType$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCostType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.costType$field);
         }
         if(this.hasChangeType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.changeType$field);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_SuperTrade_CS.costType cannot be set twice.");
                  }
                  _loc3_++;
                  this.costType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_SuperTrade_CS.changeType cannot be set twice.");
                  }
                  _loc4_++;
                  this.changeType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
