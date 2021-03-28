package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Nutrition_ExtractExp_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_ExtractExp_SC";
      
      public static const REAGENTUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Nutrition_ExtractExp_SC.reagentUID","reagentUID",1 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ExtractExp_SC.exp","exp",2 << 3 | WireType.VARINT);
      
      public static const BOTTLEEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ExtractExp_SC.bottleExp","bottleExp",3 << 3 | WireType.VARINT);
       
      
      private var reagentUID$field:Int64;
      
      private var exp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var bottleExp$field:uint;
      
      public function Cmd_Nutrition_ExtractExp_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_ExtractExp_SC.$MessageID;
      }
      
      public function clearReagentUID() : void
      {
         this.reagentUID$field = null;
      }
      
      public function get hasReagentUID() : Boolean
      {
         return this.reagentUID$field != null;
      }
      
      public function set reagentUID(param1:Int64) : void
      {
         this.reagentUID$field = param1;
      }
      
      public function get reagentUID() : Int64
      {
         return this.reagentUID$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearBottleExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.bottleExp$field = new uint();
      }
      
      public function get hasBottleExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set bottleExp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.bottleExp$field = param1;
      }
      
      public function get bottleExp() : uint
      {
         return this.bottleExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReagentUID)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.reagentUID$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasBottleExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.bottleExp$field);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_ExtractExp_SC.reagentUID cannot be set twice.");
                  }
                  _loc3_++;
                  this.reagentUID = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ExtractExp_SC.exp cannot be set twice.");
                  }
                  _loc4_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ExtractExp_SC.bottleExp cannot be set twice.");
                  }
                  _loc5_++;
                  this.bottleExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
