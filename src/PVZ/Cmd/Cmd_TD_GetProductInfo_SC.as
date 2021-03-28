package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TD_GetProductInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TD_GetProductInfo_SC";
      
      public static const COINPRODUCT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetProductInfo_SC.coinProduct","coinProduct",1 << 3 | WireType.VARINT);
      
      public static const LASTCOLLECTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetProductInfo_SC.lastCollectTime","lastCollectTime",2 << 3 | WireType.VARINT);
      
      public static const CANCOLLECT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TD_GetProductInfo_SC.canCollect","canCollect",3 << 3 | WireType.VARINT);
       
      
      private var coinProduct$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var lastCollectTime$field:uint;
      
      private var canCollect$field:Boolean;
      
      public function Cmd_TD_GetProductInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TD_GetProductInfo_SC.$MessageID;
      }
      
      public function clearCoinProduct() : void
      {
         this.hasField$0 &= 4294967294;
         this.coinProduct$field = new uint();
      }
      
      public function get hasCoinProduct() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set coinProduct(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.coinProduct$field = param1;
      }
      
      public function get coinProduct() : uint
      {
         return this.coinProduct$field;
      }
      
      public function clearLastCollectTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.lastCollectTime$field = new uint();
      }
      
      public function get hasLastCollectTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set lastCollectTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.lastCollectTime$field = param1;
      }
      
      public function get lastCollectTime() : uint
      {
         return this.lastCollectTime$field;
      }
      
      public function clearCanCollect() : void
      {
         this.hasField$0 &= 4294967291;
         this.canCollect$field = new Boolean();
      }
      
      public function get hasCanCollect() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set canCollect(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.canCollect$field = param1;
      }
      
      public function get canCollect() : Boolean
      {
         return this.canCollect$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCoinProduct)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.coinProduct$field);
         }
         if(this.hasLastCollectTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.lastCollectTime$field);
         }
         if(this.hasCanCollect)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.canCollect$field);
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
                     throw new IOError("Bad data format: Cmd_TD_GetProductInfo_SC.coinProduct cannot be set twice.");
                  }
                  _loc3_++;
                  this.coinProduct = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetProductInfo_SC.lastCollectTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.lastCollectTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetProductInfo_SC.canCollect cannot be set twice.");
                  }
                  _loc5_++;
                  this.canCollect = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
