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
   
   public final class Dto_SpringRewardBox extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SpringRewardBox";
      
      public static const INDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SpringRewardBox.index","index",1 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_SpringRewardBox.items","items",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const NEEDCREDITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SpringRewardBox.needCredits","needCredits",3 << 3 | WireType.VARINT);
      
      public static const ISOPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_SpringRewardBox.isOpen","isOpen",4 << 3 | WireType.VARINT);
       
      
      private var index$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var items:Array;
      
      private var needCredits$field:uint;
      
      private var isOpen$field:Boolean;
      
      public function Dto_SpringRewardBox()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SpringRewardBox.$MessageID;
      }
      
      public function clearIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.index$field = new uint();
      }
      
      public function get hasIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set index(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.index$field = param1;
      }
      
      public function get index() : uint
      {
         return this.index$field;
      }
      
      public function clearNeedCredits() : void
      {
         this.hasField$0 &= 4294967293;
         this.needCredits$field = new uint();
      }
      
      public function get hasNeedCredits() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set needCredits(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.needCredits$field = param1;
      }
      
      public function get needCredits() : uint
      {
         return this.needCredits$field;
      }
      
      public function clearIsOpen() : void
      {
         this.hasField$0 &= 4294967291;
         this.isOpen$field = new Boolean();
      }
      
      public function get hasIsOpen() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set isOpen(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.isOpen$field = param1;
      }
      
      public function get isOpen() : Boolean
      {
         if(!this.hasIsOpen)
         {
            return false;
         }
         return this.isOpen$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.index$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasNeedCredits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.needCredits$field);
         }
         if(this.hasIsOpen)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.isOpen$field);
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
                     throw new IOError("Bad data format: Dto_SpringRewardBox.index cannot be set twice.");
                  }
                  _loc3_++;
                  this.index = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SpringRewardBox.needCredits cannot be set twice.");
                  }
                  _loc4_++;
                  this.needCredits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SpringRewardBox.isOpen cannot be set twice.");
                  }
                  _loc5_++;
                  this.isOpen = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
