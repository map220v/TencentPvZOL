package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_RewardGroup extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RewardGroup";
      
      public static const MAXSELECTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RewardGroup.maxSelectCount","maxSelectCount",1 << 3 | WireType.VARINT);
      
      public static const ITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_RewardGroup.item","item",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNumOdd);
      
      public static const SHOW:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_RewardGroup.show","show",3 << 3 | WireType.VARINT);
       
      
      private var maxSelectCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var item:Array;
      
      private var show$field:Boolean;
      
      public function Dto_RewardGroup()
      {
         this.item = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RewardGroup.$MessageID;
      }
      
      public function clearMaxSelectCount() : void
      {
         this.hasField$0 &= 4294967294;
         this.maxSelectCount$field = new uint();
      }
      
      public function get hasMaxSelectCount() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set maxSelectCount(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.maxSelectCount$field = param1;
      }
      
      public function get maxSelectCount() : uint
      {
         return this.maxSelectCount$field;
      }
      
      public function clearShow() : void
      {
         this.hasField$0 &= 4294967293;
         this.show$field = new Boolean();
      }
      
      public function get hasShow() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set show(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.show$field = param1;
      }
      
      public function get show() : Boolean
      {
         return this.show$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasMaxSelectCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.maxSelectCount$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.item.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item[_loc2_]);
            _loc2_++;
         }
         if(this.hasShow)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.show$field);
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
                     throw new IOError("Bad data format: Dto_RewardGroup.maxSelectCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.maxSelectCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.item.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNumOdd()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RewardGroup.show cannot be set twice.");
                  }
                  _loc4_++;
                  this.show = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
