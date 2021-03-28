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
   
   public final class Cmd_Garden_BuyFertilizer_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Garden_BuyFertilizer_SC";
      
      public static const FERTILIZERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_BuyFertilizer_SC.fertilizerid","fertilizerid",1 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_BuyFertilizer_SC.num","num",2 << 3 | WireType.VARINT);
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_BuyFertilizer_SC.totalnum","totalnum",3 << 3 | WireType.VARINT);
       
      
      private var fertilizerid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var num$field:uint;
      
      private var totalnum$field:uint;
      
      public function Cmd_Garden_BuyFertilizer_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Garden_BuyFertilizer_SC.$MessageID;
      }
      
      public function clearFertilizerid() : void
      {
         this.hasField$0 &= 4294967294;
         this.fertilizerid$field = new uint();
      }
      
      public function get hasFertilizerid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fertilizerid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fertilizerid$field = param1;
      }
      
      public function get fertilizerid() : uint
      {
         return this.fertilizerid$field;
      }
      
      public function clearNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.num$field = param1;
      }
      
      public function get num() : uint
      {
         return this.num$field;
      }
      
      public function clearTotalnum() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalnum$field = new uint();
      }
      
      public function get hasTotalnum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalnum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalnum$field = param1;
      }
      
      public function get totalnum() : uint
      {
         return this.totalnum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFertilizerid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fertilizerid$field);
         }
         if(this.hasNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.num$field);
         }
         if(this.hasTotalnum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.totalnum$field);
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
                     throw new IOError("Bad data format: Cmd_Garden_BuyFertilizer_SC.fertilizerid cannot be set twice.");
                  }
                  _loc3_++;
                  this.fertilizerid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Garden_BuyFertilizer_SC.num cannot be set twice.");
                  }
                  _loc4_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Garden_BuyFertilizer_SC.totalnum cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalnum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
