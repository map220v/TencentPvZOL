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
   
   public final class Cmd_Nutrition_ExchangePosition_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_ExchangePosition_CS";
      
      public static const SRCPOSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ExchangePosition_CS.srcPosition","srcPosition",1 << 3 | WireType.VARINT);
      
      public static const DESTPOSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ExchangePosition_CS.destPosition","destPosition",2 << 3 | WireType.VARINT);
       
      
      private var srcPosition$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var destPosition$field:uint;
      
      public function Cmd_Nutrition_ExchangePosition_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_ExchangePosition_CS.$MessageID;
      }
      
      public function clearSrcPosition() : void
      {
         this.hasField$0 &= 4294967294;
         this.srcPosition$field = new uint();
      }
      
      public function get hasSrcPosition() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set srcPosition(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.srcPosition$field = param1;
      }
      
      public function get srcPosition() : uint
      {
         return this.srcPosition$field;
      }
      
      public function clearDestPosition() : void
      {
         this.hasField$0 &= 4294967293;
         this.destPosition$field = new uint();
      }
      
      public function get hasDestPosition() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set destPosition(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.destPosition$field = param1;
      }
      
      public function get destPosition() : uint
      {
         return this.destPosition$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSrcPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.srcPosition$field);
         }
         if(this.hasDestPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.destPosition$field);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_ExchangePosition_CS.srcPosition cannot be set twice.");
                  }
                  _loc3_++;
                  this.srcPosition = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ExchangePosition_CS.destPosition cannot be set twice.");
                  }
                  _loc4_++;
                  this.destPosition = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
