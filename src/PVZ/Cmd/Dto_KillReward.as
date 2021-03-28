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
   
   public final class Dto_KillReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_KillReward";
      
      public static const TREASUREBOXID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_KillReward.treasureBoxId","treasureBoxId",1 << 3 | WireType.VARINT);
      
      public static const KILLPOS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_KillReward.killPos","killPos",2 << 3 | WireType.VARINT);
      
      public static const ITEMLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_KillReward.itemList","itemList",3 << 3 | WireType.LENGTH_DELIMITED,Dto_ItemInfo);
       
      
      private var treasureBoxId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var killPos$field:uint;
      
      public var itemList:Array;
      
      public function Dto_KillReward()
      {
         this.itemList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_KillReward.$MessageID;
      }
      
      public function clearTreasureBoxId() : void
      {
         this.hasField$0 &= 4294967294;
         this.treasureBoxId$field = new uint();
      }
      
      public function get hasTreasureBoxId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set treasureBoxId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.treasureBoxId$field = param1;
      }
      
      public function get treasureBoxId() : uint
      {
         return this.treasureBoxId$field;
      }
      
      public function clearKillPos() : void
      {
         this.hasField$0 &= 4294967293;
         this.killPos$field = new uint();
      }
      
      public function get hasKillPos() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set killPos(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.killPos$field = param1;
      }
      
      public function get killPos() : uint
      {
         return this.killPos$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasTreasureBoxId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.treasureBoxId$field);
         }
         if(this.hasKillPos)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.killPos$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.itemList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.itemList[_loc2_]);
            _loc2_++;
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
                     throw new IOError("Bad data format: Dto_KillReward.treasureBoxId cannot be set twice.");
                  }
                  _loc3_++;
                  this.treasureBoxId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_KillReward.killPos cannot be set twice.");
                  }
                  _loc4_++;
                  this.killPos = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.itemList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ItemInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
