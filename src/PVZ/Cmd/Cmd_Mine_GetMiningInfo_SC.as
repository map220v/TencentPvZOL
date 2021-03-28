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
   
   public final class Cmd_Mine_GetMiningInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mine_GetMiningInfo_SC";
      
      public static const MININGNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mine_GetMiningInfo_SC.miningNum","miningNum",1 << 3 | WireType.VARINT);
      
      public static const MININGCOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mine_GetMiningInfo_SC.miningCoin","miningCoin",2 << 3 | WireType.VARINT);
      
      public static const CANCOLLECTCOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mine_GetMiningInfo_SC.canCollectCoin","canCollectCoin",3 << 3 | WireType.VARINT);
       
      
      private var miningNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var miningCoin$field:uint;
      
      private var canCollectCoin$field:uint;
      
      public function Cmd_Mine_GetMiningInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mine_GetMiningInfo_SC.$MessageID;
      }
      
      public function clearMiningNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.miningNum$field = new uint();
      }
      
      public function get hasMiningNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set miningNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.miningNum$field = param1;
      }
      
      public function get miningNum() : uint
      {
         return this.miningNum$field;
      }
      
      public function clearMiningCoin() : void
      {
         this.hasField$0 &= 4294967293;
         this.miningCoin$field = new uint();
      }
      
      public function get hasMiningCoin() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set miningCoin(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.miningCoin$field = param1;
      }
      
      public function get miningCoin() : uint
      {
         return this.miningCoin$field;
      }
      
      public function clearCanCollectCoin() : void
      {
         this.hasField$0 &= 4294967291;
         this.canCollectCoin$field = new uint();
      }
      
      public function get hasCanCollectCoin() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set canCollectCoin(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.canCollectCoin$field = param1;
      }
      
      public function get canCollectCoin() : uint
      {
         return this.canCollectCoin$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMiningNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.miningNum$field);
         }
         if(this.hasMiningCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.miningCoin$field);
         }
         if(this.hasCanCollectCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.canCollectCoin$field);
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
                     throw new IOError("Bad data format: Cmd_Mine_GetMiningInfo_SC.miningNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.miningNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetMiningInfo_SC.miningCoin cannot be set twice.");
                  }
                  _loc4_++;
                  this.miningCoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetMiningInfo_SC.canCollectCoin cannot be set twice.");
                  }
                  _loc5_++;
                  this.canCollectCoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
