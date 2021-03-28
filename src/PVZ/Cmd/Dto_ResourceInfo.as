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
   
   public final class Dto_ResourceInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ResourceInfo";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ResourceInfo.type","type",1 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ResourceInfo.items","items",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ResourceInfo.coin","coin",3 << 3 | WireType.VARINT);
      
      public static const TICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ResourceInfo.ticket","ticket",4 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var items:Array;
      
      private var coin$field:uint;
      
      private var ticket$field:uint;
      
      public function Dto_ResourceInfo()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ResourceInfo.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearCoin() : void
      {
         this.hasField$0 &= 4294967293;
         this.coin$field = new uint();
      }
      
      public function get hasCoin() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set coin(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.coin$field = param1;
      }
      
      public function get coin() : uint
      {
         return this.coin$field;
      }
      
      public function clearTicket() : void
      {
         this.hasField$0 &= 4294967291;
         this.ticket$field = new uint();
      }
      
      public function get hasTicket() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set ticket(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.ticket$field = param1;
      }
      
      public function get ticket() : uint
      {
         return this.ticket$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.coin$field);
         }
         if(this.hasTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.ticket$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_ResourceInfo.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ResourceInfo.coin cannot be set twice.");
                  }
                  _loc4_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ResourceInfo.ticket cannot be set twice.");
                  }
                  _loc5_++;
                  this.ticket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
