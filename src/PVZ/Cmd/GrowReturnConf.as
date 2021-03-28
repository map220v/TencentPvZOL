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
   
   public final class GrowReturnConf extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.GrowReturnConf";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.GrowReturnConf.id","id",1 << 3 | WireType.VARINT);
      
      public static const ORDER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.GrowReturnConf.order","order",2 << 3 | WireType.VARINT);
      
      public static const OPEN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.GrowReturnConf.open","open",3 << 3 | WireType.VARINT);
      
      public static const MINLVL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.GrowReturnConf.minLvl","minLvl",4 << 3 | WireType.VARINT);
      
      public static const MKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.GrowReturnConf.mkValue","mkValue",5 << 3 | WireType.VARINT);
      
      public static const REWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.GrowReturnConf.rewardList","rewardList",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var order$field:uint;
      
      private var open$field:uint;
      
      private var minLvl$field:uint;
      
      private var mkValue$field:uint;
      
      public var rewardList:Array;
      
      public function GrowReturnConf()
      {
         this.rewardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return GrowReturnConf.$MessageID;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967294;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
      }
      
      public function clearOrder() : void
      {
         this.hasField$0 &= 4294967293;
         this.order$field = new uint();
      }
      
      public function get hasOrder() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set order(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.order$field = param1;
      }
      
      public function get order() : uint
      {
         return this.order$field;
      }
      
      public function clearOpen() : void
      {
         this.hasField$0 &= 4294967291;
         this.open$field = new uint();
      }
      
      public function get hasOpen() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set open(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.open$field = param1;
      }
      
      public function get open() : uint
      {
         return this.open$field;
      }
      
      public function clearMinLvl() : void
      {
         this.hasField$0 &= 4294967287;
         this.minLvl$field = new uint();
      }
      
      public function get hasMinLvl() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set minLvl(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.minLvl$field = param1;
      }
      
      public function get minLvl() : uint
      {
         return this.minLvl$field;
      }
      
      public function clearMkValue() : void
      {
         this.hasField$0 &= 4294967279;
         this.mkValue$field = new uint();
      }
      
      public function get hasMkValue() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set mkValue(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.mkValue$field = param1;
      }
      
      public function get mkValue() : uint
      {
         return this.mkValue$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasOrder)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.order$field);
         }
         if(this.hasOpen)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.open$field);
         }
         if(this.hasMinLvl)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.minLvl$field);
         }
         if(this.hasMkValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.mkValue$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardList[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GrowReturnConf.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GrowReturnConf.order cannot be set twice.");
                  }
                  _loc4_++;
                  this.order = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GrowReturnConf.open cannot be set twice.");
                  }
                  _loc5_++;
                  this.open = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GrowReturnConf.minLvl cannot be set twice.");
                  }
                  _loc6_++;
                  this.minLvl = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GrowReturnConf.mkValue cannot be set twice.");
                  }
                  _loc7_++;
                  this.mkValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.rewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
