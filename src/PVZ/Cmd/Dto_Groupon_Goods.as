package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Groupon_Goods extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Groupon_Goods";
      
      public static const GROUPCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Groupon_Goods.groupcost","groupcost",1 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Groupon_Goods.items","items",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const GROUPONSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_Groupon_Goods.grouponStatus","grouponStatus",3 << 3 | WireType.VARINT,GrouponStatus);
       
      
      private var groupcost$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var items:Array;
      
      private var grouponStatus$field:int;
      
      public function Dto_Groupon_Goods()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Groupon_Goods.$MessageID;
      }
      
      public function clearGroupcost() : void
      {
         this.hasField$0 &= 4294967294;
         this.groupcost$field = new uint();
      }
      
      public function get hasGroupcost() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set groupcost(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.groupcost$field = param1;
      }
      
      public function get groupcost() : uint
      {
         return this.groupcost$field;
      }
      
      public function clearGrouponStatus() : void
      {
         this.hasField$0 &= 4294967293;
         this.grouponStatus$field = new int();
      }
      
      public function get hasGrouponStatus() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set grouponStatus(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.grouponStatus$field = param1;
      }
      
      public function get grouponStatus() : int
      {
         return this.grouponStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasGroupcost)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.groupcost$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasGrouponStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.grouponStatus$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_Groupon_Goods.groupcost cannot be set twice.");
                  }
                  _loc3_++;
                  this.groupcost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Groupon_Goods.grouponStatus cannot be set twice.");
                  }
                  _loc4_++;
                  this.grouponStatus = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
